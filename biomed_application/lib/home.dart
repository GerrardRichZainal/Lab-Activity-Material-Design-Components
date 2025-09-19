import 'package:flutter/material.dart';
import 'product_list.dart';
import 'cart_item.dart';

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<CartItem> cart = [];

  @override
  Widget build(BuildContext context) {
    final pages = [
      ProductListPage(
        onAddToCart: (item) {
          setState(() {
            cart.add(item);
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Produk ditambahkan ke keranjang')),
          );
        },
      ),
      ProfilePage(username: widget.username, lastPurchased: cart),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('BioMed'),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  if (cart.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Keranjang kosong')),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text('Keranjang Belanja'),
                        content: SizedBox(
                          width: double.maxFinite,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: cart.length,
                            itemBuilder: (context, index) {
                              final item = cart[index];
                              return ListTile(
                                title: Text(item.title),
                                trailing: Text('\Rp${item.price.toStringAsFixed(2)}'),
                              );
                            },
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Tutup'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Check Out berhasil!')),
                              );
                              setState(() => cart.clear());
                            },
                            child: const Text('Check Out'),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
              if (cart.isNotEmpty)
                Positioned(
                  right: 6,
                  top: 6,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.red,
                    child: Text(
                      cart.length.toString(),
                      style: const TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  final String username;
  final List<CartItem> lastPurchased;

  const ProfilePage({super.key, required this.username, required this.lastPurchased});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Username: $username', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 20),
          Text('Barang terakhir dibeli:', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 10),
          lastPurchased.isEmpty
              ? const Text('Belum ada pembelian')
              : Expanded(
                  child: ListView.builder(
                    itemCount: lastPurchased.length,
                    itemBuilder: (context, index) {
                      final item = lastPurchased[index];
                      return ListTile(
                        title: Text(item.title),
                        trailing: Text('\Rp${item.price.toStringAsFixed(2)}'),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}

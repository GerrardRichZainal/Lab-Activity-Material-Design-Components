import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'product_list.dart';
import 'cart_item.dart';
import 'profile.dart';

class HomePage extends StatefulWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<CartItem> cart = [];
  final List<CartItem> purchaseHistory = [];

  final formatRupiah =
      NumberFormat.currency(locale: 'id', symbol: 'Rp', decimalDigits: 0);

  // Notifier untuk dark mode
  final ValueNotifier<bool> isDarkModeNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isDarkModeNotifier,
      builder: (context, isDarkMode, _) {
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
          ProfilePage(
            username: widget.username,
            lastPurchased: purchaseHistory,
          ),
        ];

        return Scaffold(
          backgroundColor: isDarkMode ? Colors.black : Colors.blue.shade50,
          appBar: AppBar(
            title: const Text('BioMed'),
            backgroundColor: isDarkMode ? Colors.grey[900] : Colors.blue.shade400,
            actions: [
              IconButton(
                icon: Icon(
                  isDarkMode ? Icons.light_mode : Icons.dark_mode,
                  color: Colors.white,
                ),
                onPressed: () {
                  isDarkModeNotifier.value = !isDarkModeNotifier.value;
                },
              ),
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
                            backgroundColor:
                                isDarkMode ? Colors.grey[900] : Colors.white,
                            title: const Text('Keranjang Belanja'),
                            content: SizedBox(
                              width: double.maxFinite,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: cart.length,
                                itemBuilder: (context, index) {
                                  final item = cart[index];
                                  return ListTile(
                                    title: Text(
                                      item.title,
                                      style: TextStyle(
                                        color: isDarkMode
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                    trailing: Text(
                                      formatRupiah.format(item.price),
                                      style: TextStyle(
                                        color: isDarkMode
                                            ? Colors.white70
                                            : Colors.black,
                                      ),
                                    ),
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
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: isDarkMode
                                      ? Colors.teal
                                      : Colors.blue.shade400,
                                ),
                                onPressed: () {
                                  setState(() {
                                    purchaseHistory.addAll(cart);
                                    cart.clear();
                                  });
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Check Out berhasil!')),
                                  );
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
                          style:
                              const TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
          body: pages[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: isDarkMode ? Colors.grey[900] : Colors.white,
            currentIndex: _currentIndex,
            selectedItemColor:
                isDarkMode ? Colors.tealAccent : Colors.blue.shade400,
            unselectedItemColor: isDarkMode ? Colors.white70 : Colors.black54,
            onTap: (index) => setState(() => _currentIndex = index),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            ],
          ),
        );
      },
    );
  }
}

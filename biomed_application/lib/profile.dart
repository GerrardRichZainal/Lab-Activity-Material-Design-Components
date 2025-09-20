import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'cart_item.dart';

class ProfilePage extends StatelessWidget {
  final String username;
  final List<CartItem> lastPurchased;

  const ProfilePage({
    super.key,
    required this.username,
    required this.lastPurchased,
  });

  @override
  Widget build(BuildContext context) {
    // Format Rupiah
    final formatRupiah = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Sign Out berhasil")),
              );
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Username
            Row(
              children: [
                const CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage('assets/images/logo.png'),
                ),
                const SizedBox(width: 15),
                Text(
                  username,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 25),

            const Text(
              "Barang terakhir dibeli:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),

            // List barang
            Expanded(
              child: lastPurchased.isEmpty
                  ? const Center(child: Text("Belum ada pembelian"))
                  : ListView.builder(
                      itemCount: lastPurchased.length,
                      itemBuilder: (context, index) {
                        final item = lastPurchased[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          child: ListTile(
                            leading: const Icon(Icons.shopping_bag),
                            title: Text(item.title),
                            trailing: Text(formatRupiah.format(item.price)),
                          ),
                        );
                      },
                    ),
            ),

            // Tombol sign out di bawah
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.logout),
                label: const Text("Sign Out"),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Sign Out berhasil")),
                  );
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

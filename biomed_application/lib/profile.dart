import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatelessWidget {
  final String username;
  final List<Map<String, dynamic>> lastPurchased;

  const ProfilePage({
    super.key,
    required this.username,
    required this.lastPurchased,
  });

  @override
  Widget build(BuildContext context) {
    // Formatter Rupiah
    final formatRupiah = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp',
      decimalDigits: 0,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Aksi sign out
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Berhasil Sign Out")),
              );
              Navigator.pop(context); // contoh balik ke halaman sebelumnya
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bagian profil
            Row(
              children: [
                const CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage("assets/images/biomed.png"), 
                  // ganti sesuai gambar profil default
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
                  ? const Center(
                      child: Text("Belum ada riwayat pembelian"),
                    )
                  : ListView.builder(
                      itemCount: lastPurchased.length,
                      itemBuilder: (context, index) {
                        final item = lastPurchased[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                item["image"], // ambil dari assets
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(item["title"]),
                            subtitle: Text(formatRupiah.format(item["price"])),
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

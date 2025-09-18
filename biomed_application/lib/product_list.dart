import 'package:flutter/material.dart';
import 'product_detail.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  final List<Map<String, String>> products = const [
    {"title": "Product 1", "image": "https://picsum.photos/200"},
    {"title": "Product 2", "image": "https://picsum.photos/201"},
    {"title": "Product 3", "image": "https://picsum.photos/202"},
    {"title": "Product 4", "image": "https://picsum.photos/203"},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProductDetailPage(
                  title: product["title"]!,
                  image: product["image"]!,
                ),
              ),
            );
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                Expanded(
                  child: Image.network(
                    product["image"]!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    product["title"]!,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

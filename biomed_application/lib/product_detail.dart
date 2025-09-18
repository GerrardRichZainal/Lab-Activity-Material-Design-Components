import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final String title;
  final String image;

  const ProductDetailPage({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(image, height: 250, fit: BoxFit.cover),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              title,
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "This is the detail of the product. You can add description, price, and more info here.",
              style: TextStyle(fontSize: 16),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart),
              label: const Text("Add to Cart"),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'cart_item.dart';

class ProductDetailPage extends StatelessWidget {
  final String title;
  final String image;
  final String description;
  final double price;
  final void Function(CartItem) onAddToCart;

  const ProductDetailPage({
    super.key,
    required this.title,
    required this.image,
    required this.description,
    required this.price,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(image, height: 250, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(description),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("\RP${price.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: () {
                onAddToCart(CartItem(title: title, image: image, price: price));
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Produk ditambahkan")));
              },
              icon: const Icon(Icons.shopping_cart),
              label: const Text("Add to Cart"),
            ),
          ),
        ],
      ),
    );
  }
}

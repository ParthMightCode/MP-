import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Cart")),
      body: cartProvider.items.isEmpty
          ? const Center(child: Text("Your cart is empty!"))
          : ListView.builder(
              itemCount: cartProvider.items.length,
              itemBuilder: (context, index) {
                final product = cartProvider.items[index];
                return ListTile(
                  leading: Image.network(product.image, width: 50, height: 50),
                  title: Text(product.name),
                  subtitle: Text("₹${product.price.toStringAsFixed(0)}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle),
                    onPressed: () => cartProvider.removeItem(product),
                  ),
                );
              },
            ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total: ₹${cartProvider.getTotalPrice().toStringAsFixed(0)}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement checkout logic
              },
              child: const Text("Checkout"),
            ),
          ],
        ),
      ),
    );
  }
}

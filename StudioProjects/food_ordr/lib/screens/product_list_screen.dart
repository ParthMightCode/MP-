import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product(
          name: "Classic Cheeseburger",
          price: 159,
          description: "Juicy beef patty with melted cheese & fresh veggies.",
          image: "assets/cheese_burger.png"),
      Product(
          name: "Spicy Chicken Burger",
          price: 179,
          description: "Crispy chicken fillet with spicy mayo & lettuce.",
          image: "assets/burger3.png"),
      Product(
          name: "BBQ Bacon Burger",
          price: 199,
          description: "Grilled patty with smoky BBQ sauce & crispy bacon.",
          image: "assets/burger3.png"),
      Product(
          name: "Veggie Delight",
          price: 149,
          description: "Loaded with fresh veggies & a creamy sauce.",
          image: "assets/burger4.png"),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.deepOrange],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: GridView.builder(
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 🔥 Two items per row
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              return ProductCard(product: products[index]);
            },
          ),
        ),
      ),
    );
  }
}

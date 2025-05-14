import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  final List<Product> trendingProducts = [
    Product(
      name: "Cheese Burst Burger",
      price: 149,
      description: "A juicy burger with double cheese, fresh veggies, and a soft bun.",
      image: "assets/cheese_burger.png",
    ),
    Product(
      name: "Spicy Chicken Burger",
      price: 179,
      description: "Spicy grilled chicken patty with lettuce & mayo.",
      image: "assets/burger3.png",
    ),
    Product(
      name: "Veg Supreme Burger",
      price: 129,
      description: "A crispy veg patty loaded with cheese & fresh veggies.",
      image: "assets/burger4.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark mode UI
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔥 Hero Section (Banner)
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.orange, Colors.deepOrangeAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  const Text(
                    "🔥 Hot Deals for You!",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Order now & get 20% off on your first purchase!",
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text("Explore Menu", style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🔥 Categories Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "🍔 Categories",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _buildCategoryItem("🍔 Burgers"),
                  _buildCategoryItem("🍟 Fries"),
                  _buildCategoryItem("🥤 Drinks"),
                  _buildCategoryItem("🍕 Pizzas"),
                  _buildCategoryItem("🌮 Wraps"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🔥 Trending Products Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "🔥 Trending Now",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: trendingProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                return ProductCard(product: trendingProducts[index]);
              },
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // 🔥 Category Widget
  Widget _buildCategoryItem(String category) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.orange, width: 1.5),
      ),
      child: Center(
        child: Text(
          category,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
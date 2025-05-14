import 'package:flutter/material.dart';

void main() {
  runApp(ECommerceApp());
}

class ECommerceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages.addAll([
      HomePage(onExploreProducts: () => _onItemTapped(1)),
      ProductsPage(),
      ProfilePage(),
      CartPage(),
    ]);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Commerce App'),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Products'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final VoidCallback onExploreProducts;

  HomePage({required this.onExploreProducts});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Welcome to the Home Page', style: TextStyle(fontSize: 18)),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: onExploreProducts,
            child: Text('Explore Products'),
          ),
        ],
      ),
    );
  }
}

class ProductsPage extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Product 1',
      'price': 100,
      'description': 'Description of Product 1',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'name': 'Product 2',
      'price': 200,
      'description': 'Description of Product 2',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'name': 'Product 3',
      'price': 300,
      'description': 'Description of Product 3',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'name': 'Product 4',
      'price': 400,
      'description': 'Description of Product 4',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'name': 'Product 5',
      'price': 500,
      'description': 'Description of Product 5',
      'image': 'https://via.placeholder.com/150',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return Card(
          child: ListTile(
            leading: Image.network(product['image']),
            title: Text(product['name']),
            subtitle: Text('₹${product['price']}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsPage(product: product),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  final Map<String, dynamic> product;

  ProductDetailsPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product['name'])),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.network(product['image'])),
            SizedBox(height: 16),
            Text(product['name'], style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('₹${product['price']}', style: TextStyle(fontSize: 20, color: Colors.green)),
            SizedBox(height: 16),
            Text(product['description'], style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile Page', style: TextStyle(fontSize: 18)),
    );
  }
}

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Your Cart is Empty', style: TextStyle(fontSize: 18)),
    );
  }
}

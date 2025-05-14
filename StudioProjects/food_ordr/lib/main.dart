import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BiteEase',
      theme: ThemeData.dark().copyWith( // Dark Theme 🌙
        primaryColor: Colors.orange,
        scaffoldBackgroundColor: Colors.black, // Black background for all screens
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black, // Dark AppBar
          foregroundColor: Colors.white, // White text/icons
        ),
        cardColor: Colors.grey[900], // Darker cards
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange, // Orange buttons
            foregroundColor: Colors.white,
          ),
        ),
      ),
      home: const SplashScreen(), // Start with the splash screen
    );
  }
}

import 'package:flutter/material.dart';
import './pages/curruncy_converter_material_page.dart'; // Ensure the correct import path

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Currency Converter',
      debugShowCheckedModeBanner: false,
      home: CurrencyConverterPage(), // Updated to match the correct page class
    );
  }
}

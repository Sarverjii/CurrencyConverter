import 'package:currency_converter/Widgets/DropDownItem.dart';
import 'package:flutter/material.dart';

class CurrencyConverterPage extends StatefulWidget {
  const CurrencyConverterPage({Key? key}) : super(key: key);

  @override
  _CurrencyConverterPageState createState() => _CurrencyConverterPageState();
}

class _CurrencyConverterPageState extends State<CurrencyConverterPage> {
  String? _selectedCurrency = 'USD';
  String? _displayCurrency = 'INR';
  final TextEditingController _amountController = TextEditingController();
  String _convertedAmount = '0';

  void _convertCurrency() {
    // Conversion rates to INR
    const toINR = {
      'USD': 83.0,
      'INR': 1.0,
      'Yen': 0.56, // Example rate: 1 Yen = 0.56 INR
      'Euro': 90.0, // Example rate: 1 Euro = 90 INR
    };

    // Conversion rates from INR
    const fromINR = {
      'USD': 0.012,
      'INR': 1.0,
      'Yen': 1.8, // Example rate: 1 INR = 1.8 Yen
      'Euro': 0.011, // Example rate: 1 INR = 0.011 Euro
    };

    final amount = double.tryParse(_amountController.text) ?? 0.0;

    // Convert amount to INR
    final amountInINR = amount * (toINR[_selectedCurrency] ?? 1.0);

    // Convert amount from INR to the desired currency
    final convertedAmount = amountInINR * (fromINR[_displayCurrency] ?? 1.0);

    setState(() {
      _convertedAmount = convertedAmount.toStringAsFixed(2);
    });
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark background
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Currency Converter',
            style: TextStyle(
                fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.grey[900], // Darker app bar color
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 40,
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[800], // Dark background for container
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  TextField(
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter the amount',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[700], // Darker gray background
                    ),
                  ),
                  const SizedBox(height: 20),
                  DropdownButton<String>(
                    value: _selectedCurrency,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedCurrency = newValue;
                      });
                    },
                    items: [
                      Dropdownitem(value: 'USD'),
                      Dropdownitem(value: 'INR'),
                      Dropdownitem(value: 'Yen'),
                      Dropdownitem(value: 'Euro'),
                    ],
                    dropdownColor: Colors.grey[900], // Dark dropdown background
                    itemHeight: 60,
                    isExpanded: true,
                    icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _convertCurrency,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal, // Button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 20),
                      elevation: 5,
                    ),
                    child: Text(
                      'Convert',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[800], // Dark background for container
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      _convertedAmount,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Light text color
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  DropdownButton<String>(
                    value: _displayCurrency,
                    onChanged: (String? newValue) {
                      setState(() {
                        _displayCurrency = newValue;
                        // Convert only when the button is pressed
                      });
                    },
                    items: [
                      Dropdownitem(value: 'USD'),
                      Dropdownitem(value: 'INR'),
                      Dropdownitem(value: 'Yen'),
                      Dropdownitem(value: 'Euro'),
                    ],
                    dropdownColor: Colors.grey[900], // Dark dropdown background
                    itemHeight: 60,
                    isExpanded: true,
                    icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

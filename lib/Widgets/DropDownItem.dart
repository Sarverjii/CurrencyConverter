import 'package:flutter/material.dart';

class Dropdownitem extends DropdownMenuItem<String> {
  final String value;

  Dropdownitem({Key? key, required this.value})
      : super(
          key: key,
          value: value,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            child: Text(
              value,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        );
}

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Function(String? value) onChanged;
  final String labelText;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  const CustomTextField({
    super.key,
    required this.onChanged,
    required this.labelText,
    required this.hintText,
    required this.keyboardType,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: onChanged,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          label: Text(labelText),
          hintText: hintText,
        ),
      ),
    );
  }
}
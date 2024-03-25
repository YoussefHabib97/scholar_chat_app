import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  // final String Function(String? value) validator;
  final Function(String? value) onChanged;
  final String labelText;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  const CustomTextFormField({
    super.key,
    // required this.validator,
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
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please type something';
          }
          return null;
        },
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

import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, dynamic message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message.toString(),
      ),
    ),
  );
}

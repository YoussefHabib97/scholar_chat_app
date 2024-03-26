import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  const ChatBubble({
    super.key,
    required this.text,
  });

  // Consider UnrestrictedBox in the future

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        // height: 32,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
            bottomLeft: Radius.circular(0),
          ),
          color: Theme.of(context).primaryColor.withAlpha(128),
        ),
        child: Text(text),
      ),
    );
  }
}

class ChatBubbleSecondary extends StatelessWidget {
  final String text;
  const ChatBubbleSecondary({
    super.key,
    required this.text,
  });

  // Consider UnrestrictedBox in the future

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        // height: 32,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
            bottomLeft: Radius.circular(0),
          ),
          color: Theme.of(context).primaryColor.withAlpha(128),
        ),
        child: Text(text),
      ),
    );
  }
}

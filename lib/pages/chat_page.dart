import 'package:flutter/material.dart';
import 'package:scholar_chat_app/widgets/chat_bubble.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  static const String route = 'chat_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        toolbarHeight: 64,
        title: Row(
          children: [
            CircleAvatar(
              radius: 32,
              backgroundColor: Theme.of(context).primaryColor.withAlpha(128),
              child: Image.asset('assets/images/scholar.png'),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text("Chat"),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) => const ChatBubble(),
      ),
    );
  }
}

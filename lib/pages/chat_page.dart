import 'package:flutter/material.dart';
import 'package:scholar_chat_app/constants.dart';
import 'package:scholar_chat_app/widgets/chat_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  static const String route = 'chat_page';

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final messageController = TextEditingController();

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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) => const ChatBubble(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: messageController,
              onSubmitted: (data) async {
                CollectionReference messages =
                    FirebaseFirestore.instance.collection(kMessagesCollection);
                await messages.add({
                  'text': data,
                });
                messageController.clear();
              },
              // keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: "Message",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                suffix: const Icon(Icons.send),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

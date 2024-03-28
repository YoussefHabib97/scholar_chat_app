import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholar_chat_app/cubits/chat_cubit/chat_cubit.dart';
import 'package:scholar_chat_app/models/message_model.dart';
import 'package:scholar_chat_app/widgets/chat_bubble.dart';

class ChatPage extends StatelessWidget {
  ChatPage({
    super.key,
  });

  static const String route = 'chat_page';

  static final messageController = TextEditingController();

  static final scrollController = ScrollController();

  List<MessageModel> messagesList = [];

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments as String;
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
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                "Chat",
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                return ListView.builder(
                  reverse: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  controller: scrollController,
                  itemCount: messagesList.length,
                  itemBuilder: (context, index) {
                    return messagesList[index].id == email
                        ? ChatBubble(
                            text: messagesList[index].text,
                          )
                        : ChatBubbleSecondary(
                            text: messagesList[index].text,
                          );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: messageController,
              onSubmitted: (data) async {
                if (data.isEmpty) {
                } else {
                  messageController.clear();
                  scrollController.animateTo(
                    0,
                    duration: const Duration(milliseconds: 750),
                    curve: Curves.fastOutSlowIn,
                  );
                }
              },
              textCapitalization: TextCapitalization.sentences,
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

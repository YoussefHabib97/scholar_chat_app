import 'package:flutter/material.dart';
import 'package:scholar_chat_app/constants.dart';
import 'package:scholar_chat_app/models/message_model.dart';
import 'package:scholar_chat_app/widgets/chat_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({
    super.key,
  });

  static const String route = 'chat_page';

  static final messageController = TextEditingController();

  static final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments as String;
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection(kMessagesCollection)
          .orderBy(kMessageCreatedAt, descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<MessageModel> messagesList = [];
          for (var message in snapshot.data!.docs) {
            messagesList.add(MessageModel.fromJson(message));
          }

          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Theme.of(context).primaryColor,
              toolbarHeight: 64,
              title: Row(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor:
                        Theme.of(context).primaryColor.withAlpha(128),
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
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: messageController,
                    onSubmitted: (data) async {
                      if (data.isEmpty) {
                      } else {
                        CollectionReference messages = FirebaseFirestore
                            .instance
                            .collection(kMessagesCollection);
                        await messages.add({
                          'id': email,
                          kMessageText: data,
                          kMessageCreatedAt: DateTime.now(),
                        });
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
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        }
      },
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:scholar_chat_app/constants.dart';
import 'package:scholar_chat_app/models/message_model.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  List<MessageModel> messagesList = [];

  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollection);

  Future<void> getMessages() async {
    List<MessageModel> messagesList = [];
    messages
        .orderBy(kMessageCreatedAt, descending: true)
        .snapshots()
        .listen((event) {
      for (var doc in event.docs) {
        messagesList.add(MessageModel.fromJson(doc));
      }
      emit(ChatSuccess());
    });
  }

  Future<void> sendMessage({
    required String text,
    required String email,
  }) async {
    try {
      await messages.add({
        'id': email,
        kMessageText: text,
        kMessageCreatedAt: DateTime.now(),
      });
    } catch (e) {}
  }
}

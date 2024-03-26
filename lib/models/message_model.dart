import 'package:scholar_chat_app/constants.dart';

class MessageModel {
  final String text;

  const MessageModel({
    required this.text,
  });

  factory MessageModel.fromJson(json) {
    return MessageModel(text: json[kMessageText]);
  }
}

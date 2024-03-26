import 'package:scholar_chat_app/constants.dart';

class MessageModel {
  final String id;
  final String text;
  final DateTime createdAt;

  const MessageModel({
    required this.id,
    required this.text,
    required this.createdAt,
  });

  factory MessageModel.fromJson(json) {
    return MessageModel(
      id: json['id'],
      text: json[kMessageText],
      createdAt: json['createdAt'].toDate() as DateTime,
    );
  }
}

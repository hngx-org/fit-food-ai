// To parse this JSON data, do
//
//     final conversation = conversationFromJson(jsonString);

import 'dart:convert';

Conversation conversationFromJson(String str) => Conversation.fromJson(json.decode(str));

String conversationToJson(Conversation data) => json.encode(data.toJson());

class Conversation {
  final String id;
  final List<ChatMessage> chatMessages;

  Conversation({
    required this.id,
    required this.chatMessages,
  });

  Conversation copyWith({
    String? id,
    List<ChatMessage>? chatMessages,
  }) =>
      Conversation(
        id: id ?? this.id,
        chatMessages: chatMessages ?? this.chatMessages,
      );

  factory Conversation.fromJson(Map<String, dynamic> json) => Conversation(
    id: json["id"],
    chatMessages: List<ChatMessage>.from(json["chat_messages"].map((x) => ChatMessage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "chat_messages": List<dynamic>.from(chatMessages.map((x) => x.toJson())),
  };
}

class ChatMessage {
  final String text;
  final String sender;
  final DateTime timestamp;

  ChatMessage({
    required this.text,
    required this.sender,
    required this.timestamp,
  });

  ChatMessage copyWith({
    String? text,
    String? sender,
    DateTime? timestamp,
  }) =>
      ChatMessage(
        text: text ?? this.text,
        sender: sender ?? this.sender,
        timestamp: timestamp ?? this.timestamp,
      );


  factory ChatMessage.botTyping() => ChatMessage(
    text: 'Bot is typing....',
    sender:'',
    timestamp: DateTime.now(),
  );

  factory ChatMessage.fromJson(Map<String, dynamic> json) => ChatMessage(
    text: json["text"],
    sender: json["sender"],
    timestamp: DateTime.parse(json["timestamp"]),
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "sender": sender,
    "timestamp": timestamp.toIso8601String(),
  };
}

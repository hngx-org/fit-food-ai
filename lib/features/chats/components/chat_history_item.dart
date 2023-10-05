import 'package:fit_food/features/chats/models/conversation.dart';
import 'package:fit_food/features/chats/view/chat_screen.dart';
import 'package:flutter/material.dart';

class ChatHistoryItem extends StatefulWidget {
  const ChatHistoryItem(this.conversation, {super.key, required this.tittle});

  final Conversation conversation;
  final String tittle;

  @override
  State<ChatHistoryItem> createState() => _ChatHistoryItemState();
}

class _ChatHistoryItemState extends State<ChatHistoryItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ChatScreen(convoId: widget.conversation.id),
              ));
        },
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(widget.tittle),
        ));
  }
}

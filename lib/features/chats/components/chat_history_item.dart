import 'package:fit_food/features/chats/models/conversation.dart';
import 'package:fit_food/features/chats/view/chat_screen.dart';
import 'package:flutter/material.dart';

import '../../../components/shared/app_colors.dart';
import '../../../components/shared/styles.dart';

class ChatHistoryItem extends StatefulWidget {
  const ChatHistoryItem(this.conversation, {super.key, required this.title});

  final Conversation conversation;
  final String title;

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
        child: Container(
          decoration: const BoxDecoration(),
          padding: const EdgeInsets.all(18.0),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 20,
              ),
              Column(
                children: [
                  Text(
                    widget.title,
                    style:
                        btnText.copyWith(color: kcTxtColorLight, fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

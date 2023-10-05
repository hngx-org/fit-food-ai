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
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                spreadRadius: 10,
                blurRadius: 5,
                offset: Offset(0, 7), // changes position of shadow
              ),
            ],
          ),
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Text(
                widget.title,
                style: btnText.copyWith(color: kcTxtColorLight, fontSize: 16),
              ),
            ],
          ),
        ));
  }
}

import 'package:fit_food/common/extensions/string_extensions.dart';
import 'package:fit_food/features/chats/models/conversation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../shared/app_colors.dart';
import '../shared/styles.dart';

class ChatLog extends StatelessWidget {
  const ChatLog({Key? key, required this.chatMessage}) : super(key: key);

  final ChatMessage chatMessage;

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('h:mm a').format(chatMessage.timestamp);
    return Row(
      mainAxisAlignment: chatMessage.sender == "user"
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: chatMessage.sender == "user"
                ? kcChatSentColor
                : kcChatRcvdColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(chatMessage.text.messageResponse),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  formattedDate,
                  style: btnText.copyWith(color: kcBtnColor, fontSize: 12),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

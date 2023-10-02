import 'package:fit_food/features/chats/data/models/chat_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../components/shared/app_colors.dart';
import '../../../components/shared/styles.dart';

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
          width: MediaQuery.of(context).size.width * 0.8,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: chatMessage.sender == "user"
                ? kcChatSentColor
                : kcChatRcvdColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: chatMessage.sender == "user"
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(chatMessage.text),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        formattedDate,
                        style:
                            btnText.copyWith(color: kcBtnColor, fontSize: 12),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                )
              : Container(
                  height: 400,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(chatMessage.text),
                        // Align(
                        //   alignment: Alignment.bottomRight,
                        //   child: Text(
                        //     formattedDate,
                        //     style: btnText.copyWith(
                        //         color: kcBtnColor, fontSize: 12),
                        //     textAlign: TextAlign.right,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}

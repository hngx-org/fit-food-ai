import 'package:fit_food/components/shared/app_colors.dart';
import 'package:flutter/material.dart';

class BotTypingWidget extends StatelessWidget {
  const BotTypingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: kcChatRcvdColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("typing..."),
        ],
      ),
    );
  }
}

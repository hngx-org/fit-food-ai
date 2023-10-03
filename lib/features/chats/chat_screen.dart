import 'package:fit_food/components/widgets/chat_log.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../components/shared/app_colors.dart';
import '../../components/shared/styles.dart';
import '../onboarding/data/models/chat_screen_model.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  static const routeName = '/chats';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<ChatMessage> testMessages = [
    ChatMessage(
        text: "The world is only incomplete",
        sender: "user",
        timestamp: DateTime.now()),
    ChatMessage(
        text: "The world is only incomplete",
        sender: "user",
        timestamp: DateTime.now()),
    ChatMessage(
        text: "The world is only incomplete",
        sender: "user",
        timestamp: DateTime.now()),
    ChatMessage(
        text: "The world is only incomplete",
        sender: "user",
        timestamp: DateTime.now()),
    ChatMessage(
        text: "The world is only incomplete",
        sender: "",
        timestamp: DateTime.now()),
    ChatMessage(
        text: "The world is only incomplete",
        sender: "user",
        timestamp: DateTime.now()),
    ChatMessage(
        text: "The world is only incomplete",
        sender: "",
        timestamp: DateTime.now()),
    ChatMessage(
        text: "The world is only incomplete",
        sender: "",
        timestamp: DateTime.now()),
    ChatMessage(
        text: "The world is only incomplete",
        sender: "user",
        timestamp: DateTime.now()),
    ChatMessage(
        text: "The world is only incomplete",
        sender: "user",
        timestamp: DateTime.now()),
  ];

  final messageController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    messageController.dispose();
    super.dispose();
  }

  _sendMessage(TextEditingController controller) {
    if (controller.text.isNotEmpty) {
      setState(() {
        testMessages.add(ChatMessage(
            sender: "user",
            text: controller.text.toString(),
            timestamp: DateTime.now()));
        controller.text = "";
      });
      controller.clear();
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings_outlined),
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good Morning",
              style: smallText.copyWith(color: kcTxtColorDark, fontSize: 12),
            ),
            Text(
              "User name",
              style: btnText.copyWith(color: kcTxtColorDark, fontSize: 16),
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: testMessages.length,
                  itemBuilder: (contet, index) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        ChatLog(chatMessage: testMessages[index]),
                      ],
                    );
                  }),
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TextField(
                    // controller: messageController,
                    controller: messageController,
                    decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kcBtnColor, width: .5),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kcBtnColor, width: .5),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        hintText: 'Type a message'),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 30),
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: kcBtnColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        _sendMessage(messageController);
                      },
                      child: const Icon(IconlyLight.send, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

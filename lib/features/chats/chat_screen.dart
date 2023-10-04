import 'package:fit_food/common/base/base_view_model.dart';
import 'package:fit_food/common/models/app_user.dart';
import 'package:fit_food/common/viewmodels/user_view_model.dart';
import 'package:fit_food/components/widgets/chat_log.dart';
import 'package:fit_food/features/chats/view_model/chat_view_model.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
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
    messageController.dispose();
    super.dispose();
  }

  _sendMessage(TextEditingController controller) {
    if (controller.text.isNotEmpty) {
      Provider.of<ChatViewModel>(context, listen: false).sendMessage(
          ChatMessage(
              sender: "user",
              text: controller.text.toString(),
              timestamp: DateTime.now()));

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
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/settings'),
            icon: const Icon(IconlyLight.setting),
          ),
        ],
        leading: IconButton(
          icon: Image.asset(smallLogo),
          onPressed: () {},
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good Morning",
              style: smallText.copyWith(color: kcTxtColorDark, fontSize: 12),
            ),
            AppUiStateBinding.bind<UserViewModel, AppUser?>(
                value: (vm) => vm.user,
                to: (context, state, vm) {
                  return Text(
                    state?.name ?? "Guest",
                    style:
                        btnText.copyWith(color: kcTxtColorDark, fontSize: 16),
                  );
                }),
          ],
        ),
      ),
      body: Consumer<ChatViewModel>(builder: (context, state, widget) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          child: Column(
            children: [
              Expanded(
                child: ScrollablePositionedList.builder(
                    itemCount: state.messages.length,
                    itemScrollController: state.scrollController,
                    reverse: true,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          ChatLog(
                              chatMessage:
                                  state.messages.reversed.toList()[index]),
                        ],
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextField(
                        // controller: messageController,
                        controller: messageController,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 18, vertical: 18),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: kcBtnColor, width: .5),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: kcBtnColor, width: .5),
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
                    InkWell(
                      onTap: () {
                        _sendMessage(messageController);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(left: 6),
                        padding: const EdgeInsets.all(16),
                        decoration: const BoxDecoration(
                          color: kcBtnColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child:
                            const Icon(IconlyLight.send, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

import 'package:fit_food/components/shared/app_colors.dart';
import 'package:fit_food/features/chats/components/chat_history_item.dart';
import 'package:fit_food/features/chats/view/chat_screen.dart';
import 'package:fit_food/features/chats/view_model/conversations_history_view_model.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

import '../../../common/base/base_view_model.dart';
import '../../../common/models/app_user.dart';
import '../../../common/viewmodels/user_view_model.dart';
import '../../../components/shared/styles.dart';

class ChatHistoryScreen extends StatefulWidget {
  const ChatHistoryScreen({super.key});

  @override
  State<ChatHistoryScreen> createState() => _ChatHistoryScreenState();
}

class _ChatHistoryScreenState extends State<ChatHistoryScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ConversationsViewModel>(context, listen: false)
          .getAllConversations();
    });
    super.initState();
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: kcBtnColor,
        foregroundColor: Colors.white,
        child: const Icon(Icons.message),
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ChatScreen(),
            )),
      ),
      body: SafeArea(
        child:
            Consumer<ConversationsViewModel>(builder: (context, state, child) {
          return Column(
            children: [
              Expanded(
                child: state.conversations.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                                image: AssetImage('assets/conversation.png'),
                                width: MediaQuery.of(context).size.width * 0.7),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'NO CONVERSATIONS YET',
                              style: skipText.copyWith(color: kcTxtColorLight,fontSize: 14),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: state.conversations.length,
                        itemBuilder: (context, index) => ChatHistoryItem(
                          state.conversations[index],
                          title: 'Conversation ${index + 1}',
                        ),
                      ),
              )
            ],
          );
        }),
      ),
    );
  }
}

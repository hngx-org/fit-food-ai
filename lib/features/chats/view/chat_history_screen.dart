import 'package:fit_food/components/shared/app_colors.dart';
import 'package:fit_food/features/chats/components/chat_history_item.dart';
import 'package:fit_food/features/chats/view/chat_screen.dart';
import 'package:fit_food/features/chats/view_model/conversations_history_view_model.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

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
        // backgroundColor: Colors.white,
        centerTitle: true,
        // surfaceTintColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/settings'),
            icon: const Icon(IconlyLight.setting),
          ),
        ],
        title: const Text('Chat History'),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 10),
              //   child: Text(
              //     'Conversation History',
              //     style: nameText.copyWith(
              //         color: kcTxtColorLight,
              //         fontSize: 20,
              //         fontWeight: FontWeight.w500),
              //   ),
              // ),
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
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'NO CONVERSATIONS YET',
                              style: skipText.copyWith(
                                  color: kcTxtColorLight, fontSize: 14),
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

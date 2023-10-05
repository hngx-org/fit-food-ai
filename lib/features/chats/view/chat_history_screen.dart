import 'package:fit_food/components/shared/app_colors.dart';
import 'package:fit_food/features/chats/components/chat_history_item.dart';
import 'package:fit_food/features/chats/view/chat_screen.dart';
import 'package:fit_food/features/chats/view_model/conversations_history_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                      ? const Center(
                          child: Text('NO CONVERSATIONS YET'),
                        )
                      : ListView.builder(
                          itemCount: state.conversations.length,
                          itemBuilder: (context, index) => ChatHistoryItem(
                            state.conversations[index],
                            tittle: 'Conversation ${index + 1}',
                          ),
                        ))
            ],
          );
        }),
      ),
    );
  }
}

import 'dart:developer';

import 'package:fit_food/common/base/base_view_model.dart';
import 'package:fit_food/features/chats/data/data_sources/conversation_storage.dart';
import 'package:fit_food/features/chats/models/conversation.dart';
import 'package:fit_food/features/chats/view_model/conversations_history_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatEvents extends NavigationEvent {}

class CreateConversationEvent extends ChatEvents {
  final String message;
  final String id;

  CreateConversationEvent(this.message, this.id);

  @override
  Future<void> navigate(BuildContext context) async {
    super.navigate(context);

    log("called EVENT");
    Provider.of<ConversationsViewModel>(context, listen: false)
        .createConversation(id, message);
  }
}

class AddMessageEvent extends ChatEvents {
  final ChatMessage message;
  final String id;

  AddMessageEvent(this.message, this.id);

  @override
  Future<void> navigate(BuildContext context) async {
    super.navigate(context);

    ConversationsStorage().addMessageToConversation(id, message);


  }
}

class GetConversationsEvent extends ChatEvents {
  // GetConversationsEvent();

  @override
  Future<void> navigate(BuildContext context) async {
    super.navigate(context);

    //   TODO: GET CONVERSATION
  }
}
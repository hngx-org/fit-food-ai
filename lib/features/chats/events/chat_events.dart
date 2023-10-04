import 'package:fit_food/common/base/base_view_model.dart';
import 'package:flutter/material.dart';

class ChatEvents extends NavigationEvent {}

class CreateConversationEvent extends ChatEvents {
  final String message;
  final String id;

  CreateConversationEvent(this.message, this.id);

  @override
  Future<void> navigate(BuildContext context) async {
    super.navigate(context);

    //   TODO: CREATE CONVERSATION
  }
}

class AddMessageEvent extends ChatEvents {
  final String message;
  final String id;

  AddMessageEvent(this.message, this.id);

  @override
  Future<void> navigate(BuildContext context) async {
    super.navigate(context);

    //   TODO: CREATE CONVERSATION
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

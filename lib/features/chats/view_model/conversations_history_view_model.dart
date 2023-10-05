import 'dart:developer';

import 'package:fit_food/features/chats/data/data_sources/conversation_storage.dart';
import 'package:fit_food/features/chats/models/conversation.dart';
import 'package:flutter/foundation.dart';
// Import your ConversationsStorage class

class ConversationsViewModel extends ChangeNotifier {
  final ConversationsStorage _storage = ConversationsStorage();

  List<Conversation> _conversations = [];

  List<Conversation> get conversations => _conversations;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> getAllConversations() async {
    isLoading = true;
    _conversations = await _storage.getAllConversations();
    isLoading = false;
    notifyListeners();
  }

  Future<void> createConversation(String conversationId, String message) async {

    log('CREATING CONVO');
    await _storage.createConversation(conversationId, message);
    log('CONVO CREATED');

    getAllConversations();
    // notifyListeners();
  }

  Future<void> deleteConversation(String conversationId) async {
    await _storage.deleteConversation(conversationId);
    _conversations.removeWhere((conv) => conv.id == conversationId);
    notifyListeners();
  }
}

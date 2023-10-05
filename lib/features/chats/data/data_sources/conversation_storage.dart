import 'dart:convert';
import 'package:fit_food/core/helpers/storage_helper.dart';
import 'package:fit_food/features/chats/models/conversation.dart';

class ConversationsStorage {
  final String _key = 'conversations';

  Future<void> createConversation(
      String conversationId, String initialMessageText) async {
    final ChatMessage initialMessage = ChatMessage(
      text: initialMessageText,
      sender: "user",
      timestamp: DateTime.now(),
    );

    final List<Conversation> conversations = await getAllConversations();
    final conversationIndex =
        conversations.indexWhere((conv) => conv.id == conversationId);

    if (conversationIndex != -1) {
      conversations[conversationIndex].chatMessages.add(initialMessage);
    } else {
      final newConversation =
          Conversation(id: conversationId, chatMessages: [initialMessage]);
      conversations.add(newConversation);
    }

    await _saveConversations(conversations);
  }

  Future<void> addMessageToConversation(
      String conversationId, ChatMessage message) async {
    final List<Conversation> conversations = await getAllConversations();
    final conversationIndex =
        conversations.indexWhere((conv) => conv.id == conversationId);

    if (conversationIndex != -1) {
      conversations[conversationIndex].chatMessages.add(message);
    } else {
      // Create a new conversation if it doesn't exist
      final newConversation =
          Conversation(id: conversationId, chatMessages: [message]);
      conversations.add(newConversation);
    }

    await _saveConversations(conversations);
  }

  Future<List<Conversation>> getAllConversations() async {
    final String? conversationsJson = await StorageHelper.getString(_key);

    if (conversationsJson != null) {
      final List<dynamic> conversationsList = jsonDecode(conversationsJson);
      final List<Conversation> conversations = conversationsList
          .map((conversationJson) => Conversation.fromJson(
              Map<String, dynamic>.from(conversationJson)))
          .toList();
      return conversations;
    } else {
      return [];
    }
  }

  Future<Conversation?> getConversationById(String conversationId) async {
    final List<Conversation> conversations = await getAllConversations();
    final conversation = conversations.firstWhere(
        (conv) => conv.id == conversationId,
        orElse: () => Conversation(id: conversationId, chatMessages: []));

    return conversation;
  }

  Future<void> _saveConversations(List<Conversation> conversations) async {
    final List<Map<String, dynamic>> conversationsJsonList =
        conversations.map((conversation) => conversation.toJson()).toList();
    final conversationsJson = jsonEncode(conversationsJsonList);
    StorageHelper.setString(_key, conversationsJson);
  }

  Future<void> deleteAllConversations() async {
    StorageHelper.remove(_key);
  }

  Future<void> deleteConversation(String conversationId) async {
    final List<Conversation> conversations = await getAllConversations();
    final conversationIndex =
        conversations.indexWhere((conv) => conv.id == conversationId);

    if (conversationIndex != -1) {
      conversations.removeAt(conversationIndex);
      await _saveConversations(conversations);
    }
  }
}

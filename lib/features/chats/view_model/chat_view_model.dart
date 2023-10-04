import 'dart:math';

import 'package:either_dart/either.dart';
import 'package:fit_food/common/base/base_view_model.dart';
import 'package:fit_food/core/constants/messages.dart';
import 'package:fit_food/features/chats/data/repository/IchatRepository.dart';
import 'package:fit_food/features/chats/events/chat_events.dart';
import 'package:fit_food/features/chats/models/conversation.dart';
import 'package:uuid/uuid.dart';

import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ChatViewModel extends BaseViewModel {
  final IChatRepository _chatRepository;

  ChatViewModel(this._chatRepository);

  bool _botTyping = false;
  bool _messageLoading = false;

  String? _convoId;

  bool get messageLoading => _messageLoading;

  set messageLoading(bool value) {
    _messageLoading = value;
    notifyListeners();
  }

  final _scrollController = ItemScrollController();

  get scrollController => _scrollController;

  bool get botTyping => _botTyping;

  set botTyping(bool value) {
    _botTyping = value;
    notifyListeners();
  }

  List<ChatMessage> _messages = [];

  List<ChatMessage> get messages => _messages;

  set messages(List<ChatMessage> value) {
    _messages = value;
  }

  Future<void> sendMessage(
      {String? convoId, required ChatMessage message}) async {
    _messages.add(message);

    log(_messages.length);

    botTyping = true;
    notifyListeners();

    if (convoId != null && _convoId == null) {
      final history = _messages.map((e) => e.text).toList();
      var result = await _chatRepository.getChatWithHistory(
          history: history, message: message.text);
      navigator.dispatch(AddMessageEvent(message.text, convoId));

      result.fold((left) => null, (right) => null);
    } else {
      var uuid = const Uuid().v4();
      final result =
          _chatRepository.startChatWithMessage(message: message.text);
      result.fold((left) {
        // TODO: CHECK FOR RESPONSE IF CREDITS ARE FINISHED
        return null;
      }, (right) {
        _messages.add(
            ChatMessage(text: right, sender: '', timestamp: DateTime.now()));
        notifyListeners();
        navigator.dispatch(CreateConversationEvent(message.text, uuid));
      });
      notifyListeners();
    }
  }

  Future<void> getMessages(String convoId) async {
    messageLoading = true;
    var conversation = _chatRepository.getConversation(id: convoId);
    conversation.fold((left) {
      messageLoading = false;
      notifyListeners();
      // TODO: DISPATCH GET MESSAGES FAILED STATE
    }, (right) {
      messageLoading = false;

      if (messages.isEmpty) {
        messages.add(ChatMessage(
            sender: "", text: fitnessBotGreeting, timestamp: DateTime.now()));
        notifyListeners();
      }

      messages = right.chatMessages;
    });
  }

  void simulateResponse(ChatMessage message) {
    Random r = Random();
    var any = greetingMessages.where(
        (element) => element.toUpperCase() == message.text.toUpperCase());

    if (any.isNotEmpty) {
      var randomIndex = r.nextInt(greetingRESPONSE.length - 1);
      _messages.add(
        ChatMessage(
            text: greetingRESPONSE[randomIndex],
            sender: "",
            timestamp: DateTime.now()),
      );

      notifyListeners();
      _scrollTo();
    } else {
      var randomIndex = r.nextInt(foodAdvice.length - 1);
      _messages.add(
        ChatMessage(
            text: foodAdvice[randomIndex],
            sender: "",
            timestamp: DateTime.now()),
      );

      notifyListeners();
      _scrollTo();
    }
  }

  _scrollTo() {
    _scrollController.scrollTo(
        index: 0,
        // alignment: 0.5,
        duration: const Duration(milliseconds: 300));
  }
}

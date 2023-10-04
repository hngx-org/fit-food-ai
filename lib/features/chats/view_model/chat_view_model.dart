import 'dart:math';

import 'package:fit_food/common/base/base_view_model.dart';
import 'package:fit_food/core/constants/messages.dart';
import 'package:fit_food/features/onboarding/data/models/chat_screen_model.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ChatViewModel extends BaseViewModel {
  bool _botTyping = false;
  final _scrollController = ItemScrollController();

  get scrollController => _scrollController;

  bool get botTyping => _botTyping;

  set botTyping(bool value) {
    _botTyping = value;
    notifyListeners();
  }

  final List<ChatMessage> _messages = [
    ChatMessage(sender: "", text: fitnessBotGreeting, timestamp: DateTime.now())
  ];

  List<ChatMessage> get messages => _messages;

  Future<void> sendMessage(ChatMessage message) async {
    _messages.add(message);
    botTyping = true;

    Future.delayed(const Duration(milliseconds: 500))
        .then((value) => simulateResponse(message));
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

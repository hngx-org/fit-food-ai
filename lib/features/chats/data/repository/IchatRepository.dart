import 'package:either_dart/either.dart';
import 'package:fit_food/common/models/app_error.dart';
import 'package:fit_food/features/chats/models/conversation.dart';

abstract class IChatRepository {
  Future<Either<AppError, String>> getChatWithHistory(
      {required List<String> history, required String message});

  Future<Either<AppError, String>> startChatWithMessage({
    required String message,
  });

  Future<Either<AppError, Conversation>> getConversation({
    required String id,
  });
}

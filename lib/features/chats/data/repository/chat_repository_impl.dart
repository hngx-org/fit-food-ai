import 'dart:developer';
import 'package:either_dart/src/either.dart';
import 'package:fit_food/common/models/app_error.dart';
import 'package:fit_food/core/helpers/package_consuming_helper.dart';
import 'package:fit_food/core/helpers/storage_helper.dart';
import 'package:fit_food/features/chats/data/data_sources/conversation_storage.dart';
import 'package:fit_food/features/chats/data/repository/IchatRepository.dart';
import 'package:fit_food/features/chats/models/conversation.dart';
import 'package:hngx_openai/repository/openai_repository.dart';

class ChatRepositoryImpl extends IChatRepository {
  final OpenAIRepository _openAI = OpenAIRepository();
  final ConversationsStorage _conversationsStorage = ConversationsStorage();

  @override
  Future<Either<AppError, String>> getChatWithHistory(
      {required List<String> history, required String message}) async {
    String? cookie = await StorageHelper.getString('cookie');

    log(cookie.toString());

    return PackageConsumingHelper.makeRequest<AppError, String>(
        () => _openAI.getChatCompletions(history, message, cookie ?? ''),
        successResponse: (response) {
      return response;
    }, errorResponse: (error) {
      log(error.message);
      return error;
    });
  }

  @override
  Future<Either<AppError, String>> startChatWithMessage(
      {required String message}) async {
    String? cookie = await StorageHelper.getString('cookie');
    log(cookie.toString());

    return PackageConsumingHelper.makeRequest<AppError, String>(
        () => _openAI.getChat(message, cookie ?? ''),
        successResponse: (response) {
      return response;
    }, errorResponse: (error) {
      log(error.message);
      return error;
    });
  }

  @override
  Future<Either<AppError, Conversation>> getConversation(
      {required String id}) async {
    try {
      var conversation = await _conversationsStorage.getConversationById(id);

      if (conversation != null) {
        return Right(conversation);
      } else {
        return Left(AppError(message: "Something went wrong", code: 400));
      }
    } on Exception catch (e) {
      return Left(AppError.fromException(e));
    }
  }
}

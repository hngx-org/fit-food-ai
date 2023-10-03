import 'package:hng_authentication/authentication.dart';

class AppError {
  final String message;
  final String? details;
  final int code;

  AppError({required this.message, this.details, required this.code});

  factory AppError.generic({required String message, String? details}) =>
      AppError(message: message, code: -1, details: details);

  factory AppError.fromException(Exception exception) {
    // Convert different exception types to AppError

    if (exception is ApiException) {
      return AppError(message: exception.message, code: 400);
    }
    return AppError.generic(
      message: exception.toString(),
    );
  }
}

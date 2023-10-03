import 'package:either_dart/either.dart';
import 'package:fit_food/common/models/app_error.dart';
import 'package:hng_authentication/src/models/user.dart';

abstract class IAuthRepository {
  Future<Either<AppError, User>> login(
      {required String email, required String password});

  Future<Either<AppError, User>> signUp(
      {required String email, required String name, required String password});
}

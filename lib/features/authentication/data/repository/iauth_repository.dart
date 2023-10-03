import 'package:either_dart/either.dart';
import 'package:fit_food/common/models/app_error.dart';
import 'package:fit_food/common/models/app_user.dart';


abstract class IAuthRepository {
  Future<Either<AppError, AppUser>> login(
      {required String email, required String password});

  Future<Either<AppError, AppUser>> signUp(
      {required String email, required String name, required String password});
}

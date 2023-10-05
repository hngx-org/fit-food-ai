import 'package:either_dart/either.dart';
import 'package:fit_food/common/models/app_error.dart';
import 'package:fit_food/common/models/app_user.dart';

abstract class IUserRepository {
  Future<Either<AppError, AppUser>> getUser();

  Future<Either<AppError, AppUser>> getCachedUser();

  Future cacheUseData({required AppUser user});
}

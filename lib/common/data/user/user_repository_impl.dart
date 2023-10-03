import 'dart:convert';
import 'dart:developer';

import 'package:either_dart/either.dart';
import 'package:fit_food/common/data/user/iuser_repository.dart';
import 'package:fit_food/common/models/app_error.dart';
import 'package:fit_food/common/models/app_user.dart';
import 'package:fit_food/core/constants/storage_keys.dart';
import 'package:fit_food/core/helpers/package_consuming_helper.dart';
import 'package:fit_food/core/helpers/storage_helper.dart';
import 'package:hng_authentication/authentication.dart';
import 'package:hng_authentication/src/models/user.dart';

class UserRepositoryImpl extends IUserRepository {
  final _auth = Authentication();

  @override
  Future<Either<AppError, AppUser>> getUser() async {
    return PackageConsumingHelper.makeRequest<AppError, AppUser>(
        () => _auth.getUser(), successResponse: (response) {
      log(response.runtimeType.toString());
      return AppUser.fromAuthUser(response as User);
    }, errorResponse: (error) {
      log(error.message);
      return error;
    });
  }

  @override
  Future cacheUseData({required AppUser user}) async {
    var userJson = jsonEncode(user.toJson());
    StorageHelper.setString(StorageKeys.userData, userJson);
  }

  @override
  Future<Either<AppError, AppUser>> getCachedUser() async {
    var userString = await StorageHelper.getString(
      StorageKeys.userData,
    );

    try {
      if (userString != null) {
        var userJson = jsonDecode(userString);
        return Right(AppUser.fromJson(userJson));
      } else {
        return Left(AppError(message: " Failed to get cached user", code: 400));
      }
    } on Exception catch (e) {
      return Left(AppError(message: " Failed to get cached user", code: 400));
    }
  }
}

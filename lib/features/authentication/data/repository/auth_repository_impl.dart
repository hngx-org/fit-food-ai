import 'dart:developer';
import 'package:either_dart/src/either.dart';
import 'package:fit_food/common/models/app_error.dart';
import 'package:fit_food/common/models/app_user.dart';
import 'package:fit_food/core/helpers/package_consuming_helper.dart';
import 'package:hng_authentication/authentication.dart';
import 'iauth_repository.dart';
import 'package:hng_authentication/src/models/user.dart';

class AuthRepositoryImpl extends IAuthRepository {
  final _auth = Authentication();

  @override
  Future<Either<AppError, AppUser>> login(
      {required String email, required String password}) async {
    return PackageConsumingHelper.makeRequest<AppError, AppUser>(
        () => _auth.signIn(email, password), successResponse: (response) {
      return AppUser.fromAuthUser((response as User));
    }, errorResponse: (error) {
      log(error.message);
      return error;
    });
  }

  @override
  Future<Either<AppError, AppUser>> signUp(
      {required String email, required String name, required String password}) {
    return PackageConsumingHelper.makeRequest<AppError, AppUser>(
        () => _auth.signUp(email, name, password), successResponse: (response) {
      log(response.runtimeType.toString());
      return AppUser.fromAuthUser(response);
    }, errorResponse: (error) {
      log(error.message);
      return error;
    });
  }
}

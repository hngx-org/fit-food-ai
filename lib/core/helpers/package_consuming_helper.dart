import 'dart:developer';

import 'package:either_dart/either.dart';
import 'package:fit_food/common/models/app_error.dart';
import 'package:fit_food/core/helpers/network_utils.dart';
import 'package:hng_authentication/src/models/failure.dart';

/// This  is a helper class for consuming the packages,
/// it takes in a function [Future<dynamic> Function() request], and returns Either[T] or [S]
/// it also accepts three callback functions that provides the response from the request if succesful,
///  error[AppError] if an error occurred and a callback functions to handle internet connectivity error[networkErrorResponse]
class PackageConsumingHelper {
  PackageConsumingHelper._();

  static Future<Either<T, S>> makeRequest<T, S>(
    Future<dynamic> Function() request, {
    /// Called when request is successful
    required S Function(dynamic data) successResponse,

    /// Called when request failed
    required T Function(AppError data) errorResponse,

    /// Called when there is no network connectivity
    T Function()? networkErrorResponse,
  }) async {
    try {
      var isNetworkActive = await NetworkUtils.hasNetwork();
      if (isNetworkActive) {
        var response = await request();
        log((response.toString()));
        return Right(successResponse(response));
      } else {
        var error = AppError(message: 'No internet connection', code: 400);
        log("NO NETWORK");
        return networkErrorResponse != null
            ? Left(networkErrorResponse())
            : Left(error as T);
      }
    } on Exception catch (e) {
      log("EXCEPTION${e.toString()}");
      return Left(errorResponse(AppError.fromException(e)));
    } on Failure catch (e) {
      log("FAILURE EXCEPTION ${e.message}");
      return Left(errorResponse(AppError(
        message: e.message,
        code: 400,
      )));
    }
  }
}

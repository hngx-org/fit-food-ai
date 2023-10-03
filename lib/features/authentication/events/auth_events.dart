import 'package:fit_food/common/base/base_view_model.dart';
import 'package:fit_food/core/utils/app_utils.dart';
import 'package:fit_food/core/utils/custom_snack_bar.dart';
import 'package:flutter/material.dart';

abstract class AuthEvent extends NavigationEvent {}

class LoginSuccess extends AuthEvent {

  @override
  Future<void> navigate(BuildContext context) async {
    super.navigate(context);
    Navigator.pushReplacementNamed(context, '/chats');
    CustomSnackBar.showSuccess(context, message: "Signed In", action: () {});
  }
}

class LoginLoading extends AuthEvent {
  @override
  Future<void> navigate(BuildContext context) async {
    super.navigate(context);

    AppUtils.loadingProgress(context);
  }
}

class LoginFailure extends AuthEvent {
  final String error;

  LoginFailure(this.error);

  @override
  Future<void> navigate(BuildContext context) async {
    super.navigate(context);

    CustomSnackBar.showError(context, message: error, action: () {});
  }
}

class DismissModalEvent extends AuthEvent {
  @override
  Future<void> navigate(BuildContext context) async {
    super.navigate(context);

    Navigator.pop(context);
  }
}

class SignupSuccess extends AuthEvent {
  @override
  Future<void> navigate(BuildContext context) async {
    super.navigate(context);
    Navigator.pushReplacementNamed(context, '/chats');
    CustomSnackBar.showSuccess(context, message: "Signed In", action: () {});
  }
}

class SignupLoading extends AuthEvent {
  @override
  Future<void> navigate(BuildContext context) async {
    super.navigate(context);

    AppUtils.loadingProgress(context);
  }
}

class SignupFailure extends AuthEvent {
  final String error;

  SignupFailure(this.error);

  @override
  Future<void> navigate(BuildContext context) async {
    super.navigate(context);

    CustomSnackBar.showError(context, message: error, action: () {});
  }
}

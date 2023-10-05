import 'package:fit_food/common/base/base_view_model.dart';
import 'package:fit_food/common/models/app_user.dart';
import 'package:fit_food/common/viewmodels/user_view_model.dart';
import 'package:fit_food/core/constants/storage_keys.dart';
import 'package:fit_food/core/helpers/storage_helper.dart';
import 'package:fit_food/core/utils/app_utils.dart';
import 'package:fit_food/core/utils/custom_snack_bar.dart';
import 'package:fit_food/features/chats/view/chat_history_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class AuthEvent extends NavigationEvent {}

class LoginSuccess extends AuthEvent {
  final AppUser user;

  LoginSuccess(this.user);

  @override
  Future<void> navigate(BuildContext context) async {
    super.navigate(context);

    StorageHelper.setBoolean(StorageKeys.isLoggedIn, true);
    StorageHelper.setString("cookie", user.cookie.toString());
    Provider.of<UserViewModel>(context, listen: false).updateUser(user);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ChatHistoryScreen(),
        ));
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
  final AppUser user;

  SignupSuccess(this.user);

  @override
  Future<void> navigate(BuildContext context) async {
    super.navigate(context);

    Provider.of<UserViewModel>(context, listen: false).updateUser(user);
    StorageHelper.setString("cookie", user.cookie.toString());
    Provider.of<UserViewModel>(context, listen: false).getRemote();
    Navigator.pushReplacementNamed(context, '/signIn');
    CustomSnackBar.showSuccess(context,
        message: "User registered, login to continue", action: () {});
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

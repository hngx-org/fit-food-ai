import 'package:fit_food/common/base/base_view_model.dart';
import 'package:fit_food/common/models/app_user.dart';
import 'package:fit_food/core/utils/app_utils.dart';
import 'package:fit_food/core/utils/custom_snack_bar.dart';
import 'package:flutter/material.dart';

abstract class UserEvent extends NavigationEvent {}

class GetUserSuccess extends UserEvent {
  final AppUser user;

  GetUserSuccess(this.user);

  @override
  Future<void> navigate(BuildContext context) async {
    super.navigate(context);


  }
}

class GetUserLoading extends UserEvent {
  @override
  Future<void> navigate(BuildContext context) async {
    super.navigate(context);

    AppUtils.loadingProgress(context);
  }
}

class GetUserFailure extends UserEvent {
  final String error;

  GetUserFailure(this.error);

  @override
  Future<void> navigate(BuildContext context) async {
    super.navigate(context);

    CustomSnackBar.showError(context, message: error, action: () {});
  }
}

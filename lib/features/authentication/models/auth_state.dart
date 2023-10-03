import 'package:hng_authentication/src/models/user.dart';

/// Responsible for login and signup state
class AuthState {
  final bool isLoading;
  final String? error;
  final User? data;

  AuthState({required this.isLoading, required this.error, required this.data});

  factory AuthState.initial() =>
      AuthState(isLoading: false, error: null, data: null);

  AuthState copyWithLoading() =>
      AuthState(isLoading: true, error: null, data: null);
}

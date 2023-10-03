import 'package:either_dart/either.dart';
import 'package:fit_food/common/base/base_view_model.dart';
import 'package:fit_food/features/authentication/data/repository/iauth_repository.dart';
import 'package:fit_food/features/authentication/events/auth_events.dart';
import 'package:fit_food/features/authentication/models/auth_state.dart';

class AuthViewModel extends BaseViewModel {
  final IAuthRepository authRepository;

  AuthViewModel(this.authRepository);

  AuthState _loginState = AuthState.initial();
  AuthState _signUpState = AuthState.initial();

  AuthState get loginState => _loginState;

  AuthState get signUpState => _signUpState;

  set loginState(AuthState value) {
    _loginState = value;
    notifyListeners();
  }

  set signUpState(AuthState value) {
    _signUpState = value;
    notifyListeners();
  }

  Future<void> loginUser(
      {required String email, required String password}) async {
    _loginState = _loginState.copyWithLoading();
    navigator.dispatch(LoginLoading());
    var response = await authRepository.login(email: email, password: password);
    response.fold((left) {
      /// Dispatching Failure events
      navigator.dispatch(DismissModalEvent());
      navigator.dispatch(LoginFailure(left.message));
      return _loginState =
          AuthState(isLoading: false, error: left.message, data: null);
    }, (right) {
      /// Dispatching Success events
      navigator.dispatch(DismissModalEvent());
      navigator.dispatch(LoginSuccess(right));

      return _loginState =
          AuthState(isLoading: false, error: null, data: right);
    });
  }

  Future<void> signUpUser(
      {required String email,
      required String name,
      required String password}) async {
    _signUpState = _signUpState.copyWithLoading();
    navigator.dispatch(SignupLoading());

    var response =
        authRepository.signUp(email: email, name: name, password: password);

    response.fold((left) {
      /// Dispatching Failure events
      navigator.dispatch(DismissModalEvent());
      navigator.dispatch(SignupFailure(left.message));

      return _signUpState =
          AuthState(isLoading: false, error: left.message, data: null);
    }, (right) {
      /// Dispatching Success events
      navigator.dispatch(DismissModalEvent());
      navigator.dispatch(SignupSuccess());
      return _signUpState =
          AuthState(isLoading: false, error: null, data: right);
    });
  }
}

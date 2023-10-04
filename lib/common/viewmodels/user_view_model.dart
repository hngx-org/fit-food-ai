import 'package:fit_food/common/base/base_view_model.dart';
import 'package:fit_food/common/data/user/iuser_repository.dart';
import 'package:fit_food/common/events/user_events.dart';
import 'package:fit_food/common/models/app_user.dart';

class UserViewModel extends BaseViewModel {
  final IUserRepository userRepository;
  AppUser? _user;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
  UserViewModel(this.userRepository);

  AppUser? get user => _user;

  set user(AppUser? value) {
    _user = value;
    notifyListeners();
  }

  Future<void> loadLocalUser() async {
    var result = await userRepository.getCachedUser();
    result.fold((left) => null, (right) {
      _user = right;
    });
  }

  Future<void> updateUser(AppUser newUser) async {
    await userRepository.cacheUseData(user: newUser);
    _user = newUser;
  }

  Future<void> getRemote() async {
    isLoading = true;
    var result = await userRepository.getCachedUser();
    result.fold((left) {
      navigator.dispatch(GetUserFailure(left.message));
      return null;
    }, (right) {
      _user = right;
      isLoading = false;
      updateUser(right);
    });
  }
}

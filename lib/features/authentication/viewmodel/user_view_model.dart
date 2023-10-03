import 'package:fit_food/common/base/base_view_model.dart';
import 'package:hng_authentication/src/models/user.dart';

class UserViewModel extends BaseViewModel {
  final dynamic userRepository;
  User? _user;

  UserViewModel(this.userRepository);

  User? get user => _user;

  Future<void> loadUser() async {
    _user = await userRepository.getUser();
    notifyListeners();
  }

  Future<void> updateUser(User newUser) async {
    await userRepository.updateUser(newUser);
    _user = newUser;
    notifyListeners();
  }
}

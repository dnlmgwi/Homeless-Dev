import 'package:whisqr2/data/userrepo.dart';
import 'package:whisqr/models/user.dart';

class UserStore {
  final UserRepository _userRepository;

  UserStore(this._userRepository);

  User _user;
  User get user => _user;

  void login({String username, String password}) async {
    _user = await _userRepository.login(username: username, password: password);
    print(_user.toJson());
  }

  void isMember({String email}) async {
    _user = await _userRepository.isMember(email: email);
  }
}

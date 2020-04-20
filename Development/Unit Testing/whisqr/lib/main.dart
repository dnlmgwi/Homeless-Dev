import 'package:whisqr/data/userrepo.dart';

main() {
  UserRepository _userRepo = UserRepository();

  _userRepo.login(username: "test",password: "test");
}

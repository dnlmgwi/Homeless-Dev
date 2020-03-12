// import 'package:whisqr/data/userrepo.dart';
// import 'package:whisqr/models/activecheck.dart';
// import 'package:whisqr/models/loginresponse.dart';

// class UserStore {
//   final UserRepository _userRepository;

//   UserStore(this._userRepository);

//   Future<LoginResponse> loginProc({String username, String password}) async {
//     var _login =
//         await _userRepository.login(username: username, password: password);

//     print("Login Attempt: ${_login.status}");
//     print("Login Public Key: ${_login.keyPublic}");
//     print("Login Secret Key: ${_login.keySecret}");

//     return _login;
//   }

//   Future<ActCheck> isMemberCheck({String email, String keyPublic, String keySecret}) async {
//     var _user = await _userRepository.isMember(
//         email: email, keyPublic: keyPublic, keySecret: keySecret);

//     print("Response: ${_user.status}");
//     print("isMember: ${_user.isMember}");
//     print("Message: ${_user.message}");

//     return _user;
//   }
// }

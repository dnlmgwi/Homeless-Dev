import 'package:test_app/data/UserMethods.dart';
import 'package:test_app/models/user.dart';

abstract class LoginScreenContract {
  void onLoginSuccess(User user);
  void onLoginError(String errorTxt);
}

class LoginScreenPresenter {
  LoginScreenContract _view;
  Login api = new Login();
  LoginScreenPresenter(this._view);

  doLogin(String username, String password) {
    api.contentHash().then((User user) {
      _view.onLoginSuccess(user);
    }).catchError((Exception error) => _view.onLoginError(error.toString()));
  }

//  doCheck(String username) {
//    check.check(username).then((User user) {
//      _view.onLoginSuccess(user);
//    }).catchError((Exception error) => _view.onLoginError(error.toString()));
//  }
}

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:test_app/models/loginresponse.dart';

class Login {
  Dio dio = new Dio();

  Future login({
    @required String username,
    @required String password,
  }) async {
    try {
      Response response = await dio
          .post("https://loyalty.whisqr.com/api/v1.2/user/login", data: {
        "email": username,
        "password": password,
        "businesscode": "homeless",
      });

      print(response);

      var loggedInUser = LoginResponse.fromJson(response.data);

      return loggedInUser;
    } catch (e) {
      print(e);
    }
  }
}

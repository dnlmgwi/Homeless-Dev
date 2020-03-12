import 'package:dio/dio.dart';
import 'package:crypto/crypto.dart';
import 'package:whisqr/models/activecheck.dart';
import 'dart:convert';
import 'package:whisqr/models/loginresponse.dart';

class UserRepository {
  Dio dio = new Dio();

  Future login({
    String username,
    String password,
  }) async {
    try {
      Response response = await dio.post(
          "https://loyalty.whisqr.com/api/v1.2/user/login",
          options: Options(contentType: 'application/json'),
          data: {
            "email": username,
            "password": password,
            "businesscode": "homeless"
          });

      LoginResponse loggedInUser = LoginResponse.fromJson(response.data);

      print("Login Attempt: ${loggedInUser.status}");
      print("Login Public Key: ${loggedInUser.keyPublic}");
      print("Login Secret Key: ${loggedInUser.keySecret}");

      return loggedInUser;
    } catch (e) {
      print(e);
    }
  }

  Future isMember({String email}) async {
    var hashedMsg = await contentHash(message: email);

    String keyPublic =
        'pk_live_3bbb529cbe74fdf1fddd1fc503879876723e4c4dccbae08f7c017a0b4f8d6553';

    try {
      Response response = await dio.get(
        "https://whisqr.com/api/v1.2/user/ismember",
        options: Options(
          contentType: "application/json",
          headers: {
            "X-Public": "$keyPublic",
            "X-Hash": "$hashedMsg",
            "email": "$email",
          },
        ),
      );

      ActiveCheckRsp verifiedUser = ActiveCheckRsp.fromJson(response.data);

      print("Login Attempt:${verifiedUser.status}");
      print("Login Public Key:${verifiedUser.message}");
      print("isMember:${verifiedUser.isMember}");

      return verifiedUser;
    } catch (e) {
      print(e);
    }
  }

  Future contentHash({String message}) async {
    String keySecret =
        'sk_live_427e65309ada7741830c3e65d394dd84a1eab01982118d5d74ca1d47276bd728';

    var key = utf8.encode("$keySecret");
    var bytes = utf8.encode("$message");

    var hmacSha256 = Hmac(sha256, key); // HMAC-SHA256

    var digest = hmacSha256.convert(bytes);

    print("HMAC digest as hex string: $digest");

    return digest;
  }
}

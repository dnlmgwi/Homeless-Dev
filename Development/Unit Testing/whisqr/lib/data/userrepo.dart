import 'package:dio/dio.dart';
import 'package:whisqr/data/constant.dart';
import 'package:whisqr/models/loginresponse.dart';

class UserRepository {
  Dio dio = new Dio();

  Future<LoginResponse> login({
    String username,
    String password,
  }) async {
    Response response = await dio.post(loginEndpoint,
        options: Options(contentType: 'application/json'),
        queryParameters: {
          "user": username,
          "password": password,
          "token": "$token"
        });

    LoginResponse loggedInUser = LoginResponse.fromJson(response.data);
    print(loggedInUser.apiKey);
    return loggedInUser;
  }

  // Future<String> contentHash({reqBody}) async {
  //   var key = utf8.encode(keySecret);
  //   var bytes = utf8.encode(reqBody);

  //   Hmac hmacSha256 = Hmac(sha256, key); // HMAC-SHA256
  //   Digest digest = hmacSha256.convert(bytes);
  //   print("Test Digest: $digest");
  //   return digest.toString();
  // }
}

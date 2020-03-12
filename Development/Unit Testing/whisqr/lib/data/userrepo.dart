import 'package:dio/dio.dart';
import 'package:crypto/crypto.dart';
import 'package:whisqr/data/constant.dart';
import 'package:whisqr/models/Rewards/rewards.dart';
import 'package:whisqr/models/activecheck.dart';
import 'dart:convert';
import 'package:whisqr/models/loginresponse.dart';

class UserRepository {
  Dio dio = new Dio();

  Future<LoginResponse> login({
    String username,
    String password,
  }) async {
    Response response = await dio.post(loginEndpoint,
        options: Options(contentType: 'application/json'),
        data: {
          "email": username,
          "password": password,
          "businesscode": "homeless"
        });

    LoginResponse loggedInUser = LoginResponse.fromJson(response.data);

    return loggedInUser;
  }

  Future<Rewards> rewardsCheck() async {
    Response response = await dio.get(
      rewards_Settings,
      options: Options(
          contentType: 'application/json',
          headers: {
            "X-Public": keyPublic,
          },
          responseType: ResponseType.json),
    );

    Rewards currentRewards = Rewards.fromJson(response.data);

    print("Message: ${currentRewards.message}");
    print("No Of Rewards: ${currentRewards.settingsRewards.length}");
    currentRewards.settingsRewards.forEach((f){
      print("No Of Rewards: ${f.fields}");
    });

    return currentRewards;
  }

  Future<ActMemberCheck> isMember({String email}) async {
    var req = {"email": email};

    Response response = await dio.get(
      isMemberEndpoint,
      options: Options(
        contentType: "application/json",
        headers: {
          "X-Public": keyPublic,
          "X-Hash": await contentHash(reqBody: req),
        },
        responseType: ResponseType.plain,
      ),
      queryParameters: req,
    );

    ActMemberCheck data = ActMemberCheck.fromJson(response.data);

    print("isMember: ${data.isMember}");
    print("Status: ${data.status}");
    print("Message: ${data.message}");

    return data;
  }

  Future<String> contentHash({reqBody}) async {
    var key = utf8.encode(keySecret);
    var bytes = utf8.encode(reqBody);

    Hmac hmacSha256 = Hmac(sha256, key); // HMAC-SHA256
    Digest digest = hmacSha256.convert(bytes);
    print("Test Digest: $digest");
    return digest.toString();
  }
}

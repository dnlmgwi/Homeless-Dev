import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:crypto/crypto.dart';
import 'package:test_app/models/activemembershipcheck.dart';
import 'dart:convert';

import 'package:test_app/models/loginresponse.dart';

class UserRepository {
  Dio dio = new Dio();
  LoginResponse usr;

  Future contentHash({
    @required body,
  }) async {
    var key = utf8.encode('${usr.keySecret}');
    var request = utf8.encode('$body');

    var hmacSha256 = new Hmac(sha256, key); // HMAC-SHA256
    var contentHash = hmacSha256.convert(request);

    print(contentHash);

    return contentHash;
  }

  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return false;
  }

  Future isMember({email}) async {
    try {
      RequestOptions response = await RequestOptions(
        method: "https://loyalty.whisqr.com/api/v1.2/user/ismember",
        data: {"email": email},
        headers: {
          "X-Public": usr.keyPublic,
          "X-Hash": await contentHash(body: email),
          "Content-Type": "application/json"
        },
        responseType: ResponseType.json,
      );

      print(response);

      var activeMemberCheck =
          ActiveMembershipCheckResponse.fromJson(response.data);

      return activeMemberCheck;
    } catch (e) {
      print(e);
    }
  }

  Future punchTotal({cardCode}) async {
    try {
      RequestOptions response = await RequestOptions(
        method: "https://loyalty.whisqr.com/api/v1.2/punch/total",
        data: {"cardcode": cardCode},
        headers: {
          "X-Public": usr.keyPublic,
          "X-Hash": await contentHash(body: cardCode),
          "Content-Type": "application/json"
        },
        responseType: ResponseType.json,
      );

      print(response);

      var activeMemberCheck =
          ActiveMembershipCheckResponse.fromJson(response.data);

      return activeMemberCheck;
    } catch (e) {
      print(e);
    }
  }
}

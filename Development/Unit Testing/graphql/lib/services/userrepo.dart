import 'package:dio/dio.dart';
import 'package:graphql/model/collections/query.dart';
import 'package:graphql/model/user.dart';
import 'dart:convert';

class UserRepo {
  Dio dio = new Dio();

  Future auth({
    String user,
    String password,
  }) async {
    try {
      String _token = '6ce338b5191c2a121d51b4076b9d72';
      Response response = await dio.post(
          "http://sketchdm.co.za/cockpit/api/cockpit/authUser",
          options: Options(
              contentType: 'application/json',
              responseType: ResponseType.plain),
          queryParameters: {
            "token": "$_token"
          },
          data: {
            "user": user,
            "password": password,
          });

      Map userMap = jsonDecode(response.data);

      var authUser = User.fromJson(userMap);

      print(
        '${authUser.name}'
      );
      return authUser;
    } catch (e) {
      print(e);
    }
  }

  Future entries() async {
    try {
      Response response = await dio.get(
          "http://sketchdm.co.za/cockpit/api/collections/get/user",
          options: Options(
              contentType: 'application/json',
              responseType: ResponseType.plain));

      Map userMap = jsonDecode(response.data);
      var contacts = Query.fromJson(userMap);
      print(response.data);

      return contacts;
    } catch (e) {
      print(e);
    }
  }
}

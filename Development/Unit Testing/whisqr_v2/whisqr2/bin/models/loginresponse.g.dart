// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loginresponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return LoginResponse(
      status: json['status'] as String,
      message: json['message'] as String,
      keyPublic: json['keyPublic'] as String,
      keySecret: json['keySecret'] as String,
      businesscode: json['businesscode'] as String,
      locationcode: json['locationcode'] as String);
}

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'keyPublic': instance.keyPublic,
      'keySecret': instance.keySecret,
      'businesscode': instance.businesscode,
      'locationcode': instance.locationcode
    };

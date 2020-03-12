// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activecheck.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActMemberCheck _$ActMemberCheckFromJson(Map<String, dynamic> json) {
  return ActMemberCheck(
      status: json['status'] as String,
      message: json['message'] as String,
      isMember: json['isMember'] as bool);
}

Map<String, dynamic> _$ActMemberCheckToJson(ActMemberCheck instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'isMember': instance.isMember
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activecheck.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActiveCheckRsp _$ActiveMembershipCheckResponseFromJson(
    Map<String, dynamic> json) {
  return ActiveCheckRsp(
      status: json['status'] as String,
      message: json['message'] as String,
      isMember: json['isMember'] as bool);
}

Map<String, dynamic> _$ActiveMembershipCheckResponseToJson(
        ActiveCheckRsp instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'isMember': instance.isMember
    };

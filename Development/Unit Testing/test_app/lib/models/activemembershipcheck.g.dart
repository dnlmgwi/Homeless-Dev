// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activemembershipcheck.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActiveMembershipCheckResponse _$ActiveMembershipCheckResponseFromJson(
    Map<String, dynamic> json) {
  return ActiveMembershipCheckResponse(
      status: json['status'] as String,
      message: json['message'] as String,
      punchtotal: json['punchtotal'] as int);
}

Map<String, dynamic> _$ActiveMembershipCheckResponseToJson(
        ActiveMembershipCheckResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'punchtotal': instance.punchtotal
    };

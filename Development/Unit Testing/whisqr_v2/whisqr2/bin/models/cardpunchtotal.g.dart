// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cardpunchtotal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardPunchTotal _$CardPunchTotalFromJson(Map<String, dynamic> json) {
  return CardPunchTotal(
      status: json['status'] as String,
      message: json['message'] as String,
      punchtotal: json['punchtotal'] as int);
}

Map<String, dynamic> _$CardPunchTotalToJson(CardPunchTotal instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'punchtotal': instance.punchtotal
    };

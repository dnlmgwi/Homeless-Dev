// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fields.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fields _$FieldsFromJson(Map<String, dynamic> json) {
  return Fields(
      description: json['description'] as String,
      punchcost: json['punchcost'] as int,
      retail: json['retail'] as int,
      rewardname: json['rewardname'] as String,
      wholesale: json['wholesale'] as int);
}

Map<String, dynamic> _$FieldsToJson(Fields instance) => <String, dynamic>{
      'rewardname': instance.rewardname,
      'punchcost': instance.punchcost,
      'retail': instance.retail,
      'wholesale': instance.wholesale,
      'description': instance.description
    };
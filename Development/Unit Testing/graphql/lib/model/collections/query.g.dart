// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Query _$QueryFromJson(Map<String, dynamic> json) {
  return Query(
      id: json['_id'] as String,
      entries: json['entries'] == null
          ? null
          : Entries.fromJson(json['entries'] as Map<String, dynamic>),
      total: json['total'] as int);
}

Map<String, dynamic> _$QueryToJson(Query instance) => <String, dynamic>{
      'entries': instance.entries?.toJson(),
      'total': instance.total,
      '_id': instance.id
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entries.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Entries _$EntriesFromJson(Map<String, dynamic> json) {
  return Entries(
      id: json['_id'] as String,
      username: json['username'] as String,
      label: json['label'] as String,
      password: json['password'] as String,
      age: json['age'] as String);
}

Map<String, dynamic> _$EntriesToJson(Entries instance) => <String, dynamic>{
      'username': instance.username,
      'age': instance.age,
      'password': instance.password,
      'label': instance.label,
      '_id': instance.id
    };

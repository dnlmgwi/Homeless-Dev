import 'package:json_annotation/json_annotation.dart';
part 'entries.g.dart';

/* 
 "entries":
 [
   {"id":"1","username":"dm","age":"23","password":"123","_mby":"5df39486616362b993000290","_by":"5df39486616362b993000290","_modified":1576245136,"_created":1576245136,"_id":"5df39790616362b992000012"},
   {"id":"21","username":"mm","age":"32","password":"asdas","_mby":"5df39486616362b993000290","_by":"5df39486616362b993000290","_modified":1576282828,"_created":1576282828,"_id":"5df42acc616362b990000083"}
 ],
*/

@JsonSerializable()

class Entries{

String username, age, password, label;

@JsonKey(name: '_id')
String id;
  
  Entries({this.id,this.username,this.label, this.password, this.age});

  factory Entries.fromJson(Map<String, dynamic> json) => _$EntriesFromJson(json);

  Map<String, dynamic> toJson() => _$EntriesToJson(this);
}

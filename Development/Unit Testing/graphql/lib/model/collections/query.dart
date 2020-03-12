import 'package:graphql/model/collections/entries.dart';
import 'package:json_annotation/json_annotation.dart';
part 'query.g.dart';



@JsonSerializable(explicitToJson: true)

class Query{
Entries entries;
int total;

@JsonKey(name: '_id')
String id;
   
  Query({this.id, this.entries,this.total});

  factory Query.fromJson(Map<String, dynamic> json) => _$QueryFromJson(json);

  Map<String, dynamic> toJson() => _$QueryToJson(this);
}

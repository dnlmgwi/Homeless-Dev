import 'package:json_annotation/json_annotation.dart';
part 'activecheck.g.dart';

@JsonSerializable(explicitToJson: true)

class ActMemberCheck {
  String status;
  String message;
  bool isMember;

  ActMemberCheck({this.status, this.message, this.isMember});

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory ActMemberCheck.fromJson(Map<String, dynamic> json) =>
      _$ActMemberCheckFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$ActMemberCheckToJson(this);
}

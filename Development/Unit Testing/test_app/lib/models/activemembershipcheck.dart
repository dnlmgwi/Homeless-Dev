import 'package:json_annotation/json_annotation.dart';
part 'activemembershipcheck.g.dart';

@JsonSerializable()

//@JsonSerializable(explicitToJson: true)

class ActiveMembershipCheckResponse {
  String status;
  String message;
  int punchtotal;

  ActiveMembershipCheckResponse({this.status, this.message, this.punchtotal});

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory ActiveMembershipCheckResponse.fromJson(Map<String, dynamic> json) =>
      _$ActiveMembershipCheckResponseFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$ActiveMembershipCheckResponseToJson(this);
}

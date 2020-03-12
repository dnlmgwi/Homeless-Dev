import 'package:json_annotation/json_annotation.dart';
part 'loginresponse.g.dart';

@JsonSerializable(explicitToJson: true)

class LoginResponse {
  String status;
  String message;
  String keyPublic;
  String keySecret;
  String businesscode;
  String locationcode;

  LoginResponse(
      {this.status,
      this.message,
      this.keyPublic,
      this.keySecret,
      this.businesscode,
      this.locationcode});

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

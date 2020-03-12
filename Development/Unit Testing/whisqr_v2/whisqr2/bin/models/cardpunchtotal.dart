import 'package:json_annotation/json_annotation.dart';
part 'cardpunchtotal.g.dart';

@JsonSerializable()

//@JsonSerializable(explicitToJson: true)

class CardPunchTotal {
  String status;
  String message;
  int punchtotal;

  CardPunchTotal({this.status, this.message, this.punchtotal});

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory CardPunchTotal.fromJson(Map<String, dynamic> json) =>
      _$CardPunchTotalFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$CardPunchTotalToJson(this);
}

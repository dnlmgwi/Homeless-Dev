import 'package:json_annotation/json_annotation.dart';
import 'package:whisqr/models/Rewards/fields.dart';
import 'package:whisqr/models/Rewards/settingsRewards.dart';
part 'rewards.g.dart';

@JsonSerializable(explicitToJson: true)

class Rewards {
  
  String status;
  String message;
  String shortcode;

  @JsonKey(name: 'settings_rewards')
  List<SettingsRewards> settingsRewards;

  Rewards({this.status, this.message, this.shortcode, this.settingsRewards});

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory Rewards.fromJson(Map<String, dynamic> json) =>
      _$RewardsFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$RewardsToJson(this);
}
import 'package:json_annotation/json_annotation.dart';
part 'reward.g.dart';

@JsonSerializable()
class Reward {
  final int gold;
  final int diamond;
  bool isRewardClaimed;

  Reward({
    required this.diamond,
    required this.gold,
    this.isRewardClaimed = false,
  });

  factory Reward.fromJson(Map<String, dynamic> json) => _$RewardFromJson(json);

  Map<String, dynamic> toJson() => _$RewardToJson(this);
}
import 'package:json_annotation/json_annotation.dart';

import '../reward.dart';

part 'roll_call.g.dart';

@JsonSerializable()
class RollCall {
  int currentDay;
  final List<int> days;
  final List<Reward> rewards;

  RollCall({
    required this.currentDay,
    required this.days,
    required this.rewards,
  });

  factory RollCall.fromJson(Map<String, dynamic> json) => _$RollCallFromJson(json);

  Map<String, dynamic> toJson() => _$RollCallToJson(this);
}

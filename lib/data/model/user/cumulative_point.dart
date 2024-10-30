import 'package:json_annotation/json_annotation.dart';

part 'cumulative_point.g.dart';

@JsonSerializable()
class CumulativePoint {
  int diamond;
  int gold;

  CumulativePoint(this.diamond, this.gold);

  factory CumulativePoint.fromJson(Map<String, dynamic> json) =>
      _$CumulativePointFromJson(json);

  Map<String, dynamic> toJson() => _$CumulativePointToJson(this);
}

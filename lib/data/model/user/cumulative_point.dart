import 'package:json_annotation/json_annotation.dart';

part 'cumulative_point.g.dart';

@JsonSerializable()
class CumulativePoint {
  //Điểm
  int diamond;
  int gold;

  //Điểm đua top
  int rankPoints;

  CumulativePoint(this.diamond, this.gold, this.rankPoints);

  factory CumulativePoint.fromJson(Map<String, dynamic> json) =>
      _$CumulativePointFromJson(json);

  Map<String, dynamic> toJson() => _$CumulativePointToJson(this);
}

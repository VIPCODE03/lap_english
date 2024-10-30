import 'package:json_annotation/json_annotation.dart';
import '../reward.dart';

part 'title.g.dart';

@JsonSerializable(explicitToJson: true)
class Title {
  final int id;
  final String image;
  final String title;
  final String description;
  final Reward award;
  final int progress;
  final int total;

  Title({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.award,
    required this.progress,
    required this.total,
  });

  factory Title.fromJson(Map<String, dynamic> json) => _$TitleFromJson(json);

  Map<String, dynamic> toJson() => _$TitleToJson(this);

}

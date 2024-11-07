import 'package:json_annotation/json_annotation.dart';
import 'package:lap_english/data/model/task_and_reward/reward.dart';
import 'package:lap_english/data/model/task_and_reward/task.dart';

part 'title.g.dart';

@JsonSerializable(explicitToJson: true)
class MdlTitle {
  final int id;
  final String image;
  final String title;
  final MdlTask task;
  final Reward award;

  MdlTitle({
    required this.id,
    required this.image,
    required this.title,
    required this.task,
    required this.award,
  });

  factory MdlTitle.fromJson(Map<String, dynamic> json) => _$MdlTitleFromJson(json);

  Map<String, dynamic> toJson() => _$MdlTitleToJson(this);

}

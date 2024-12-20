import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@JsonSerializable(explicitToJson: true)
class MdlTask {
  final String description;
  double progress;
  final double total;
  final String keyFunUpdate;

  MdlTask({
    required this.description,
    required this.progress,
    required this.total,
    required this.keyFunUpdate,
  });

  factory MdlTask.fromJson(Map<String, dynamic> json) => _$MdlTaskFromJson(json);

  Map<String, dynamic> toJson() => _$MdlTaskToJson(this);
}

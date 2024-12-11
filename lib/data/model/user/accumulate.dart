
import 'package:json_annotation/json_annotation.dart';

part 'accumulate.g.dart';

@JsonSerializable()
class MdlAccumulate {
  int words;
  int daysLearned;
  int sentences;
  int titles;

  MdlAccumulate(this.words, this.sentences, this.titles, this.daysLearned);

  factory MdlAccumulate.fromJson(Map<String, dynamic> json) => _$MdlAccumulateFromJson(json);

  Map<String, dynamic> toJson() => _$MdlAccumulateToJson(this);
}
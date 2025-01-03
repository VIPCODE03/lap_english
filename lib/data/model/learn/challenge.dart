import 'package:json_annotation/json_annotation.dart';
import 'package:lap_english/data/model/quizz/quizz.dart';

part 'challenge.g.dart';

@JsonSerializable()
class Challenge {
  final int id;
  final List<String> content;
  final List<CustomQuiz> quizzes;

  Challenge({
    required this.id,
    required this.content,
    required this.quizzes
  });

  factory Challenge.fromJson(Map<String, dynamic> json) => _$ChallengeFromJson(json);

  Map<String, dynamic> toJson() => _$ChallengeToJson(this);
}


import 'package:json_annotation/json_annotation.dart';
import 'package:lap_english/data/model/quizz/quizz.dart';

part 'grammar.g.dart';

/* Loại ngữ pháp */
@JsonSerializable()
class TypeGrammar {
  final int id;
  final String name;

  TypeGrammar(this.id, this.name);

  factory TypeGrammar.fromJson(Map<String, dynamic> json) =>
      _$TypeGrammarFromJson(json);

  Map<String, dynamic> toJson() => _$TypeGrammarToJson(this);
}

/* Ngữ pháp */
@JsonSerializable()
class Grammar {
  final int id;
  final String name;
  final String description;
  final int typeGrammarId;

  Grammar(this.id, this.name, this.description, this.typeGrammarId);

  factory Grammar.fromJson(Map<String, dynamic> json) => _$GrammarFromJson(json);

  Map<String, dynamic> toJson() => _$GrammarToJson(this);
}

/* Cấu trúc ngữ pháp */
@JsonSerializable()
class GrammaticalStructure {
  final int id;
  final String description;
  final String structure;
  final int grammarId;

  GrammaticalStructure(this.id, this.description, this.structure, this.grammarId);

  factory GrammaticalStructure.fromJson(Map<String, dynamic> json) => _$GrammaticalStructureFromJson(json);

  Map<String, dynamic> toJson() => _$GrammaticalStructureToJson(this);
}

/* Bài tập */
@JsonSerializable()
class ExerciseGrammar {
  final int grammaticalStructureId;
  final CustomQuiz quiz;

  ExerciseGrammar(this.grammaticalStructureId, this.quiz);

  factory ExerciseGrammar.fromJson(Map<String, dynamic> json) => _$ExerciseGrammarFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseGrammarToJson(this);
}

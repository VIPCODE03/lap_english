// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grammar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypeGrammar _$TypeGrammarFromJson(Map<String, dynamic> json) => TypeGrammar(
      (json['id'] as num).toInt(),
      json['name'] as String,
    );

Map<String, dynamic> _$TypeGrammarToJson(TypeGrammar instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Grammar _$GrammarFromJson(Map<String, dynamic> json) => Grammar(
      (json['id'] as num).toInt(),
      json['name'] as String,
      json['description'] as String,
      (json['typeGrammarId'] as num).toInt(),
    );

Map<String, dynamic> _$GrammarToJson(Grammar instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'typeGrammarId': instance.typeGrammarId,
    };

GrammaticalStructure _$GrammaticalStructureFromJson(
        Map<String, dynamic> json) =>
    GrammaticalStructure(
      (json['id'] as num).toInt(),
      json['description'] as String,
      json['structure'] as String,
      (json['grammarId'] as num).toInt(),
    );

Map<String, dynamic> _$GrammaticalStructureToJson(
        GrammaticalStructure instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'structure': instance.structure,
      'grammarId': instance.grammarId,
    };

ExerciseGrammar _$ExerciseGrammarFromJson(Map<String, dynamic> json) =>
    ExerciseGrammar(
      (json['grammaticalStructureId'] as num).toInt(),
      CustomQuiz.fromJson(json['quiz'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExerciseGrammarToJson(ExerciseGrammar instance) =>
    <String, dynamic>{
      'grammaticalStructureId': instance.grammaticalStructureId,
      'quiz': instance.quiz,
    };

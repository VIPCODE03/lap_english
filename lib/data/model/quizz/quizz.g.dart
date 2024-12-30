// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quizz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomQuiz _$CustomQuizFromJson(Map<String, dynamic> json) => CustomQuiz(
      json['question'] as String,
      (json['answers'] as List<dynamic>).map((e) => e as String).toList(),
      json['answerCorrect'] as String,
      $enumDecode(_$TypeQuizEnumMap, json['type']),
      imgAnswers: (json['imgAnswers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      imageQuestion: json['imageQuestion'] as String?,
    );

Map<String, dynamic> _$CustomQuizToJson(CustomQuiz instance) =>
    <String, dynamic>{
      'type': _$TypeQuizEnumMap[instance.type]!,
      'question': instance.question,
      'answers': instance.answers,
      'answerCorrect': instance.answerCorrect,
      'imgAnswers': instance.imgAnswers,
      'imageQuestion': instance.imageQuestion,
    };

const _$TypeQuizEnumMap = {
  TypeQuiz.chooseOne: 'chooseOne',
  TypeQuiz.select: 'select',
  TypeQuiz.sound: 'sound',
  TypeQuiz.image: 'image',
  TypeQuiz.write: 'write',
};

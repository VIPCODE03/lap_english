// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Challenge _$ChallengeFromJson(Map<String, dynamic> json) => Challenge(
      id: (json['id'] as num).toInt(),
      content:
          (json['content'] as List<dynamic>).map((e) => e as String).toList(),
      quizzes: (json['quizzes'] as List<dynamic>)
          .map((e) => CustomQuiz.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChallengeToJson(Challenge instance) => <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'quizzes': instance.quizzes,
    };

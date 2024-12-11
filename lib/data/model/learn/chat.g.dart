// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MdlTopicChat _$MdlTopicChatFromJson(Map<String, dynamic> json) => MdlTopicChat(
      json['name'] as String,
      json['describe'] as String,
      json['imgUrl'] as String,
      MdlUnlockStatusManager.fromJson(json['status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MdlTopicChatToJson(MdlTopicChat instance) =>
    <String, dynamic>{
      'name': instance.name,
      'describe': instance.describe,
      'imgUrl': instance.imgUrl,
      'status': instance.status,
    };

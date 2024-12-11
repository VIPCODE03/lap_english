import 'package:json_annotation/json_annotation.dart';
import 'package:lap_english/data/model/learn/status.dart';

part 'chat.g.dart';

@JsonSerializable()
class MdlTopicChat {
  final String name;
  final String describe;
  final String imgUrl;
  final MdlUnlockStatusManager status;

  MdlTopicChat(this.name, this.describe, this.imgUrl, this.status);

  factory MdlTopicChat.fromJson(Map<String, dynamic> json) => _$MdlTopicChatFromJson(json);

  Map<String, dynamic> toJson() => _$MdlTopicChatToJson(this);
}

class MdlChat {
  final RoleChat roleChat;
  final String message;
  final String translate;

  MdlChat(this.roleChat, this.message, this.translate);
}

enum RoleChat {
  user,
  bot
}
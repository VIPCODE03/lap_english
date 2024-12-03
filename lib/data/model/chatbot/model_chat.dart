
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
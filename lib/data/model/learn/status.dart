import 'package:json_annotation/json_annotation.dart';

import '../user/user.dart';

part 'status.g.dart';

@JsonSerializable()
class MdlUnlockStatusManager {
  bool locked;
  final int diamond;
  final int gold;

  MdlUnlockStatusManager({
    required this.gold,
    required this.diamond,
    required this.locked,
  });

  bool unlock(User user) {
    if(user.cumulativePoint.diamond >= diamond && user.cumulativePoint.gold >= gold && isLocked) {
      locked = false;
      user.cumulativePoint.diamond -= diamond;
      user.cumulativePoint.gold -= gold;
      return true;
    }
    return false;
  }

  bool checkUnlock(User user) {
    if(user.cumulativePoint.diamond >= diamond && user.cumulativePoint.gold >= gold && isLocked) {
      return true;
    }
    return false;
  }

  bool get isLocked => locked;

  factory MdlUnlockStatusManager.fromJson(Map<String, dynamic> json) => _$MdlUnlockStatusManagerFromJson(json);

  Map<String, dynamic> toJson() => _$MdlUnlockStatusManagerToJson(this);
}

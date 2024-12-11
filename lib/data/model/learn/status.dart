import 'package:json_annotation/json_annotation.dart';

import '../user/user.dart';

part 'status.g.dart';

@JsonSerializable()
class MdlUnlockStatusManager {
  bool _isLocked;
  final int diamond;
  final int gold;

  MdlUnlockStatusManager({
    required this.gold,
    required this.diamond,
    bool locked = true,
  })  : _isLocked = locked;

  bool unlock(User user) {
    if(user.cumulativePoint.diamond >= diamond && user.cumulativePoint.gold >= gold && _isLocked) {
      _isLocked = false;
      user.cumulativePoint.diamond -= diamond;
      user.cumulativePoint.gold -= gold;
      return true;
    }
    return false;
  }

  bool get isLocked => _isLocked;

  factory MdlUnlockStatusManager.fromJson(Map<String, dynamic> json) => _$MdlStatusFromJson(json);

  Map<String, dynamic> toJson() => _$MdlStatusToJson(this);
}

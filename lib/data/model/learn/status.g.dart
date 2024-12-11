// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MdlUnlockStatusManager _$MdlStatusFromJson(Map<String, dynamic> json) => MdlUnlockStatusManager(
      gold: (json['gold'] as num).toInt(),
      diamond: (json['diamond'] as num).toInt(),
      locked: json['locked'] as bool? ?? true,
    );

Map<String, dynamic> _$MdlStatusToJson(MdlUnlockStatusManager instance) => <String, dynamic>{
      'diamond': instance.diamond,
      'gold': instance.gold,
      'isLocked': instance.isLocked,
    };

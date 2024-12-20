// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MdlUnlockStatusManager _$MdlUnlockStatusManagerFromJson(
        Map<String, dynamic> json) =>
    MdlUnlockStatusManager(
      gold: (json['gold'] as num).toInt(),
      diamond: (json['diamond'] as num).toInt(),
      locked: json['locked'] as bool,
    );

Map<String, dynamic> _$MdlUnlockStatusManagerToJson(
        MdlUnlockStatusManager instance) =>
    <String, dynamic>{
      'locked': instance.locked,
      'diamond': instance.diamond,
      'gold': instance.gold,
    };

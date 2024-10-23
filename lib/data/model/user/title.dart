import 'package:json_annotation/json_annotation.dart';
import 'package:lap_english/data/model/user/user.dart';
import 'package:lap_english/gen/assets.gen.dart';

part 'title.g.dart';

@JsonSerializable(explicitToJson: true)
class Title {
  final int id;
  final String image;
  final String title;
  final String description;
  final Reward award;
  final int completed;
  final int total;
  final bool isRewardClaimed;

  Title({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.award,
    required this.completed,
    required this.total,
    required this.isRewardClaimed,
  });

  factory Title.fromJson(Map<String, dynamic> json) => _$TitleFromJson(json);

  Map<String, dynamic> toJson() => _$TitleToJson(this);

}

@JsonSerializable()
class Reward {
  final String name;
  final RewardType rewardType;
  final int quantity;

  Reward({
    required this.name,
    required this.rewardType,
    required this.quantity,
  });

  String get icon {
    switch(rewardType) {
      case RewardType.diamond:
        return Assets.images.icon.dimounds.path;
      case RewardType.gold:
        return Assets.images.icon.golds.path;
      default:
        throw ArgumentError('Invalid reward type');
    }
  }

  getReward(User user) {
    switch(rewardType) {
      case RewardType.diamond:
        user.cumulativePoint.diamond += quantity;
        break;
      case RewardType.gold:
        user.cumulativePoint.gold += quantity;
        break;
    }
  }

  factory Reward.fromJson(Map<String, dynamic> json) => _$RewardFromJson(json);

  Map<String, dynamic> toJson() => _$RewardToJson(this);
}

enum RewardType { diamond, gold }

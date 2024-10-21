
/*  Danh hiệu  */
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
}

/*  Phần thưởng   */
class Reward {
  final String name;
  final RewardType rewardType;
  final int quantity;

  Reward({
    required this.name,
    required this.rewardType,
    required this.quantity,
  });
}

/*  Loại phần thưởng  */
enum RewardType {
  diamond,
  tym
}


import 'package:lap_english/data/model/user/title.dart';

class RollCall {
  int currentDay;
  final List<int> days;
  final List<Reward> rewards;
  final List<bool> rewardReceives;

  RollCall({
    required this.currentDay,
    required this.days,
    required this.rewardReceives,
    required this.rewards
  });

  bool getRewardReceive() {
    return rewardReceives[currentDay];
  }

  setRewardReceive() {
    rewardReceives[currentDay] = true;
  }
}


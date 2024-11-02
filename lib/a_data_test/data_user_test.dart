import 'dart:convert';

import 'package:lap_english/data/model/task/daily_task.dart';
import 'package:lap_english/data/model/task/roll_call.dart';
import 'package:lap_english/data/model/task/task.dart';

import '../data/model/reward.dart';
import '../data/model/user/cumulative_point.dart';
import '../data/model/user/skill.dart';
import '../data/model/user/title.dart';
import '../data/model/user/user.dart';

class UserDataTest {
  static String getUserJson() {
    User user = User(
      name: 'Đào Như Triệu',
      email: 'daonhutrieu15052003@gmail.com',
      avatar: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCXQ1UUU1jQuqgDqViOYhd_jz3Aj3J8yAuwQ&s',
      skills: Skill(2, 4, 3, 3),
      titles:[
        Title(
          id: 1,
          image: 'url_to_image',
          title: 'Người học xuất sắc',
          description: 'Nhận được danh hiệu này khi hoàn thành 10 khóa học.',
          award: Reward(
            name: 'Kim cương',
            rewardType: RewardType.diamond,
            quantity: 5,
            isRewardClaimed: false
          ),
          progress: 5,
          total: 10,
        ),
        Title(
          id: 2,
          image: 'url_to_image',
          title: 'Thành thạo',
          description: 'Nhận được danh hiệu này khi đạt 10 bài kiểm tra > 9 điểm',
          award: Reward(
            name: 'Kim cương',
            rewardType: RewardType.diamond,
            quantity: 5,
            isRewardClaimed: true
          ),
          progress: 10,
          total: 10,
        ),
      ],
      cumulativePoint: CumulativePoint(0, 0, 0),
      task: Task(
        dailyTasks: [
          DailyTask(1, 'Học thêm 1 chủ đề từ vựng', 0, 1, Reward(name: "Kim cương", rewardType: RewardType.diamond, quantity: 10, isRewardClaimed: false)),
          DailyTask(1, 'Ôn tập 1 chủ đề ngẫu nhiên', 1, 2, Reward(name: "Vàng", rewardType: RewardType.gold, quantity: 50, isRewardClaimed: false)),
          DailyTask(1, 'Học 1 chủ đề câu', 1, 2, Reward(name: "Kim cương", rewardType: RewardType.diamond, quantity: 5, isRewardClaimed: false)),
        ],

        rollCall: RollCall(currentDay: 2, days: [1,2,3,4,5,6,7], rewards: [
          Reward(name: "Kim cương", rewardType: RewardType.diamond, quantity: 5, isRewardClaimed: true),
          Reward(name: "Vàng", rewardType: RewardType.gold, quantity: 50, isRewardClaimed: false),
          Reward(name: "Vàng", rewardType: RewardType.gold, quantity: 50, isRewardClaimed: false),
          Reward(name: "Vàng", rewardType: RewardType.gold, quantity: 100, isRewardClaimed: false),
          Reward(name: "Vàng", rewardType: RewardType.gold, quantity: 75, isRewardClaimed: false),
          Reward(name: "Vàng", rewardType: RewardType.gold, quantity: 125, isRewardClaimed: false),
          Reward(name: "Kim cương", rewardType: RewardType.diamond, quantity: 25, isRewardClaimed: false)
        ])
      ),
    );

    return jsonEncode([user.toJson()]);
  }
}

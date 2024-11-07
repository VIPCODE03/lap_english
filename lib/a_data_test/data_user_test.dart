import 'dart:convert';

import '../data/model/task_and_reward/daily_task.dart';
import '../data/model/user/cumulative_point.dart';
import '../data/model/user/skill.dart';
import '../data/model/user/user.dart';

class UserDataTest {
  static String getUserJson() {
    User user = User(
      name: 'Đào Như Triệu',
      email: 'daonhutrieu15052003@gmail.com',
      avatar: 'https://photos.google.com/photo/AF1QipMl1Dix6LcAyb3aXACFweq0Zn4liRp57PwjYXRc',
      skills: Skill(2, 4, 3, 3),
      titles:[
        // MdlTitle(
        //   id: 1,
        //   image: 'url_to_image',
        //   title: 'Người học xuất sắc',
        //   task: MdlTask(description: "Học 5 chủ đề mới", progress: 2, total: 5, completed: false, onListen: TaskConstant.taskLearnNew),
        //   award: Reward(rewardType: RewardType.diamond, quantity: 5, isRewardClaimed: false),
        // ),
        // MdlTitle(
        //   id: 2,
        //   image: 'url_to_image',
        //   title: 'Người học đẳng cấp',
        //   task: MdlTask(description: "Ôn tập 4 chủ đề", progress: 4, total: 4, completed: true),
        //   award: Reward(rewardType: RewardType.gold, quantity: 30, isRewardClaimed: false),
        // ),
      ],
      cumulativePoint: CumulativePoint(0, 0, 0),
      dailyTasks: MdlDailyTask.create());

    return jsonEncode([user.toJson()]);
  }
}

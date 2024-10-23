import 'dart:convert';
import 'dart:math';

import '../data/model/user/cumulative_point.dart';
import '../data/model/user/skill.dart';
import '../data/model/user/title.dart';
import '../data/model/user/user.dart';

class UserDataTest {
  static String getUserJson() {
    User user = User(
      1,
      'Đào Như Triệu',
      'daonhutrieu15052003@gmail.com',
      'password123',
      25,
      Skill(2, 4, 3, 3),
      [
        Title(
          id: 1,
          image: 'url_to_image',
          title: 'Người học xuất sắc',
          description: 'Nhận được danh hiệu này khi hoàn thành 10 khóa học.',
          award: Reward(
            name: 'Kim cương',
            rewardType: RewardType.diamond,
            quantity: 5,
          ),
          completed: 10,
          total: 10,
          isRewardClaimed: true,
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
          ),
          completed: 10,
          total: 10,
          isRewardClaimed: true,
        ),
      ],
      CumulativePoint(50, 100),
    );

    // Chuyển đổi đối tượng User thành JSON
    return jsonEncode(user.toJson());
  }
}

void main() {
  print(UserDataTest.getUserJson());
}


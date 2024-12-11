import 'package:lap_english/data/model/user/accumulate.dart';

import '../data/model/task_and_reward/daily_task.dart';
import '../data/model/user/cumulative_point.dart';
import '../data/model/user/skill.dart';
import '../data/model/user/user.dart';

List<User> generateUser() {
  User user = User(
      name: 'Đào Như Triệu',
      email: 'daonhutrieu15052003@gmail.com',
      avatar: 'https://photos.google.com/photo/AF1QipMl1Dix6LcAyb3aXACFweq0Zn4liRp57PwjYXRc',
      skills: Skill(2, 4, 3, 3),
      titles: [],
      cumulativePoint: CumulativePoint(0, 0, 0),
      dailyTasks: MdlDailyTask.create(),
      accumulate: MdlAccumulate(0, 0, 0, 1)
  );
  return [user];
}

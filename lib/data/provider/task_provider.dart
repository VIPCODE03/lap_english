/*  Cung cấp nhiệm vụ */
import 'dart:math';

import '../model/task_and_reward/task.dart';

class TaskProvider {

  //=== Cung cấp nhiệm vụ hàng ngày ===
  static List<MdlTask> createDailyTask() {
    var shuffledTasks = List<MdlTask>.from(_dailyTasks());
    shuffledTasks.shuffle();
    return shuffledTasks.take(3).toList();
  }

  //=== Nhiệm vụ hàng ngày  ===
  static List<MdlTask> _dailyTasks() => [
    MdlTask(description: "Học chủ đề từ vựng mới", progress: 0, total: Random().nextInt(2).toDouble() + 1, completed: false, type: TypeTask.taskQuizz, keyFunUpdate: FunTaskQuiz.funLearnNewTopicWord),
    MdlTask(description: "Ôn tập chủ đề từ vựng", progress: 0, total: Random().nextInt(2).toDouble() + 1, completed: false, type: TypeTask.taskQuizz, keyFunUpdate: FunTaskQuiz.funLearnReviewTopicWord),
    MdlTask(description: "Học chủ đề từ vựng mới đúng 80%", progress: 0, total: Random().nextInt(1).toDouble() + 1, completed: false, type: TypeTask.taskQuizz, keyFunUpdate: FunTaskQuiz.funLearnNewTopicWord80),
    MdlTask(description: "Ôn tập từ vựng đúng trên 90%", progress: 0, total: Random().nextInt(2).toDouble() + 1, completed: false, type: TypeTask.taskQuizz, keyFunUpdate: FunTaskQuiz.funLearnReviewTopicWord),
    MdlTask(description: "Hoàn thành bài học không sai kĩ năng viết", progress: 0, total: Random().nextInt(2).toDouble() + 1, completed: false, type: TypeTask.taskQuizz, keyFunUpdate: FunTaskQuiz.funLearnWithSkillWrite100),
    MdlTask(description: "Ôn tập chủ đề từ vựng", progress: 0, total: Random().nextInt(2).toDouble() + 1, completed: false, type: TypeTask.taskQuizz, keyFunUpdate: FunTaskQuiz.funLearnReviewVocabulary),
  ];
}

class FunTaskQuiz {
  static const String funLearnNewTopicWord = "funLearnNewTopicWord";
  static const String funLearnReviewTopicWord = "funLearnReviewTopicWord";
  static const String funLearnNewTopicWord80 = "funLearnNewTopicWord80";
  static const String funLearnReviewTopicWord90 = "funLearnReviewTopicWord90";
  static const String funLearnWithSkillWrite100 = "funLearnWithSkillWrite100";
  static const String funLearnReviewVocabulary = "funLearnReviewVocabulary";
}
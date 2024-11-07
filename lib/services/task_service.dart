import 'dart:math';

import 'package:lap_english/data/bloc/data_bloc/data_bloc.dart';
import 'package:lap_english/data/model/quizz/quizz.dart';
import 'package:lap_english/data/model/task_and_reward/task.dart';
import 'package:lap_english/data/model/user/user.dart';

mixin TaskService {
  final DataBloc<User> _dataBloc = DataBloc<User>();

  //=== Cập nhật các nhiệm vụ liên quan quizz ===
  Future<void> updateTaskQuizz(QuizzResult quizzResult) async {
    _dataBloc.add(DataEventLoad<User>());

    await for (final state in _dataBloc.stream) {
      if (state is DataStateLoaded<User>) {
        var user = state.data.first;

        //--- Lấy danh sách nhiệm vụ  ---
        List<MdlTask> tasks = [
          ...user.dailyTasks.map((dailyTask) => dailyTask.task),
          ...user.titles.map((title) => title.task),
        ]..where((task) => task.type == TypeTask.taskQuizz).toList();

        //--- Cập nhật nhiệm vụ ---
        for(var task in tasks) {
          task.updateTask(quizzResult);
        }

        _dataBloc.add(DataEventUpdate(datas: [user]));

        await _dataBloc.close();
        break;

      } else if (state is DataStateError<User>) {
        await _dataBloc.close();
        throw Exception("Không thể tải dữ liệu người dùng. \n${state.message}");
      }
    }
  }
}

/*  Cung cấp nhiệm vụ */
class TaskProvider {
  static const String funLearnNewTopicWord = "funLearnNewTopicWord";
  static const String funLearnReviewTopicWord = "funLearnReviewTopicWord";
  static const String funLearnNewTopicWord80 = "funLearnNewTopicWord80";
  static const String funLearnReviewTopicWord90 = "funLearnReviewTopicWord90";
  static const String funLearnWithSkillWrite100 = "funLearnWithSkillWrite100";
  static const String funLearnReviewVocabulary = "funLearnReviewVocabulary";

  //=== Cung cấp nhiệm vụ hàng ngày ===
  static List<MdlTask> createDailyTask() {
    var shuffledTasks = List<MdlTask>.from(_dailyTasks);
    shuffledTasks.shuffle();
    return shuffledTasks.take(3).toList();
  }

  static final List<MdlTask> _dailyTasks = [
    MdlTask(description: "Học chủ đề từ vựng mới", progress: 0, total: Random().nextInt(2).toDouble() + 1, completed: false, type: TypeTask.taskQuizz, keyFunUpdate: TaskProvider.funLearnNewTopicWord),
    MdlTask(description: "Ôn tập chủ đề từ vựng", progress: 0, total: Random().nextInt(2).toDouble() + 1, completed: false, type: TypeTask.taskQuizz, keyFunUpdate: TaskProvider.funLearnReviewTopicWord),
    MdlTask(description: "Học chủ đề từ vựng mới đúng 80%", progress: 0, total: Random().nextInt(1).toDouble() + 1, completed: false, type: TypeTask.taskQuizz, keyFunUpdate: TaskProvider.funLearnNewTopicWord80),
    MdlTask(description: "Ôn tập từ vựng đúng trên 90%", progress: 0, total: Random().nextInt(2).toDouble() + 1, completed: false, type: TypeTask.taskQuizz, keyFunUpdate: TaskProvider.funLearnReviewTopicWord),
    MdlTask(description: "Hoàn thành bài học không sai kĩ năng viết", progress: 0, total: Random().nextInt(2).toDouble() + 1, completed: false, type: TypeTask.taskQuizz, keyFunUpdate: TaskProvider.funLearnWithSkillWrite100),
    MdlTask(description: "Ôn tập chủ đề từ vựng", progress: 0, total: Random().nextInt(2).toDouble() + 1, completed: false, type: TypeTask.taskQuizz, keyFunUpdate: TaskProvider.funLearnReviewVocabulary),


  ];

  //=== Cung cấp hàm cập nhật ===
  static final Map<String, Function(MdlTask, dynamic)> funUpdate = {
    TaskProvider.funLearnNewTopicWord: (task, data) {
      var quizzResult = data as QuizzResult;
      if (quizzResult.isNew) {
        task.progress = (task.progress + 1).clamp(0, task.total);
      }
    },

    TaskProvider.funLearnReviewTopicWord: (task, data) {
      var quizzResult = data as QuizzResult;
      if (!quizzResult.isNew) {
        task.progress = (task.progress + 1).clamp(0, task.total);
      }
    },

    TaskProvider.funLearnNewTopicWord80: (task, data) {
      var quizzResult = data as QuizzResult;
      if (quizzResult.isNew && (quizzResult.correct/quizzResult.total) >= 0.8) {
        task.progress = (task.progress + 1).clamp(0, task.total);
      }
    },

    TaskProvider.funLearnReviewTopicWord90: (task, data) {
      var quizzResult = data as QuizzResult;
      if (!quizzResult.isNew && (quizzResult.correct/quizzResult.total) >= 0.9) {
        task.progress = (task.progress + 1).clamp(0, task.total);
      }
    },

    TaskProvider.funLearnWithSkillWrite100: (task, data) {
      var quizzResult = data as QuizzResult;
      if (quizzResult.correctWrite == quizzResult.totalWrite) {
        task.progress = (task.progress + 1).clamp(0, task.total);
      }
    },

    TaskProvider.funLearnReviewVocabulary: (task, data) {
      var quizzResult = data as QuizzResult;
      if (!quizzResult.isNew && quizzResult.type == TypeQuizz.quizzVocabulary) {
        task.progress = (task.progress + 1).clamp(0, task.total);
      }
    },
  };
}
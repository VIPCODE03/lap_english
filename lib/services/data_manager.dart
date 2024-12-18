// import 'package:lap_english/data/model/quizz/quizz.dart';
// import 'package:lap_english/data/model/task_and_reward/task.dart';
// import 'package:lap_english/data/model/user/user.dart';
//
// import '../bloc/data_bloc/data_bloc.dart';
// import '../data/provider/task_provider.dart';
//
// mixin DataManager {
//
//   //=== Cập nhật các nhiệm vụ liên quan quizz ===
//   Future<void> updateUserQuiz(QuizzResult quizResult) async {
//     final DataBloc<User> dataBloc = DataBloc<User>();
//     dataBloc.add(DataEventLoad<User>());
//
//     await for (final state in dataBloc.stream) {
//       if (state is DataStateLoaded<User>) {
//         User user = state.data.first;
//
//         //--- Cập nhật nhiệm vụ quiz  ---
//         List<MdlTask> tasks = [
//           ...user.dailyTasks.map((dailyTask) => dailyTask.task),
//           ...user.titles.map((title) => title.task),
//         ]..where((task) => task.type == TypeTask.taskQuizz).toList();
//
//         for(var task in tasks) {
//           _funUpdateTaskQuiz(task, quizResult);
//         }
//
//         //--- Cập nhật kĩ năng  ---
//         var totalSkill = user.skills.writing + user.skills.listening + user.skills.speaking + user.skills.writing;
//         if(quizResult.totalRead > 0) user.skills.reading += quizResult.correctRead / quizResult.totalRead * (1 - user.skills.reading / totalSkill);
//         if(quizResult.totalListen > 0) user.skills.listening += quizResult.correctListen / quizResult.totalListen * (1 - user.skills.listening / totalSkill);
//         if(quizResult.totalSpeak > 0) user.skills.speaking += quizResult.correctSpeak/quizResult.totalSpeak * (1 - user.skills.speaking/totalSkill);
//         if(quizResult.totalWrite > 0) user.skills.writing += quizResult.correctWrite/quizResult.totalWrite * (1 - user.skills.writing/totalSkill);
//
//         //--- Cập nhật điểm (vàng)  ---
//         user.cumulativePoint.gold += quizResult.bonus;
//         user.cumulativePoint.rankPoints += quizResult.pointRank;
//
//         //--- Cập nhật điểm tích lũy  ---
//         if(!quizResult.isLearned) {
//           user.accumulate.words += quizResult.totalWord;
//           user.accumulate.sentences += quizResult.totalSentence;
//         }
//
//         dataBloc.add(DataEventUpdate(datas: [user]));
//         await dataBloc.close();
//         break;
//
//       }
//       else if (state is DataStateError<User>) {
//         await dataBloc.close();
//         throw Exception("Không thể tải dữ liệu người dùng. \n${state.message}");
//       }
//     }
//   }
//
//   //=== Cập nhật nhiệm vụ quiz  ===
//   void _funUpdateTaskQuiz(MdlTask task, QuizzResult quizzResult) {
//     switch (task.keyFunUpdate) {
//       case FunTaskQuiz.funLearnNewTopicWord:
//         {
//           if (!quizzResult.isLearned) {
//             task.progress = (task.progress + 1).clamp(0, task.total);
//           }
//           break;
//         }
//
//       case FunTaskQuiz.funLearnReviewTopicWord:
//         {
//           if (quizzResult.isLearned) {
//             task.progress = (task.progress + 1).clamp(0, task.total);
//           }
//           break;
//         }
//
//       case FunTaskQuiz.funLearnNewTopicWord80:
//         {
//           if (!quizzResult.isLearned &&
//               (quizzResult.correct / quizzResult.total) >= 0.8) {
//             task.progress = (task.progress + 1).clamp(0, task.total);
//           }
//           break;
//         }
//
//       case FunTaskQuiz.funLearnReviewTopicWord90:
//         {
//           if (quizzResult.isLearned && (quizzResult.correct / quizzResult.total) >= 0.9) {
//             task.progress = (task.progress + 1).clamp(0, task.total);
//           }
//           break;
//         }
//
//       case FunTaskQuiz.funLearnWithSkillWrite100:
//         {
//           if (quizzResult.correctWrite == quizzResult.totalWrite) {
//             task.progress = (task.progress + 1).clamp(0, task.total);
//           }
//           break;
//         }
//
//       case FunTaskQuiz.funLearnReviewVocabulary:
//         {
//           if (quizzResult.isLearned && quizzResult.type == TypeQuizz.quizzVocabulary) {
//             task.progress = (task.progress + 1).clamp(0, task.total);
//           }
//           break;
//         }
//
//       default:
//         throw Exception('Không tìm thấy nhiệm vụ: ${task.keyFunUpdate}');
//     }
//   }
// }
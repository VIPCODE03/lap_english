// import 'package:lap_english/data/model/learn/sentence.dart';
// import 'package:lap_english/data/model/learn/vocabulary.dart';
// import '../data/bloc/data_bloc/data_bloc.dart';
//
// mixin DataService {
//   //=== Cập nhật các nhiệm vụ liên quan đến quizz ===
//   Future<void> updateData(dynamic data) async {
//     if (data is SubVocabularyTopic) {
//       await _updateVocabularyTopic(data);
//     } else if (data is SubSentenceTopic) {
//       await _updateSentenceTopic(data);
//     } else {
//       throw Exception('Dữ liệu không hợp lệ');
//     }
//   }
//
//   // Cập nhật nhiệm vụ đối với SubVocabularyTopic
//   Future<void> _updateVocabularyTopic(SubVocabularyTopic data) async {
//     final DataBloc<SubVocabularyTopic> dataBloc = DataBloc<SubVocabularyTopic>();
//     dataBloc.add(DataEventLoad<SubVocabularyTopic>());
//
//     await for (final state in dataBloc.stream) {
//       if (state is DataStateLoaded<SubVocabularyTopic>) {
//         // Xử lý dữ liệu và cập nhật nhiệm vụ cho SubVocabularyTopic
//         var topic = state.data.first;
//
//         // Lấy danh sách nhiệm vụ từ dữ liệu này (nếu có)
//         List<MdlTask> tasks = [
//           ...topic.dailyTasks.map((dailyTask) => dailyTask.task),
//           ...topic.titles.map((title) => title.task),
//         ]..where((task) => task.type == TypeTask.taskQuizz).toList();
//
//         // Cập nhật nhiệm vụ
//         for (var task in tasks) {
//           // Giả sử bạn có quizzResult, thực hiện cập nhật nhiệm vụ tại đây
//           // task.updateTask(quizzResult);
//         }
//
//         dataBloc.add(DataEventUpdate(datas: [topic]));
//         await dataBloc.close();
//         break;
//
//       } else if (state is DataStateError<SubVocabularyTopic>) {
//         await dataBloc.close();
//         throw Exception("Không thể tải dữ liệu cho SubVocabularyTopic. \n${state.message}");
//       }
//     }
//   }
//
//   // Cập nhật nhiệm vụ đối với SubSentenceTopic
//   Future<void> _updateSentenceTopic(SubSentenceTopic data) async {
//     final DataBloc<SubSentenceTopic> _dataBloc = DataBloc<SubSentenceTopic>();
//     _dataBloc.add(DataEventLoad<SubSentenceTopic>());
//
//     await for (final state in _dataBloc.stream) {
//       if (state is DataStateLoaded<SubSentenceTopic>) {
//         // Xử lý dữ liệu và cập nhật nhiệm vụ cho SubSentenceTopic
//         var topic = state.data.first;
//
//         // Lấy danh sách nhiệm vụ từ dữ liệu này (nếu có)
//         List<MdlTask> tasks = [
//           ...topic.dailyTasks.map((dailyTask) => dailyTask.task),
//           ...topic.titles.map((title) => title.task),
//         ]..where((task) => task.type == TypeTask.taskQuizz).toList();
//
//         // Cập nhật nhiệm vụ
//         for (var task in tasks) {
//           // Giả sử bạn có quizzResult, thực hiện cập nhật nhiệm vụ tại đây
//           // task.updateTask(quizzResult);
//         }
//
//         _dataBloc.add(DataEventUpdate(datas: [topic]));
//         await _dataBloc.close();
//         break;
//
//       } else if (state is DataStateError<SubSentenceTopic>) {
//         await _dataBloc.close();
//         throw Exception("Không thể tải dữ liệu cho SubSentenceTopic. \n${state.message}");
//       }
//     }
//   }
// }

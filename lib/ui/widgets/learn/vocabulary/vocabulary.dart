// import 'package:flutter/material.dart';
//
// import '../../../../constant/quizz_constant.dart';
// import '../../../../data/model/quizz.dart';
// import '../../../../data/model/vocabulary.dart';
//
// // Giả sử đã có định nghĩa cho Word, Quizz, Quizzes, QuizzConstant...
//
// class QuizScreen extends StatefulWidget {
//   final List<Word> words; // Thêm biến để nhận danh sách words
//
//   QuizScreen({required this.words}); // Constructor nhận danh sách words
//
//   @override
//   _QuizScreenState createState() => _QuizScreenState();
// }
//
// class _QuizScreenState extends State<QuizScreen> {
//   int _currentQuizIndex = 0;
//   late List<Quizz> _quizzes;
//
//   @override
//   void initState() {
//     super.initState();
//     // Khởi tạo quizzes với danh sách words đã truyền vào
//     _quizzes = Quizzes.createQuizzVocabulary(QuizzConstant.quizzesVocabulary(), widget.words);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Quiz'),
//       ),
//       body: _currentQuizIndex < _quizzes.length
//           ? Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             _quizzes[_currentQuizIndex].question,
//             style: TextStyle(fontSize: 24),
//             textAlign: TextAlign.center,
//           ),
//           SizedBox(height: 20),
//           // Hiển thị câu trả lời (nếu cần)
//           ..._quizzes[_currentQuizIndex].answer.entries.map((entry) {
//             return ElevatedButton(
//               onPressed: () {
//                 _showNextQuiz();
//               },
//               child: Text(entry.key), // Hiển thị key của answer
//             );
//           }).toList(),
//         ],
//       )
//           : Center(
//         child: Text(
//           'Hoàn thành tất cả các bài quiz!',
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
//
//   void _showNextQuiz() {
//     setState(() {
//       _currentQuizIndex++;
//     });
//   }
// }
//

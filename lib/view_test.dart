// import 'package:flutter/material.dart';
// import 'package:lap_english/gen/assets.gen.dart';
// import 'package:lap_english/utils/text_to_speak.dart';
//
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: _bookVocabularyDialog(context),
//       ),
//     );
//   }
//
//   Widget _bookVocabularyDialog(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(50), // Bo viền cho dialog
//       ),
//       child: _book(context)
//     );
//   }
//
//   Widget _book(BuildContext context) {
//     final textToSpeakUtil = TextToSpeakUtil();
//     return Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(50)
//       ),
//       child: SizedBox(
//           height: MediaQuery.of(context).size.height * 0.6,
//           child: Card(
//             child: Column(
//               children: [
//                 Image(
//                     width: MediaQuery.of(context).size.width * 0.9,
//                     repeat: ImageRepeat.repeat,
//                     height: 50,
//                     image: Assets.images.logo.left.provider()
//                 ),
//                 Expanded(
//                     child: Container(
//                         decoration: const BoxDecoration(
//                           image: DecorationImage(
//                               fit: BoxFit.cover,
//                               image: NetworkImage(
//                                   "https://haycafe.vn/wp-content/uploads/2022/01/Hinh-nen-trang-cho-dien-thoai-dep.jpg")
//                           ),
//                         ),
//                         child: ListView.builder(
//                           itemCount: 30,
//                           itemBuilder: (context, index) {
//                             return Column(
//                               children: [
//                                 ListTile(
//                                   title: const Text(
//                                     "ahihi",
//                                     style: TextStyle(fontSize: 24),
//                                   ),
//                                   trailing: Row(
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       const Text("US"),
//                                       IconButton(
//                                         onPressed: () {
//                                           textToSpeakUtil.speak("i can fuck you?", TextToSpeakUtil.languageUS, TextToSpeakUtil.rateNormal);
//                                         },
//                                         icon: const Icon(Icons.volume_up),
//                                       ),
//
//                                       const Text("UK"),
//                                       IconButton(
//                                         onPressed: () {
//                                           textToSpeakUtil.speak("i can fuck you?", TextToSpeakUtil.languageUK, TextToSpeakUtil.rateNormal);
//                                         },
//                                         icon: const Icon(Icons.volume_up),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//
//                                 Container(
//                                   height: 1,
//                                   width: MediaQuery.of(context).size.width,
//                                   color: Colors.grey,
//                                 ),
//                               ],
//                             );
//                           },
//                         )
//
//                     )),
//               ],
//             ),
//           )
//       )
//     );
//   }
// }

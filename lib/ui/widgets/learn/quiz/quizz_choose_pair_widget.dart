// import 'package:flutter/cupertino.dart';
// import 'package:lap_english/ui/widgets/learn/quiz/a_quizz_widget.dart';
//
// import '../../../../data/model/quizz/quizz_choose_pair.dart';
// import '../../other/button.dart';
//
// class WdgQuizzChoosePair extends WdgQuizz<QuizzChoosePair> {
//   final ValueChanged<List<String>>? onSelectionChanged;
//   final List<Map<String, String>> datas;
//   final double height;
//   final Offset? offset;
//
//   WdgQuizzChoosePair(
//       this.onSelectionChanged,
//       this.datas,
//       this.height,
//       this.offset,
//       {super.key, required super.quizz}
//       );
//
//   @override
//   WdgQuizzState<QuizzChoosePair, WdgQuizz<QuizzChoosePair>> createState()
//     => _WdgQuizzChoosePairState();
// }
//
// class _WdgQuizzChoosePairState extends WdgQuizzState<QuizzChoosePair,WdgQuizzChoosePair> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       child: GridView(gridDelegate: gridDelegate),
//     );
//   }
//
//   Widget _itemSelect(_ItemAB item) {
//     double dy = 0;
//     if(widget.offset != null) {
//       dy = widget.offset?.dy ?? 0;
//     }
//     return AnimatedPositioned(
//         duration: const Duration(milliseconds: 250),
//         curve: Curves.easeInOutCubicEmphasized,
//         top: item.isMoved ? (item.topEnd - dy) : (item.topBegin - dy),
//         left: item.isMoved ? item.leftEnd : item.leftBegin,
//         child: SizedBox(
//           height: widget.height,
//           width: _calculateTextWidth(item.text),
//           child: WdgButton(
//             onTap: () {
//               setState(() {
//                 resetsLocation();
//
//                 if(item.isMoved) {  //-> Nếu là chọn đáp án
//                   int index = selectedList.indexOf(item);
//                   currentIndex--;
//                   var temp = row1[index];
//                   row1.remove(temp);
//                   row1.add(temp);
//                   selectedList.remove(item);
//                 }
//                 else {  //-> Nếu là hủy chọn đáp án
//                   currentIndex++;
//                   var index = items.indexOf(item);
//                   for(int i = 0; i < row1.length; i++) {
//                     if(items[index].keyEnd == row1[i].key) {
//                       index = i;
//                       break;
//                     }
//                   }
//                   var temp = row1[index];
//                   row1.remove(temp);
//                   row1.insert(currentIndex, temp);
//                   selectedList.add(item);
//                 }
//                 item.isMoved = !item.isMoved;
//                 changed = true;
//               });
//
//               update();
//
//               //--- Cập nhật dữ liệu  ---
//               widget.onSelectionChanged?.call(selectedList.map((item) => item.text).toList());
//             },
//             borderRadius: BorderRadius.circular(12),
//             color: Theme.of(context).primaryColor.withAlpha(25),
//             child: Text(
//                 item.text,
//                 maxLines: 1,
//                 style: const TextStyle(fontSize: 18)
//             ),
//           ),
//         )
//     );
//   }
//
//   //===   Tính độ rộng item ===
//   double _calculateTextWidth(String text) {
//     final TextPainter textPainter = TextPainter(
//       text: TextSpan(text: text, style: const TextStyle(fontSize: 18)),
//       maxLines: 1,
//       textDirection: TextDirection.ltr,
//     )..layout();
//
//     double width = textPainter.size.width + 25;
//     return width > 50 ? width : 50;
//   }
// }
//
// /*  class item */
// class _ItemAB {
//   final GlobalKey keyBegin;
//   final GlobalKey keyEnd;
//
//   String text;
//   bool isMoved = false;
//   double topBegin = 0;
//   double leftBegin = 0;
//   double topEnd = 0;
//   double leftEnd = 0;
//
//   _ItemAB(this.text, this.keyBegin, this.keyEnd);
// }
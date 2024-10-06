//
// import 'package:flutter/cupertino.dart';
//
// class ButtonAnimatedPositioned extends StatelessWidget {
//   String text;
//   ButtonAnimatedPositioned(this.text, {super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedPositioned(
//       left: isMoving ? targetX : 100,
//       top: isMoving ? targetY : 100,
//       duration: const Duration(milliseconds: 300),
//       curve: Curves.easeInOut,
//       child: ElevatedButton(
//         onPressed: () => _moveToTarget(_targetKey1),
//         child: const Text('Move aMe'),
//       ),
//     ),
//
//   }
//
// }
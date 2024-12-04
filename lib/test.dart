import 'package:flutter/material.dart';
import 'package:lap_english/data/model/learn/sentence.dart';
import 'package:lap_english/data/model/quizz/quizz.dart';
import 'package:lap_english/data/model/quizz/quizz_choose_one.dart';
import 'package:lap_english/data/model/quizz/quizz_select_answers.dart';
import 'package:lap_english/main.dart';
import 'package:lap_english/ui/colors/vip_colors.dart';
import 'package:lap_english/ui/widgets/learn/quiz/quizz_choose_one_widget.dart';
import 'package:lap_english/ui/widgets/learn/quiz/quizz_select_widget.dart';
import 'package:lap_english/ui/widgets/other/special_text.dart';

class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<StatefulWidget> createState() => StateTest();
}

class StateTest extends State<TestWidget> {
  bool _isAtTop = false; // Biến để theo dõi trạng thái vị trí
  Quizz quiz = QuizzSelectSentence().generate([
    MdlSentence(1, 'sentence áda', 'ads', 2),
    MdlSentence(1, 'sentence dá d', 'fasf', 2),
    MdlSentence(1, 'sentence adsdas ', 'transgfasflation', 2),
    MdlSentence(1, 'sentence đá', 'translatifafson', 2),
    MdlSentence(1, 'sentence đầ', 'transladsdation', 2),
  ]).first;

  Quizz quiz1 = QuizzChooseOneSentence().generate([
    MdlSentence(1, 'sentence áda', 'ads', 2),
    MdlSentence(1, 'sentence dá d', 'fasf', 2),
    MdlSentence(1, 'sentence adsdas ', 'transgfasflation', 2),
    MdlSentence(1, 'sentence đá', 'translatifafson', 2),
    MdlSentence(1, 'sentence đầ', 'transladsdation', 2),
  ]).first;

  late WdgQuizzSelect wdgQuiz;
  late WdgQuizzChooseOne wdgQuiz1;

  @override
  void initState() {
    super.initState();
    wdgQuiz = WdgQuizzSelect(quizz: quiz as QuizzSelect);
    wdgQuiz1 = WdgQuizzChooseOne(quizz: quiz1 as QuizzChooseOne);

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isAtTop = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 333),
          top: _isAtTop ? 0 : maxHeight / 2,
          left: 0,
          right: 0,
          child: _item()
        ),

        Column(
          children: [
            Opacity(
              opacity: 0,
              child: _item()
            ),

            Expanded(
              child: AnimatedOpacity(
                opacity: _isAtTop ? 1 : 0,
                duration: const Duration(milliseconds: 666),
                child: AnimatedScale(
                  duration: const Duration(milliseconds: 333),
                  onEnd: () => wdgQuiz1.status.isStarted.value = true,
                  scale: _isAtTop ? 1 : 0,
                  child: wdgQuiz1,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _item() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: VipColors.onPrimary(context),
                width: 1
            )
        ),
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Text(
                'Nếu chủ ngữ đã tự mình trải qua hành động nào đó đến thời điểm hiện tại:',
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 10),

            CustomPaint(
                painter: DashedBorderPainter(),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(5),
                  child: const WdgSpecialText(text: '<S> + <have/has> + <been> + <V ed/V3>'),
                )
            )
          ],
        )
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueGrey // Màu của đường viền
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    const dashWidth = 5.0;  // Độ dài của đoạn nét đứt
    const dashSpace = 5.0;  // Khoảng cách giữa các đoạn nét đứt

    double startX = 0.0;
    double startY = 0.0;

    // Vẽ border trên (Top)
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, startY),
        Offset(startX + dashWidth, startY),
        paint,
      );
      startX += dashWidth + dashSpace;
    }

    startX = 0.0;
    startY = size.height;

    // Vẽ border dưới (Bottom)
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, startY),
        Offset(startX + dashWidth, startY),
        paint,
      );
      startX += dashWidth + dashSpace;
    }

    startX = 0.0;
    startY = 0.0;

    // Vẽ border trái (Left)
    while (startY < size.height) {
      canvas.drawLine(
        Offset(startX, startY),
        Offset(startX, startY + dashWidth),
        paint,
      );
      startY += dashWidth + dashSpace;
    }

    startX = size.width;
    startY = 0.0;

    // Vẽ border phải (Right)
    while (startY < size.height) {
      canvas.drawLine(
        Offset(startX, startY),
        Offset(startX, startY + dashWidth),
        paint,
      );
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: TestWidget(),
    ),
  ));
}

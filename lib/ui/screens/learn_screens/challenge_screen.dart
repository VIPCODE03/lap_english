import 'package:flutter/material.dart';
import 'package:lap_english/a_data_test/data_challenge_test.dart';
import 'package:lap_english/data/model/learn/challenge.dart';
import 'package:lap_english/ui/colors/vip_colors.dart';
import 'package:lap_english/ui/screens/learn_screens/quizz_screen.dart';
import 'package:lap_english/ui/themes/size.dart';
import 'package:lap_english/ui/widgets/other/button.dart';
import 'package:lap_english/ui/widgets/other/progress_bar.dart';
import 'package:lap_english/ui/widgets/other/scaffold.dart';

class ChallengeScreen extends StatefulWidget {
  const ChallengeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ChallengeScreen();
}

class _ChallengeScreen extends State<ChallengeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Challenge _challenge;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 60),
    )..reverse(from: 1.0);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        _startQuiz(context);
      }
    });

    _challenge = generateChallenge();
  }

  void _startQuiz(BuildContext context) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => QuizzScreen.challenge(challenge: _challenge)));
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: WdgScaffold(
            body: Padding(
              padding: MediaQuery.paddingOf(context),
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  const Text('Thử thách',
                      style:
                      TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center
                  ),

                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        height: 20,
                        child: WdgAnimatedProgressBar(
                          value: _controller.value,
                          label: "${(_controller.value * 60).toStringAsFixed(0)} s",
                        ),
                      );
                    },
                  ),

                  Expanded(
                      child: Card(
                        color: VipColors.onPrimary(context).withOpacity(0.066),
                        margin: const EdgeInsets.all(33),
                        child: ListView(
                          children: [
                            ..._challenge.content.map((element) => Container(
                              padding: const EdgeInsets.all(6),
                              margin: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(width: 1.5, color: VipColors.onPrimary(context)))
                              ),
                              child: Text(element,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: textSize.medium,
                                      fontWeight: FontWeight.bold
                                  )
                              ),

                            ))
                          ],
                        ),
                      )
                  ),

                  Container(
                    padding: const EdgeInsets.all(12),
                    width: maxWidth,
                    child: WdgButton(
                        onTap: () {
                          _startQuiz(context);
                        },
                        borderRadius: BorderRadius.circular(12),
                        child:  const Text('Bắt đầu ngay', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                    ),
                  )
                ],
              ),
            )
        )
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

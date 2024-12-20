import 'package:flutter/material.dart';
import 'package:lap_english/data/model/quizz/quizz.dart';
import 'package:lap_english/ui/colors/vip_colors.dart';
import 'package:lap_english/ui/widgets/other/progress_bar.dart';
import 'package:lap_english/ui/widgets/other/scaffold.dart';

import '../../../themes/size.dart';
import '../../other/button.dart';

class WdgQuizzResult extends StatefulWidget {
  final QuizzResult quizzResult;

  const WdgQuizzResult({super.key, required this.quizzResult});

  @override
  State<StatefulWidget> createState() => _WdgQuizzResultState();
}

class _WdgQuizzResultState extends State<WdgQuizzResult> {
  late QuizzResult quizzResult;
  List<bool> statusItemBonus = [true, true];

  @override
  void initState() {
    super.initState();
    quizzResult = widget.quizzResult;
  }

  @override
  Widget build(BuildContext context) {
    return WdgScaffold(
        body: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                if(isPortrait)
                  const SizedBox(height: 50),

                /// Text name quiz  ---------------------------------------------
                Text(
                  quizzResult.nameQuiz,
                  style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: VipColors.text(context)
                  ),
                ),

                Expanded(child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runAlignment: WrapAlignment.center,
                  alignment: WrapAlignment.center,
                  children: [
                    const SizedBox(height: 16),

                    /// Item skill  ---------------------------------------------------
                    _buildSkillResult('Reading', quizzResult.totalRead,
                        quizzResult.correctRead),
                    _buildSkillResult('Writing', quizzResult.totalWrite,
                        quizzResult.correctWrite),
                    _buildSkillResult('Listening', quizzResult.totalListen,
                        quizzResult.correctListen),
                    _buildSkillResult('Speaking', quizzResult.totalSpeak,
                        quizzResult.correctSpeak),

                    SizedBox(
                      height: (isPortrait || isTablet) ? 30 : 5,
                      width: isPortrait ? 1 : maxWidth,
                    ),

                    /// Item bonus  -----------------------------------------------------
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildItemBonus(context, 'KN', '+ ${quizzResult.pointRank}', 0),

                        _buildItemBonus(context, 'Vàng', '+ ${quizzResult.bonus}', 1),
                      ],
                    ),
                  ],
                )),

                Container(
                    constraints: BoxConstraints(
                        minHeight: (isTablet || isPortrait) ? textSize.special * 3 : textSize.special * 1.5
                    ),
                    width: (isTablet || !isPortrait) ? (maxWidth / 1.66) : maxWidth * 0.66,
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    child: WdgButton(
                      onTap: () {
                        Navigator.pop(context, quizzResult);
                      },
                      borderRadius: BorderRadius.circular(12),
                      color: VipColors.primary(context),
                      child: Text(
                        'Hoàn thành',
                        style: TextStyle(fontSize: textSize.special),
                      ),
                    )),
              ],
            )
        )
    );
  }

  /// Item skill  ------------------------------------------------------------
  Widget _buildSkillResult(String skill, int total, int correct) {
    double progress = total > 0 ? correct / total : 0;
    return total > 0
        ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              skill,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
              width: isPortrait ? maxWidth : maxWidth / 2.5,
              child: WdgAnimatedProgressBar(
                value: progress,
                label: '${(progress * 100).toStringAsFixed(0)}%',
              ),
            ),
            const SizedBox(height: 8),
          ],
        )
        : const SizedBox.shrink();
  }

  /// Item bonus  ------------------------------------------------------------
  Widget _buildItemBonus(BuildContext context, String title, String point, int index) {
    Future.delayed(Duration(milliseconds: 666 * index), () {
      if(context.mounted) {
        setState(() {
          statusItemBonus[index] = false;
        });
      }
    });
    return AnimatedScale(
        duration: const Duration(milliseconds: 666),
        curve: Curves.bounceIn,
        scale: statusItemBonus[index] ? 0 : 1,
        child: Card(
            child: Container(
                width: isPortrait ? maxWidth / 4 : maxWidth / 8,
                padding: const EdgeInsets.all(6),
                child: Column(
                  children: [
                    Text(
                    title.toUpperCase(),
                    style: TextStyle(
                        fontSize: isPortrait ? maxWidth / 20 : maxWidth / 40,
                        color: VipColors.text(context),
                        fontWeight: FontWeight.bold),
                    ),
                    Text(point,
                      style: TextStyle(
                          fontSize: isPortrait ? maxWidth / 20 : maxWidth / 40,
                          color: Colors.amber,
                          fontWeight: FontWeight.bold)
                    )
                ],
              ),
            )
        )
    );
  }
}

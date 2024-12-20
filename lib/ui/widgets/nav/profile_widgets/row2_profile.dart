import 'package:flutter/material.dart';
import 'package:lap_english/data/model/user/skill.dart';
import 'package:lap_english/ui/colors/vip_colors.dart';
import 'package:lap_english/ui/themes/size.dart';
import 'package:radar_chart/radar_chart.dart';

class WdgRow2Profile extends StatelessWidget {
  final Skills skill;

  const WdgRow2Profile({
    super.key,
    required this.skill,
  });

  @override
  Widget build(BuildContext context) {
    List<String> skillNames = ["Đọc", "Viết", "Nói", "Nghe"];
    List<Color> colors = [Colors.brown, Colors.amberAccent, Colors.green, Colors.indigoAccent];
    List<double> skills = [skill.reading, skill.writing, skill.speaking, skill.listening];
    double max = skills.reduce((a, b) => a > b ? a : b);

    return Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: RadarChart(
                length: 4,
                radius: 50,
                borderStroke: 0.5,
                borderColor: Theme.of(context).primaryColor,
                initialAngle: 50,
                vertices: [
                  for (int i = 0; i < 4; i++)
                    _RadarVertex(
                      radius: 5,
                      color: colors[i],
                    )
                ],
                radars: [
                  RadarTile(
                    values: skills.map((skill) => skill / max * 0.9).toList(),
                    backgroundColor: VipColors.onPrimary(context)
                  ),
                ],
              ),
            ),

            Expanded(
                child: Column(
                  children: [
                    for (int i = 0; i < 4; i++) _itemSkill(colors[i], skillNames[i])
                  ],
            ))
          ],
        );
  }

  ///Item tên skill -----------------------------------------------------------
  Widget _itemSkill(Color color, String nameSkill) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.all(6),
          width: textSize.normal,
          height: textSize.normal,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(50)
          ),
        ),

        Text("Kĩ năng $nameSkill", style: TextStyle(fontSize: textSize.normal))
      ],
    );
  }
}

///Đỉnh radar ----------------------------------------------------------
class _RadarVertex extends StatelessWidget implements PreferredSizeWidget {
  final double radius;
  final Color color;

  const _RadarVertex({
    required this.radius,
    required this.color,
  });

  @override
  Size get preferredSize => Size.fromRadius(radius);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: color,
    );
  }
}
import 'package:flutter/material.dart';
import 'package:lap_english/data/model/user/skill.dart';
import 'package:radar_chart/radar_chart.dart';

class WdgRow2Profile extends StatelessWidget {
  final Skill skill;

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

    return Scaffold(
        appBar: AppBar(title: const Text('Vấn đề kĩ năng :)',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)
            )
        ),
        body: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15, right: 50),
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
                    backgroundColor: Color.alphaBlend(
                        Colors.white.withOpacity(0.5),
                        Theme.of(context).primaryColor),
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
        ));
  }

  ///Item tên skill -----------------------------------------------------------
  Widget _itemSkill(Color color, String nameSkill) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.all(6),
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(50)
          ),
        ),

        Text("Kĩ năng $nameSkill")
      ],
    );
  }
}

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
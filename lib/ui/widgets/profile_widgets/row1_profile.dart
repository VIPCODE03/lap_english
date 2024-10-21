import 'package:flutter/material.dart';
import 'package:lap_english/data/model/skill.dart';
import 'package:lap_english/data/model/user.dart';
import 'package:lap_english/gen/assets.gen.dart';
import 'package:radar_chart/radar_chart.dart';

class WdgRow1Profile extends StatelessWidget {
  // final User user;
  const WdgRow1Profile({
    super.key,
    // required this.user
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///Phần 1 --------------------------------------------------------------
        Row(
          children: [
            Column(
              children: [
                ClipOval(
                  child: Image.network(
                    'https://cdn-media.sforum.vn/storage/app/media/THANHAN/2/2a/avatar-dep-89.jpg',
                    width: 100.0,
                    height: 100.0,
                    fit: BoxFit.cover,
                  ),
                ),

                Text(
                  "Đào Như Triệu",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700
                  ),
                )
              ],
            ),

            ///Biểu đồ  ---------------------------------------------------------
            Container(
              margin: const EdgeInsets.only(left: 30),
              child: _radarChartSkill(
                  context,
                  Skill(234, 424, 332, 415)
              ),
            )
          ],
        ),

        ///SizeBox thông tin ---------------------------------------------------
        Container(
            margin: const EdgeInsets.only(top: 20),
            height: 66,
            child: Row(
              children: [
                Expanded(
                    child: _item(Assets.images.menu.learnSpeak.path, "100")),
                Container(
                  height: 50,
                  width: 0.25,
                  color: Theme.of(context).primaryColor,
                ),
                Expanded(child: _item(Assets.images.menu.learnSpeak.path, "2")),
                Container(
                  height: 50,
                  width: 0.25,
                  color: Theme.of(context).primaryColor,
                ),
                Expanded(child: _item(Assets.images.menu.learnSpeak.path, "3")),
              ],
            )
        ),

        Container(
          margin: const EdgeInsets.only(top: 15, bottom: 15),
          height: 0.25,
          width: MediaQuery.of(context).size.width,
          color: Theme.of(context).primaryColor,
        ),
      ],
    );
  }

  ///Item thông tin ----------------------------------------------------------
  Widget _item(String imagePath, String text) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          imagePath,
          width: 25,
          height: 25,
        ),
        const SizedBox(height: 8),
        Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  ///Biểu đồ kĩ năng  -----------------------------------------------------------
  Widget _radarChartSkill(BuildContext context, Skill skill) {
    List<String> skillName = ["Đọc", "Viết", "Nói", "Nghe"];
    List<double> skills = [skill.reading, skill.writing, skill.speaking, skill.listening];
    double max = skills.reduce((a, b) => a > b ? a : b);

    return RadarChart(
      length: 4,
      radius: 50,
      borderStroke: 0.2,
      borderColor: Theme.of(context).primaryColor,
      initialAngle: 50,
      vertices: [
        for(int i = 0; i < 4; i++)
          _RadarVertex(
            radius: 0,
            text: skillName[i],
          )
      ],
      radars: [
        RadarTile(
          values: skills.map((skill) => skill/max*0.9).toList(),
          backgroundColor: Color.alphaBlend(
              Colors.white.withOpacity(0.5),
              Theme.of(context).primaryColor
          ),
        ),
      ],
    );
  }
}

class _RadarVertex extends StatelessWidget implements PreferredSizeWidget {
  final double radius;
  final String? text;

  const _RadarVertex({
    required this.radius,
    this.text,
  });

  @override
  Size get preferredSize => Size.fromRadius(radius);

  @override
  Widget build(BuildContext context) {
    return Text("$text");
  }
}
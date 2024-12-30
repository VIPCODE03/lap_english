import 'package:flutter/material.dart';
import 'package:lap_english/constant/theme_constant.dart';
import 'package:lap_english/ui/themes/theme.dart';
import 'package:lap_english/ui/themes/themes.dart';
import 'package:lap_english/ui/widgets/other/button.dart';
import 'package:provider/provider.dart';

import '../../../themes/size.dart';

class WdgRow1 extends StatelessWidget {
  const WdgRow1({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 325,
      child: Stack(
        children: [
          ///CONTAINER làm nền hình ảnh  ---------------------------
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Provider.of<Themes>(context, listen: true).vipTheme.imagePath),
                fit: BoxFit.fill,
              ),
            ),
          ),

          ///TEXT họ tên ------------------------------------------------------
          Positioned(
            top: 10,
            left: 10,
            child: Text(
              "Đào Như Triệu",
              style: TextStyle(
                  fontSize: textSize.title,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),

          ///ICONBUTTON settings ----------------------------------------------
          Positioned(
            right: 10,
            child: WdgButton(
              onTap: () {_showThemes(context, ThemeConstant.themes);},
              color: Colors.transparent,
              child: const Icon(Icons.ac_unit, color: Colors.white),
            ),
          ),

          ///CARD thông tin ----------------------------------------------
          Positioned(
            bottom: 0,
            right: 10,
            left: 10,
            child: Card(
                color: Colors.white10,
                child: Padding(
                  padding: const EdgeInsets.all(7),
                  child: Table(
                    children: [
                      TableRow(
                        children: [
                          Center(
                              child: FittedBox(child: Text('Hôm nay',
                                  style: TextStyle(fontSize: textSize.title, color: Colors.white, fontWeight: FontWeight.bold)),
                              )),
                          Center(
                            child: Text('Từ vựng',
                                style: TextStyle(fontSize: textSize.medium, color: Colors.white)),
                          ),
                          Center(
                            child: Text('Câu',
                                style: TextStyle(fontSize: textSize.medium, color: Colors.white)),
                          ),
                        ],
                      ),

                      TableRow(
                        children: [
                          Center(
                            child: Text('Mới',
                                style: TextStyle(fontSize: textSize.medium, color: Colors.white)),
                          ),
                          Center(
                            child: Text('2',
                                style: TextStyle(fontSize: textSize.medium, color: Colors.white, fontWeight: FontWeight.bold)),
                          ),
                          Center(
                            child: Text('5',
                                style: TextStyle(fontSize: textSize.medium, color: Colors.white, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),

                      TableRow(
                        children: [
                          Center(
                            child: Text('Ôn tập',
                                style: TextStyle(fontSize: textSize.medium, color: Colors.white)),
                          ),
                          Center(
                            child: Text('2',
                                style: TextStyle(fontSize: textSize.medium, color: Colors.white, fontWeight: FontWeight.bold)),
                          ),
                          Center(
                            child: Text('5',
                                style: TextStyle(fontSize: textSize.medium, color: Colors.white, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
            ),
          )
        ],
      ),
    );
  }

  /// Dialog chọn theme --------------------------------------------------------
  void _showThemes(BuildContext context, List<VipTheme> themes) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(12.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: themes.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Provider
                      .of<Themes>(context, listen: false)
                      .updateTheme(index);
                },
                child: Image.asset(
                  themes[index].imagePath,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        );
      },
    );
  }
}

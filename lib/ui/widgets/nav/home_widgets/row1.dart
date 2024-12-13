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
    return Stack(
        children: [
          ///CONTAINER làm nền hình ảnh  ---------------------------
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Provider
                    .of<Themes>(context, listen: true)
                    .vipTheme.imagePath
                ),
                fit: BoxFit.cover ,
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
              onTap: () {showImagePickerBottomSheet(context, ThemeConstant.themes);},
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
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ///COLUMN  1 --------------------------------------------
                    Expanded(
                      child: _column('Từ mới hôm nay', '5'),
                    ),

                    ///COLUMN  2 --------------------------------------------
                    Expanded(
                      child: _column('Từ đã ôn tập', '5'),
                    ),

                    ///COLUMN  3 --------------------------------------------
                    Expanded(
                      child: _column('Ngày đã học', '23'),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
    );
  }

  ///Item thông tin -------------------------------------------------------
  Widget _column(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: textSize.normal
          ),
        ),
        const SizedBox(height: 8),
        Text(
          content,
          style: TextStyle(
              color: Colors.white,
              fontSize: textSize.medium,
              fontWeight: FontWeight.bold
          ),
        ),
      ],
    );
  }

  void showImagePickerBottomSheet(BuildContext context, List<VipTheme> themes) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(8.0),
          height: maxHeight/2,
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

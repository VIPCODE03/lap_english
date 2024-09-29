import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lap_english/constant/theme_constant.dart';
import 'package:lap_english/ui/themes/themes.dart';
import 'package:provider/provider.dart';

class Row1 extends StatelessWidget {
  const Row1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //CONTAINER làm nền hình ảnh  ---------------------------
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Provider
                    .of<Themes>(context, listen: false)
                    .themeVip.imagePath
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),

          //TEXT họ tên ------------------------------------------------------
          const Positioned(
            top: 10,
            left: 10,
            child: Text(
              "Đào Như Triệu",
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Georgia'),
            ),
          ),

          //ICONBUTTON settings ----------------------------------------------
          Positioned(
            right: 10,
            child: IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Provider
                    .of<Themes>(context, listen: false)
                    .updateTheme(ThemeConstant.themes[Random().nextInt(ThemeConstant.themes.length)]);
                },
            ),
          ),

          //CARD thông tin ----------------------------------------------
          Positioned(
            bottom: 0,
            right: 10,
            left: 10,
            child: Card(
              color: Theme.of(context).cardColor,
              child: Container(
                width: 500,
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //COLUMN  1 --------------------------------------------
                    Expanded(
                      child: _column('Số từ đã học', '100 từ'),
                    ),

                    //COLUMN  2 --------------------------------------------
                    Expanded(
                      child: _column('Chuỗi ngày', '5'),
                    ),

                    //COLUMN  3 --------------------------------------------
                    Expanded(
                      child: _column('Thời gian học', '23 ngày'),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _column(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16
          ),
        ),
        const SizedBox(height: 8),
        Text(
          content,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold
          ),
        ),
      ],
    );
  }

}

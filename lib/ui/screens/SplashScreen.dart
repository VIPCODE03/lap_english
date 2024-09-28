import 'package:flutter/material.dart';

import '../../constant/AssetsConstant.dart';

void main() {
  runApp(const SplashScreen());
}

class SplashScreen extends StatelessWidget {
   const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
            width: 200,
            child: Image(
                image: NetworkImage(
                    "https://img.pikbest.com/png-images/20190918/cartoon-snail-loading-loading-gif-animation_2734139.png!bw700")),
          ),
        )
      ),
    );
  }


}

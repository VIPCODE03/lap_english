import 'package:flutter/material.dart';
import 'package:lap_english/gen/assets.gen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 200,
                  height: 200,
                  child: Image(
                      image: NetworkImage(
                          "https://anhngueie.com/wp-content/uploads/2022/07/2-1-1024x899-lg.png")),
                ),
                const Text(
                  'Đăng nhập',
                  style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          width: 60,
                          child: Image(
                            image: Assets.images.icon.google.provider(),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Tiếp tục với Google',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}

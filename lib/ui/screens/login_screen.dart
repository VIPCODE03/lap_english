import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lap_english/gen/assets.gen.dart';
import 'package:lap_english/ui/screens/splash_screen.dart';
import 'package:lap_english/ui/themes/size.dart';
import 'package:lap_english/ui/widgets/other/loading.dart';

import '../../bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'openid',
      'profile',
    ],
  );

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (context) => AuthBloc(),
          child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
            if (state is LoadingLoginState) {
              return const WdgLoading();

            } else if (state is ErrorLoginState) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return const Text('data');
                  });
              return _loginScreen(context);

            } else if (state is PendingLoginState) {
              return _loginScreen(context);
            }

            return const SplashScreen();
          })),
    );
  }

  Widget _loginScreen(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 200,
              height: 200,
              child: Image(
                  image: NetworkImage("https://anhngueie.com/wp-content/uploads/2022/07/2-1-1024x899-lg.png")),
            ),
            Text(
              'Đăng nhập',
              style: TextStyle(fontSize: textSize.title, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () async {
                _googleSignIn.signOut();
                context.read<AuthBloc>().add(LoginEvent(await _googleSignIn.signIn(), null));
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
                  Text(
                    'Tiếp tục với Google',
                    style: TextStyle(fontSize: textSize.medium),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

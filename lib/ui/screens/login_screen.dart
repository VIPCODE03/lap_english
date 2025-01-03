import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lap_english/gen/assets.gen.dart';
import 'package:lap_english/ui/screens/user_profile_setup_screen.dart';
import 'package:lap_english/ui/themes/size.dart';
import 'package:lap_english/ui/widgets/other/button.dart';
import 'package:lap_english/ui/widgets/other/loading.dart';

import '../../bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (context) => AuthBloc(),
          child: BlocBuilder<AuthBloc, AuthState>(builder: (childContext, state) {
            if (state is LoadingLoginState) {
              return const WdgLoading();

            } else if (state is ErrorLoginState) {
              return _loginScreen(childContext);

            } else if (state is PendingLoginState) {
              return _loginScreen(childContext);
            }

            return const ProfileSetupScreen();
          })),
    );
  }

  /// Giao diện login ----------------------------------------------------------
  Widget _loginScreen(BuildContext context) {
    final googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'openid',
        'profile',
      ],
    );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: SingleChildScrollView(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                child: Image(image: Assets.images.logo.logo.provider())
            ),

            const SizedBox(height: 33),

            Text(
              'Đăng nhập',
              style: TextStyle(
                  fontSize: textSize.title,
                  fontWeight: FontWeight.bold
              ),
            ),

            WdgButton(
                onTap: () async {
                  googleSignIn.signOut();
                  context.read<AuthBloc>().add(LoginEvent(await googleSignIn.signIn(), null));
                },
                borderRadius: BorderRadius.circular(16),
                alpha: 6,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child:               Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          width: 45,
                          child: Image(image: Assets.images.icon.google.provider(),),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Tiếp tục với Google',
                          style: TextStyle(fontSize: textSize.medium),
                        ),
                      ],
                    )
                )
            ),
          ],
        ),)
      ),
    );
  }
}

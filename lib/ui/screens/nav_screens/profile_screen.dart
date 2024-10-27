import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_english/ui/widgets/other/group.dart';
import '../../../data/bloc/user_bloc.dart';
import '../../widgets/nav_profile_widgets/row1_profile.dart';
import '../../widgets/nav_profile_widgets/row2_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc()..add(UserEventLoad()),
      child: Scaffold(
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserStateInitial) {
              return const Center(child: CircularProgressIndicator());

            } else if (state is UserStateInitialized) {
              final user = state.user;

              return ListView(
                children: [
                  /// ROW1  --------------------------------------------------------------
                  WdgRow1Profile(user: user),

                  /// ROW2  --------------------------------------------------------------
                  const WdgGroup(title: 'Vấn đề kĩ năng :)', opacity: 0.5, height: 1),
                  SizedBox(
                    height: 125,
                    child: WdgRow2Profile(skill: user.skills),
                  ),
                ],
              );
            }

            return const Center(child: Text('Error loading user'));
          },
        ),
      ),
    );
  }
}

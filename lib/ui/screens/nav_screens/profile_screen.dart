import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_english/data/model/user/user.dart';
import 'package:lap_english/ui/widgets/other/group.dart';
import '../../../bloc/data_bloc/data_bloc.dart';
import '../../widgets/nav/profile_widgets/row1_profile.dart';
import '../../widgets/nav/profile_widgets/row2_profile.dart';
import '../../widgets/nav/profile_widgets/row3_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataBloc<User>()..add(DataEventLoad<User>()),
      child: Scaffold(
        body: BlocBuilder<DataBloc<User>, DataState>(
          builder: (context, state) {
            if (state is DataStateLoading<User>) {
              return const Center(child: CircularProgressIndicator());

            } else if (state is DataStateLoaded<User>) {
              final user = state.data.first;

              return ListView(
                children: [
                  /// ROW1  --------------------------------------------------------------
                  WdgRow1Profile(user: user),

                  /// ROW2  --------------------------------------------------------------
                  WdgGroup(
                    title: 'Vấn đề kĩ năng :)',
                    opacity: 0.5,
                    height: 2,
                    child: WdgRow2Profile(skill: user.skills),
                  ),

                  const SizedBox(height: 20),

                  /// ROW3  --------------------------------------------------------------
                  WdgGroup(
                    title: 'Tích lũy',
                    opacity: 0.1,
                    height: 15,
                    alignment: Alignment.center,
                    child: WdgRow3Profile(user: user),
                  ),

                ],
              );
            }

            else if(state is DataStateError<User>) {
              return Center(child: Text(state.message));
            }

            return const Center(child: Text('Error loading user'));
          },
        ),
      ),
    );
  }
}

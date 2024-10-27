import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_english/ui/widgets/nav_task_widgets/row1_task.dart';
import 'package:lap_english/ui/widgets/nav_task_widgets/row2_task.dart';
import '../../../data/bloc/user_bloc.dart';
import '../../widgets/nav_task_widgets/row3_task.dart';
import '../../widgets/other/group.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<StatefulWidget> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
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
                  ///Row1 --------------------------------------------------------------
                  const WdgRow1Task(),

                  /// ROW3  --------------------------------------------------------------
                  const WdgGroup(title: 'Chuỗi ngày học', opacity: 0, height: 0),
                  SizedBox(
                    height: 125,
                    child: WdgRow2Task(user: user),
                  ),

                  /// ROW4  --------------------------------------------------------------
                  const WdgGroup(title: 'Nhiệm vụ hàng ngày', opacity: 0.06, height: 15),
                  WdgRow3Task(dailyTasks: user.task.dailyTasks),
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


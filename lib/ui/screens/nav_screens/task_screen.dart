import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_english/data/model/user/user.dart';
import '../../../data/bloc/data_bloc/data_bloc.dart';
import '../../widgets/nav/task_widgets/row1_task.dart';
import '../../widgets/nav/task_widgets/row3_task.dart';
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
                  ///Row1 --------------------------------------------------------------
                  const WdgRow1Task(),

                  /// ROW3  --------------------------------------------------------------
                  // const WdgGroup(title: 'Chuỗi ngày học', opacity: 0, height: 0),
                  // SizedBox(
                  //   height: 125,
                  //   child: WdgRow2Task(user: user),
                  // ),

                  /// ROW4  --------------------------------------------------------------
                  const WdgGroup(title: 'Nhiệm vụ hàng ngày', opacity: 0.06, height: 15),
                  WdgRow3Task(user: user),
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


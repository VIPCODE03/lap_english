import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_english/data/bloc/data_bloc/data_bloc.dart';
import 'package:lap_english/data/model/user/user.dart';

import '../../../../data/model/task/daily_task.dart';
import '../../other/button.dart';

class WdgRow3Task extends StatefulWidget {
  final User user;

  const WdgRow3Task({super.key, required this.user});

  @override
  State createState() => _WdgRow4ProfileState();
}

class _WdgRow4ProfileState extends State<WdgRow3Task> {
  late List<DailyTask> dailyTasks;

  @override
  void initState() {
    super.initState();
    dailyTasks = widget.user.task.dailyTasks;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 15, right: 15),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: dailyTasks.map((dailyTask) {
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      dailyTask.description,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Row(
                      children: [
                        Image.asset(
                          dailyTask.reward.icon,
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '${dailyTask.reward.quantity}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.amber),
                        ),
                      ],
                    ),
                    trailing: SizedBox(
                      height: 35,
                      width: 100,
                      child: dailyTask.reward.isRewardClaimed
                          ? WdgButton(
                              onTap: () {
                                dailyTask.progress = 0;
                                dailyTask.reward.isRewardClaimed = false;
                                context
                                    .read<DataBloc<User>>()
                                    .add(DataEventUpdate(datas: [widget.user]));
                              },
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey.withAlpha(50),

                          child: const Text('Đã nhận'))

                          : WdgButton(
                              onTap: () {
                                if (dailyTask.progress >= dailyTask.total &&
                                    !dailyTask.reward.isRewardClaimed) {
                                  dailyTask.reward.claimReward(widget.user);
                                } else if (dailyTask.progress <
                                    dailyTask.total) {
                                  dailyTask.progress++;
                                }
                                context
                                    .read<DataBloc<User>>()
                                    .add(DataEventUpdate(datas: [widget.user]));
                              },
                              borderRadius: BorderRadius.circular(12),
                              color: dailyTask.progress < dailyTask.total
                                  ? Colors.grey.withAlpha(50)
                                  : Theme.of(context)
                                  .primaryColor
                                  .withAlpha(90),
                              child: Text(
                                dailyTask.progress < dailyTask.total
                                    ? '${dailyTask.progress}/${dailyTask.total}'
                                    : 'Nhận thưởng',
                              ),
                      ),
                    ),
                  ),
                  Container(
                    height: 1,
                    color: Colors.grey.withAlpha(30),
                  )
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_english/data/database/remote/service/task_reward_service.dart';
import 'package:lap_english/data/model/user/user.dart';
import 'package:lap_english/gen/assets.gen.dart';
import 'package:lap_english/ui/colors/vip_colors.dart';
import 'package:lap_english/ui/themes/size.dart';

import '../../../../bloc/data_bloc/data_bloc.dart';
import '../../../../data/model/task_and_reward/daily_task.dart';
import '../../other/button.dart';

class WdgRow3Task extends StatefulWidget {
  final User user;

  const WdgRow3Task({super.key, required this.user});

  @override
  State createState() => _WdgRow4ProfileState();
}

class _WdgRow4ProfileState extends State<WdgRow3Task> {
  late List<MdlDailyTask> dailyTasks;

  @override
  void initState() {
    super.initState();
    dailyTasks = widget.user.dailyTasks;
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
                      dailyTask.task.description,
                      style: TextStyle(
                        fontSize: textSize.medium
                      ),
                    ),
                    subtitle: Row(
                      children: [
                        Image.asset(
                          Assets.images.icon.gold.path,
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '${dailyTask.reward.gold}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.amber,
                              fontSize: textSize.medium,
                          ),
                        ),
                      ],
                    ),
                    trailing: SizedBox(
                      width: textSize.normal * 8,
                      child: dailyTask.reward.isRewardClaimed
                          ? WdgButton(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey.withAlpha(50),
                              child: Text('Đã nhận',
                                  style: TextStyle(
                                  fontSize: textSize.normal,
                                  fontWeight: FontWeight.bold,
                              ),
                            ))

                          : WdgButton(
                              onTap: () {
                                if (dailyTask.task.progress >= dailyTask.task.total && !dailyTask.reward.isRewardClaimed) {
                                  RewardService().getReward(dailyTask.id);
                                }
                              },
                              borderRadius: BorderRadius.circular(12),
                              color: dailyTask.task.progress < dailyTask.task.total
                                  ? Colors.grey.withAlpha(50)
                                  : VipColors.primary(context),
                              child: Text(
                                dailyTask.task.progress < dailyTask.task.total
                                    ? '${dailyTask.task.progress}/${dailyTask.task.total}'
                                    : 'Nhận thưởng',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: textSize.normal,
                                ),
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

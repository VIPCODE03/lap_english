import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_english/data/bloc/data_bloc/data_bloc.dart';
import 'package:lap_english/data/model/user/user.dart';
import '../../../data/model/task/daily_task.dart';

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
                    trailing: InkWell(
                      onTap: () {
                        if(dailyTask.progress >= dailyTask.total
                            && !dailyTask.reward.isRewardClaimed) {
                          dailyTask.reward.claimReward(widget.user);
                        }
                        else if(dailyTask.progress < dailyTask.total) {
                          dailyTask.progress++;
                        }
                        else if(dailyTask.reward.isRewardClaimed) {
                          dailyTask.progress = 0;
                          dailyTask.reward.isRewardClaimed = false;
                        }
                        context.read<DataBloc<User>>().add(DataEventUpdate(datas: [widget.user]));
                      },
                      child: dailyTask.reward.isRewardClaimed
                          ? Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.withAlpha(50),
                        ),
                        child: const Text("Đã nhận"),
                      )
                          : Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            color: dailyTask.progress < dailyTask.total
                                ? Colors.grey.withAlpha(50)
                                : Theme.of(context).primaryColor.withAlpha(30),
                            border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: dailyTask.progress < dailyTask.total
                              ? Text('${dailyTask.progress}/${dailyTask.total}')
                              : const Text('Nhận thưởng', style: TextStyle(fontWeight: FontWeight.bold))
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

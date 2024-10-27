import 'package:flutter/material.dart';

import '../../../data/model/task/daily_task.dart';

class WdgRow3Task extends StatefulWidget {
  final List<DailyTask> dailyTasks;

  const WdgRow3Task({super.key, required this.dailyTasks});

  @override
  State createState() => _WdgRow4ProfileState();
}

class _WdgRow4ProfileState extends State<WdgRow3Task> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 15, right: 15),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: widget.dailyTasks.map((dailyTask) {
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
                    trailing: dailyTask.reward.isRewardClaimed
                        ? const Icon(Icons.check_circle_outline, color: Colors.green)
                        : Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 66,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).primaryColor,
                              width: 1
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Text('${dailyTask.progress}/${dailyTask.total}')
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

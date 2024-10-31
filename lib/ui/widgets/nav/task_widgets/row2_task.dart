import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_english/data/bloc/data_bloc/data_bloc.dart';
import 'package:lap_english/data/model/user/user.dart';
import 'package:lap_english/ui/colors/color_mix.dart';

import '../../../../data/model/task/roll_call.dart';

class WdgRow2Task extends StatelessWidget {
  final User user;

  const WdgRow2Task({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          double itemWidth = constraints.maxWidth / 7.5 - 10; //-> Tính chiều rộng item
          return Card(
            color: ColorMix.mixWhite(Theme.of(context).primaryColor),
            margin: const EdgeInsets.only(left: 15, right: 15),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: user.task.rollCall.days.length,
              itemBuilder: (context, index) {
                return _itemRollCall(context, user.task.rollCall, index, itemWidth);
              },
            ),
          );
        },
    );
  }

  ///Item điểm danh   ------------------------------------------------------------
  Widget _itemRollCall(BuildContext context, RollCall rollCall, int index, double width) {
    return InkWell(
      onTap: () {
        if(rollCall.days[index] == rollCall.currentDay) {
          var reward = rollCall.rewards[index];
          if(!reward.isRewardClaimed) {
            reward.claimReward(user);
            context.read<DataBloc<User>>().add(DataEventUpdate(datas: [user]));
          }
        }
      },
      child: Opacity(
          opacity: rollCall.days[index] < rollCall.currentDay ? 0.3 : 1.0,
          child: Container(
            margin: const EdgeInsets.only(right: 10),
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Ngày ${rollCall.days[index]}',
                  style: TextStyle(
                      color: rollCall.currentDay == rollCall.days[index]
                          ? rollCall.rewards[index].isRewardClaimed ? Colors.green : Colors.red
                          : null,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 30,
                  width: 30,
                  child: Image.asset(rollCall.rewards[index].icon),
                ),
                Text(
                  '${rollCall.rewards[index].quantity}',
                  style: const TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          )
      )
    );
  }
}



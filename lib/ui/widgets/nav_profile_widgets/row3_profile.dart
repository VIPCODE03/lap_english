import 'package:flutter/material.dart';
import 'package:lap_english/data/model/roll_call.dart';
import 'package:lap_english/data/model/user/title.dart';
import 'package:lap_english/data/model/user/user.dart';

class WdgRow3Profile extends StatefulWidget {
  final User user;
  final RollCall rollCall = RollCall(
      currentDay: 3,
      days: [1, 2, 3, 4, 5, 6 ,7],
      rewardReceives: [true, false, false, false, false, false, false],
      rewards: [
        Reward(name: "Kim cương", rewardType: RewardType.diamond, quantity: 5),
        Reward(name: "Kim cương", rewardType: RewardType.diamond, quantity: 2),
        Reward(name: "Vàng", rewardType: RewardType.gold, quantity: 50),
        Reward(name: "Kim cương", rewardType: RewardType.diamond, quantity: 2),
        Reward(name: "Vàng", rewardType: RewardType.gold, quantity: 100),
        Reward(name: "Vàng", rewardType: RewardType.diamond, quantity: 70),
        Reward(name: "Kim cương", rewardType: RewardType.diamond, quantity: 10),
      ]
  );

  WdgRow3Profile({super.key, required this.user});

  @override
  State<StatefulWidget> createState() => _WdgRow3ProfileState();
}

class _WdgRow3ProfileState extends State<WdgRow3Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
          'Điểm danh hàng ngày',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        )),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double itemWidth = constraints.maxWidth / 7.5 - 10; //-> Chiều rộng - margin item
          return Card(
            margin: const EdgeInsets.only(left: 15, right: 15),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.rollCall.days.length,
              itemBuilder: (context, index) {
                return _itemRollCall(widget.rollCall, index, itemWidth);
              },
            ),
          );
        },
      ),
    );
  }

  ///Item điểm danh   ------------------------------------------------------------
  Widget _itemRollCall(RollCall rollCall, int index, double width) {
    return Opacity(
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
                        ? Colors.red
                        : null,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 50,
                width: 50,
                child: Image.asset(rollCall.rewards[index].icon),
              ),
              Text('${rollCall.rewards[index].quantity}'),
            ],
          ),
        )
    );
  }
}


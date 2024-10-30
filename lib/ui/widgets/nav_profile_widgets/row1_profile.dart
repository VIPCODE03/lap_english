import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lap_english/gen/assets.gen.dart';
import 'package:lap_english/ui/widgets/other/button.dart';
import '../../../data/bloc/data_bloc/data_bloc.dart';
import '../../../data/model/user/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WdgRow1Profile extends StatelessWidget {
  final User user;

  const WdgRow1Profile({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Hàng 1 --------------------------------------------------------------
        Align(
          alignment: Alignment.topRight,
          child: WdgButton(
            onTap: () {
              user.name = "Anh Triệu đẹp trai vãi ò";
              user.skills.listening = Random().nextDouble() * 10;
              user.skills.speaking = Random().nextDouble() * 10;
              user.skills.writing = Random().nextDouble() * 10;
              user.skills.reading = Random().nextDouble() * 10;
              var task = user.task;
              if(task.rollCall.currentDay == 7) {
                task.rollCall.currentDay = 1;
                for (var reward in task.rollCall.rewards) {
                  reward.isRewardClaimed = false;
                }
              } else {
                task.rollCall.currentDay++;
              }

              context.read<DataBloc<User>>().add(DataEventUpdate<User>(datas: [user]));
            },
            color: Colors.transparent,
            child: const Icon(Icons.edit_note, size: 30),
          ),
        ),

        /// Hàng 2 --------------------------------------------------------------
        Center(
          child: Column(
            children: [
              /// Avatar ------------------------------------------------------
              Container(
                padding: const EdgeInsets.all(2.5),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  radius: 50,
                  child: ClipOval(
                    child: Image.network(
                      'https://khoinguonsangtao.vn/wp-content/uploads/2022/10/hinh-anh-chu-mo.jpg',
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
              ),

              /// Text họ tên --------------------------------------------------
              Text(
                user.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),

        /// Hàng 3 --------------------------------------------------------------
        /// SizeBox thông tin ---------------------------------------------------
        Container(
          margin: const EdgeInsets.only(top: 20),
          height: 66,
          child: Row(
            children: [
              /// Danh hiệu -------------------------------------------------
              Expanded(
                child: _item(
                  Assets.images.icon.title.path,
                  "Danh hiệu",
                  user.titles.length,
                ),
              ),
              Container(
                height: 50,
                width: 0.5,
                color: Theme.of(context).primaryColor,
              ),
              /// Kim cương ------------------------------------------------
              Expanded(
                child: _item(
                  Assets.images.icon.dimound.path,
                  "Kim cương",
                  user.cumulativePoint.diamond,
                ),
              ),
              Container(
                height: 50,
                width: 0.5,
                color: Theme.of(context).primaryColor,
              ),
              /// Vàng -----------------------------------------------------
              Expanded(
                child: _item(
                  Assets.images.icon.gold.path,
                  "Vàng",
                  user.cumulativePoint.gold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  ///Item thông tin ----------------------------------------------------------
  Widget _item(String imagePath, String text, int quantity) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 25,
              height: 25,
            ),
            const SizedBox(width: 5),
            Text(text),
          ],
        ),

        const SizedBox(height: 8),
        Text(
          "$quantity",
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

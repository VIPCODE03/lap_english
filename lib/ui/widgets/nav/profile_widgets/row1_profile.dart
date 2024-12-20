import 'package:flutter/material.dart';
import 'package:lap_english/gen/assets.gen.dart';
import 'package:lap_english/ui/colors/vip_colors.dart';
import 'package:lap_english/ui/themes/size.dart';
import 'package:lap_english/ui/widgets/other/button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/data_bloc/data_bloc.dart';
import '../../../../data/caching/cache_manager.dart';
import '../../../../data/model/user/user.dart';

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
              CacheManager().saveStatus(StatusFlag.dataLoaded, false);
              context.read<DataBloc<User>>().add(DataEventUpdate<User>(data: user));
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
                  color: VipColors.primary(context),
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  backgroundColor: VipColors.primary(context),
                  radius: 50,
                  child: ClipOval(
                    child: Image.network(
                      user.avatar ?? '',
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
                style: TextStyle(
                  fontSize: textSize.title,
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
          child: Row(
            children: [
              /// Danh hiệu -------------------------------------------------
              Expanded(
                child: _item(
                  context,
                  Assets.images.icon.title.path,
                  "Điểm hạng",
                  user.cumulativePoint.rankPoints,
                ),
              ),
              Container(
                height: 50,
                width: 2,
                color: VipColors.onPrimary(context),
              ),
              /// Kim cương ------------------------------------------------
              Expanded(
                child: _item(
                  context,
                  Assets.images.icon.dimound.path,
                  "Kim cương",
                  user.cumulativePoint.diamond,
                ),
              ),
              Container(
                height: 50,
                width: 2,
                color: VipColors.onPrimary(context),
              ),
              /// Vàng -----------------------------------------------------
              Expanded(
                child: _item(
                  context,
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
  Widget _item(BuildContext context, String imagePath, String text, int quantity) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 20,
              height: 25,
            ),

            FittedBox(child: Text(text, style: TextStyle(fontSize: textSize.normal)),
            )
          ],
        ),

        const SizedBox(height: 8),
        Text(
          "$quantity",
          style: TextStyle(
              fontSize: textSize.medium,
              fontWeight: FontWeight.bold
          ),
        ),
      ],
    );
  }
}

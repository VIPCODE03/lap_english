import 'package:flutter/material.dart';
import '../../../colors/vip_colors.dart';
import '../../../themes/size.dart';
import '../../other/button.dart';
import '../../other/group.dart';

class WdgItemNavSetting extends StatelessWidget {
  final String title;
  final List<WdgItemButtonNavSetting> options;
  final bool paddingTop;

  const WdgItemNavSetting({super.key, required this.title, required this.options, this.paddingTop = false});

  @override
  Widget build(BuildContext context) {
    return WdgGroup(
        title: title,
        height: paddingTop ? 25 : 0,
        opacity: 0.03,
        child: Padding(
            padding: const EdgeInsets.all(6.6),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: VipColors.onPrimary(context), width: 2)),
                child: Column(children: options.map((option) {
                  return Column(
                    children: [
                      /// option  ----------------------------------------------------------
                      option,

                      /// dải phân cách  ----------------------------------------------------------
                      if(options.indexOf(option) != options.length - 1)
                        Container(width: maxWidth / 1.1, height: 1, color: VipColors.onPrimary(context)),
                    ],
                  );
                }).toList())
            )
        )
    );
  }
}

class WdgItemButtonNavSetting extends StatelessWidget {
  final String text;
  final Function? funSetting;
  final Widget? action;
  final IconData? icon;

  const WdgItemButtonNavSetting({super.key, required this.text, required this.funSetting, this.action, this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: maxWidth,
      child: WdgButton(
          onTap: funSetting ?? () {},
          color: Colors.transparent,
          child: Row(children: [
            /// Icon  ----------------------------------------------------------
            Container(
              margin: const EdgeInsets.only(right: 10),
              width: 20,
              child: Icon(icon, color: VipColors.text(context))
            ),

            /// text  ----------------------------------------------------------
            Text(text,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: textSize.medium,
                )
            ),

            /// action  ----------------------------------------------------------
            Expanded(child: Align(
                alignment: Alignment.centerRight,
                child: action ?? Icon(Icons.keyboard_arrow_right_sharp, color: VipColors.onPrimary(context)))
            )
          ])
      ),
    );
  }
}

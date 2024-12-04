import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lap_english/ui/widgets/other/button.dart';

import '../../../main.dart';

class WdgAppBar extends StatelessWidget {
  final Widget? content;
  final Function? onBack;
  final String? title;
  final List<Widget>? actions;

  const WdgAppBar({super.key,
    this.content,
    this.onBack, this.title,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          height: (isPortrait || isTablet)
              ? maxHeight * 0.066
              : maxHeight * 0.1,
          width: maxWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FittedBox(
                child: WdgButton(
                    onTap: onBack ?? () => Navigator.pop(context),
                    color: Colors.transparent,
                    child: Row(children: [
                      Icon(Icons.design_services, size: (orientation == Orientation.portrait || isTablet)
                          ? maxHeight * 0.03
                          : maxHeight * 0.07),
                      const SizedBox(width: 5),
                      Text(title ?? '', style: GoogleFonts.pangolin(
                        fontSize: (orientation == Orientation.portrait || isTablet) ? 20 : 18,
                      ),)
                    ],)
                ),
              ),

              Expanded(child: content ?? const SizedBox.shrink()),
              Row(children: actions ?? []),
            ],
        )
    );
  }
}
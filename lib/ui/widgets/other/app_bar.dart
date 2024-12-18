import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lap_english/ui/widgets/other/button.dart';

import '../../themes/size.dart';

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
          width: maxWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              WdgButton(
                 onTap: onBack ?? () => Navigator.pop(context),
                 color: Colors.transparent,
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Icon(Icons.design_services, size: textSize.title),
                     const SizedBox(width: 5),
                     Text(title ?? '', style: GoogleFonts.pangolin(
                       fontSize: textSize.title,
                     ),)
                   ],)
              ),

              Expanded(child: content ?? const SizedBox.shrink()),
              Row(children: actions ?? []),
            ],
        )
    );
  }
}
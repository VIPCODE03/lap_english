import 'package:flutter/material.dart';

import 'dialog_widget.dart';

class VipDialog {

  static void showAnimatedScaleDialog({
    required BuildContext context,
    Widget? title,
    Widget? content,
    Color? color,
    bool barrierDismissible = true,
    List<Widget>? actions,
    CrossAxisAlignment? crossAxisAlignment,
    double? height,
    double? width,
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return WdgDialog(
          title: title,
          content: content,
          actions: actions,
          color: color,
          crossAxisAlignment: crossAxisAlignment,
          barrierDismissible: barrierDismissible,
          width: width,
          height: height,
        );
      },
    );
  }
}
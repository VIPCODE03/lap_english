import 'package:flutter/material.dart';
import 'package:lap_english/ui/widgets/other/app_bar.dart';

class WdgScaffold extends StatelessWidget {
  final WdgAppBar? appBar;
  final Widget body;

  const WdgScaffold({super.key,
    this.appBar,
    required this.body
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          appBar ?? const SizedBox.shrink(),
          Expanded(child: body),
        ],
      ),
    );

  }
}
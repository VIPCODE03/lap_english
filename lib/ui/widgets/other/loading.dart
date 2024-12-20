import 'package:flutter/widgets.dart';
import 'package:lap_english/gen/assets.gen.dart';

class WdgLoading extends StatelessWidget {
  const WdgLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        Assets.images.icon.loading.path,
        height: 100,
        width: 100,
      )
    );
  }
}
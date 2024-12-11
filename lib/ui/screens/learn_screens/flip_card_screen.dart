import 'package:flutter/material.dart';
import 'package:lap_english/data/model/learn/vocabulary.dart';
import 'package:lap_english/main.dart';
import 'package:lap_english/ui/colors/vip_colors.dart';
import 'package:lap_english/ui/widgets/other/app_bar.dart';
import 'package:lap_english/ui/widgets/other/button.dart';
import 'package:lap_english/ui/widgets/other/scaffold.dart';
import 'package:lap_english/utils/text_to_speak.dart';

class FlipCardsScreen extends StatelessWidget {
  final TextToSpeakUtil _textToSpeakUtil = TextToSpeakUtil();
  final List<MdlWord> words;
  FlipCardsScreen({super.key, required this.words});

  @override
  Widget build(BuildContext context) {
    double height = maxHeight * 0.66;
    double width = maxWidth * 0.9 - 15;
    return WdgScaffold(
      appBar: const WdgAppBar(title: 'Thẻ ghi nhớ'),
      body: Padding(padding: const EdgeInsets.only(left: 15, top: 30),
        child: _StackedList(children: [
          ...words.map((word) => item(context, word, height, width)),
        ]))
    );
  }

  Widget item(BuildContext context, MdlWord word, double height, double width) {
    return _WdgFlipCard(
      height: height,
      width: width,
      color: VipColors.getRandomColor(context, 50),
      front: Text(word.word, style: const TextStyle(fontSize: 48)),
      backSide: Wrap(
        alignment: WrapAlignment.center,
        direction: Axis.vertical,
        children: [
          WdgButton(
              color: Colors.transparent,
              onTap: () {
                _textToSpeakUtil.speak(word.word, TextToSpeakUtil.languageUS, TextToSpeakUtil.rateNormal);
              },
              child: const Icon(Icons.volume_up_outlined, size: 48)),
          Text(word.word, style: const TextStyle(fontSize: 48)),
          Text(word.meaning, style: const TextStyle(fontSize: 48)),
        ],
      ),
    );
  }
}

class _WdgFlipCard extends StatefulWidget {
  final Widget front;
  final Widget backSide;
  final double? height;
  final double? width;
  final Color? color;

  const _WdgFlipCard({
    required this.front,
    required this.backSide,
    this.height,
    this.width,
    this.color
  });

  @override
  State createState() => _FlipCardState();
}

class _FlipCardState extends State<_WdgFlipCard> {
  bool _isFlipped = false;

  _flipCard() {
    setState(() {
      _isFlipped = !_isFlipped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
          onTap: _flipCard,
          child: AnimatedContainer(
              duration: const Duration(milliseconds: 333),
              transformAlignment: Alignment.center,
              transform: Matrix4.rotationY(_isFlipped ? 3.14 : 0),
              alignment: Alignment.center,
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                color: widget.color ?? Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: !_isFlipped
                  ? widget.front
                  : Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(3.14),
                      child: widget.backSide,
                    )
          ),
        ),
    );
  }
}

class _StackedList extends StatefulWidget {
  _StackedList({
    required this.children,
  }) : assert(children.isNotEmpty);

  final List<Widget> children;

  @override
  State<_StackedList> createState() => _StackedListState();
}

class _StackedListState extends State<_StackedList> {
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: widget.children
            .map((element) {
              final index = widget.children.indexOf(element);
              return AnimatedPositioned(
                duration: const Duration(milliseconds: 333),
                top: index * 11,
                left: index * 7,
                child: AnimatedScale(
                  duration: const Duration(milliseconds: 333),
                  scale: index <= 3 ? 1 - (index / 50) : 0,
                  child: Dismissible(
                      key: UniqueKey(),
                      direction: DismissDirection.horizontal,
                      onDismissed: (DismissDirection direction) {
                        return setState(() {
                          widget.children.removeAt(index);
                        });
                      },
                      child: Opacity(
                        opacity: (1 - (index - 1) / 3).clamp(0, 1),
                        child: element,
                      )),
                ),
              );
            })
            .toList()
            .reversed
            .toList()
    );
  }
}

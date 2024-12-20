import 'package:flutter/material.dart';
import 'package:lap_english/data/model/learn/word_sentence.dart';
import 'package:lap_english/ui/colors/vip_colors.dart';
import 'package:lap_english/ui/widgets/other/app_bar.dart';
import 'package:lap_english/ui/widgets/other/button.dart';
import 'package:lap_english/ui/widgets/other/scaffold.dart';
import 'package:lap_english/utils/loaddata_link.dart';
import 'package:lap_english/utils/player_audio.dart';
import 'package:lap_english/utils/text_to_speak.dart';

import '../../themes/size.dart';

class FlipCardsScreen extends StatefulWidget {
  final List<Word> words;
  const FlipCardsScreen({super.key, required this.words});

  @override
  State<StatefulWidget> createState() => _FlipCardsScreenState();
}

class _FlipCardsScreenState extends State<FlipCardsScreen> {
  late TextToSpeakUtil _textToSpeakUtil;
  late AudioPlayerUtil _audioPlayerUtil;

  @override
  void initState() {
    super.initState();
    _textToSpeakUtil = TextToSpeakUtil();
    _audioPlayerUtil = AudioPlayerUtil();
  }

  @override
  Widget build(BuildContext context) {
    return WdgScaffold(
        appBar: const WdgAppBar(title: 'Thẻ ghi nhớ'),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: maxWidth / (isTablet || isPortrait ? 12 : 16), vertical: maxHeight / 24),
            child: (isPortrait || isTablet) ? Column(children: _item()) : Row(children: _item())
        )
    );
  }

  List<Widget> _item() {
    return
      [
        Expanded(
          child: _StackedList(children: [
            ...widget.words.map((word) => _WdgFlipCard(
              height: maxHeight / 1.6,
              width: maxWidth / 1.26,
              color: VipColors.getRandomColor(context, 66),
              front: Text(word.word, style: const TextStyle(fontSize: 40)),
              backSide: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  WdgButton(
                      color: Colors.transparent,
                      onTap: () {
                        if(word.audioUsBlobName != null) {
                          _audioPlayerUtil.playFromUrl(LoadDataUtil.loadSound(word.audioUsBlobName!));
                        }
                        else {
                          _textToSpeakUtil.speak(word.word, TextToSpeakUtil.languageUS,
                              TextToSpeakUtil.rateNormal);
                        }
                      },
                      child: const Icon(Icons.volume_up_outlined, size: 40)),
                  Text(word.word, style: const TextStyle(fontSize: 40)),
                  Text(word.meaning, style: const TextStyle(fontSize: 40)),
                ],
              ),
            )).toList()..shuffle(),
          ]),
        ),

        WdgButton(
            onTap: () {
              setState(() {});
            },
            borderRadius: BorderRadius.circular(50),
            child: const Icon(Icons.refresh, size: 40, color: Colors.grey,)
        )
    ];
  }
}

/// Thẻ lật --------------------------------------------------------------------
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
  bool _isFlipping = false;

  _flipCard() {
    setState(() {
      _isFlipped = !_isFlipped;
      _isFlipping = true;
    });
    Future.delayed(const Duration(milliseconds: 111), () {
      setState(() {
        _isFlipping = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: _flipCard,
          child: AnimatedScale(
            scale: _isFlipping ? 0.9 : 1,
            duration: const Duration(milliseconds: 333),
            child: AnimatedContainer(
                duration: const Duration(milliseconds: 333),
                transformAlignment: Alignment.center,
                transform: Matrix4.rotationY(_isFlipped ? 3.14 : 0),
                alignment: Alignment.center,
                width: widget.width,
                height: widget.height,
                decoration: BoxDecoration(
                  color: widget.color ?? Theme.of(context).cardColor,
                  border: Border.all(color: Colors.grey, width: 2),
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
          )
      );
  }
}

/// Stack widget  --------------------------------------------------------------
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
          children: widget.children.map((element) {
            final index = widget.children.indexOf(element);
            return AnimatedPositioned(
              duration: const Duration(milliseconds: 333),
              top: index * 6,
              left: index * 6,
              child: AnimatedScale(
                duration: const Duration(milliseconds: 333),
                scale: index <= 3 ? 1 - index * 0.01 : 0,
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
          }).toList().reversed.toList()
    );
  }
}

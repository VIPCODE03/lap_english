import 'package:flutter/material.dart';
import 'package:lap_english/data/model/quizz/quizz_select_answers.dart';
import 'package:lap_english/ui/colors/vip_colors.dart';
import 'package:lap_english/ui/widgets/learn/quiz/a_quizz_widget.dart';
import '../../../themes/size.dart';
import '../../other/button.dart';

/*  Quizz chọn đáp án  */
class WdgQuizzSelect extends WdgQuizz<QuizzSelect> {
  WdgQuizzSelect({super.key, required super.quizz});

  @override
  WdgQuizzState<QuizzSelect, WdgQuizz<QuizzSelect>> createState()
    => _WdgQuizzSelectState();
}

class _WdgQuizzSelectState extends WdgQuizzState<QuizzSelect, WdgQuizzSelect> {
  String? selectedKey;
  GlobalKey testScreenKey = GlobalKey();
  late Offset offset = Offset.zero;
  bool setOffset = false;

  @override
  void initState() {
    super.initState();
    widget.status.isStarted.addListener(() {
      if(widget.status.isStarted.value == true) {
        update();
      }
    });

    hasChanged.addListener(update);
  }

  void update() {
    setState(() {});
    WidgetsBinding.instance.addPostFrameCallback(_getOffset);
  }

  @override
  void dispose() {
    super.dispose();
    hasChanged.removeListener(update);
  }

  void _getOffset(_) {
    final renderBox =
        testScreenKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null && renderBox.hasSize) {
      setState(() {
        offset = renderBox.localToGlobal(Offset.zero);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var newWidget = SizedBox(
        height: maxHeight,
        child: widget.status.isStarted.value == true
            ? _WdgButtonSelect(
                key: testScreenKey,
                datas: widget.quizz.answers,
                offset: offset,
                onSelectionChanged: (value) => {
                  if (value.isNotEmpty) {
                      widget.status.isCorrect = value.toString() == widget.quizz.answersCorrect.keys.toList().toString(),
                      widget.status.isAnswered.value = true,
                      widget.status.correctAnswer = widget.quizz.answerCorrect,
                  }
                  else {
                      widget.status.isAnswered.value = false,
                    }
                },
              )
            : widget.status.isEnd.value == true
            ? null
            : const _WdgButtonSelect(datas: [])
    );

    return newWidget;
  }
}

/// Button select --------------------------------------------------------------
class _WdgButtonSelect extends StatefulWidget {
  final ValueChanged<List<String>>? onSelectionChanged;
  final List<String> datas;
  final Offset? offset;

  const _WdgButtonSelect({
    super.key,
    required this.datas,
    this.offset,
    this.onSelectionChanged,
  });

  @override
  State<StatefulWidget> createState() => _WdgButtonSelectState();
}

class _WdgButtonSelectState extends State<_WdgButtonSelect> {
  late List<_ItemLocation> row1 = [];
  late List<_ItemLocation> row2 = [];
  late List<_ItemAB> items = [];

  int currentIndex = -1;
  final List<_ItemAB> selectedList = [];
  final double spacing = 6;
  bool init = false;
  double itemHeight = 1;

  @override
  void initState() {
    super.initState();

    hasChanged.addListener(update);

    for (var text in widget.datas) {
      var keyBegin = GlobalKey();
      var keyEnd = GlobalKey();
      row1.add(_ItemLocation(keyEnd, text));
      row2.add(_ItemLocation(keyBegin, text));
      items.add(_ItemAB(text, keyBegin, keyEnd));
    }
  }

  @override
  void dispose() {
    super.dispose();
    hasChanged.removeListener(update);
  }

  @override
  Widget build(BuildContext context) {
    _getHeight();
    var widgetNew = LayoutBuilder(builder: (context, contranins) {
      return Stack(
        children: [
          /// Đáp án được chọn -----------------------------------------------------------
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.symmetric(horizontal: 6),
              child: Wrap(
                spacing: spacing,
                runSpacing: spacing,
                children: [...row1.map((e) => _itemLocation(e))],
              )
          ),

          /// Thanh  -----------------------------------------------------------
          Container(
            alignment: Alignment.topLeft,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < _calculateLines(contranins.maxWidth); i++)
                    Container(
                      margin: EdgeInsets.only(bottom: itemHeight + (i == 0 ? spacing / 3.5 : spacing) - 2),
                      height: 2,
                      width: contranins.maxWidth,
                      decoration: BoxDecoration(
                        color: i == 0 ? Colors.transparent : VipColors.onPrimary(context),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                ],
              )
          ),

          /// Đáp án ---------------------------------------------------------------
          Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: ((isPortrait && _calculateLines(contranins.maxWidth) <= 3) || isTablet) ? maxHeight / textSize.special : 0),
              child: Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.center,
                spacing: spacing,
                runSpacing: spacing,
                children: [...row2.map((e) => _itemLocation(e))],
              )
          ),

          /// Item di chuyển  -------------------------------------------------------------
          ...items.map((item) => _itemSelect(item)),
        ],
      );

    });

    if(!init) {
      init = true;
      update();
    }
    return widgetNew;
  }

  /// Item vị trí -------------------------------------------------------------
  Widget _itemLocation(_ItemLocation item) {
    return Container(
        constraints: BoxConstraints(minWidth: maxWidth / (isPortrait || isTablet ? 10 : 20)),
      child: WdgButton(
        key: item.key,
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        color: Colors.transparent,
        child: Text(item.text,
            maxLines: 1,
            style: TextStyle(fontSize: textSize.special, color: Colors.transparent)),
      )
    );
  }

  /// Item di chuyển -------------------------------------------------------------
  Widget _itemSelect(_ItemAB item) {
    double dy = 0;
    if(widget.offset != null) {
      dy = widget.offset?.dy ?? 0;
    }
    return AnimatedPositioned(
        duration: const Duration(milliseconds: 333),
        curve: Curves.easeInOutCubicEmphasized,
        top: item.isMoved ? (item.topEnd - dy) : (item.topBegin - dy),
        left: item.isMoved ? item.leftEnd : item.leftBegin,
        child: Container(
            constraints: BoxConstraints(minWidth: maxWidth / (isPortrait || isTablet ? 10 : 20)),
            child: WdgButton(
              onTap: () {
                setState(() {
                  if (item.isMoved) { //-> Nếu là chọn đáp án
                    int index = selectedList.indexOf(item);
                    currentIndex--;
                    var temp = row1[index];
                    row1.remove(temp);
                    row1.add(temp);
                    selectedList.remove(item);

                  } else {  //-> Nếu là hủy chọn đáp án
                    currentIndex++;
                    var index = items.indexOf(item);
                    for (int i = 0; i < row1.length; i++) {
                      if (items[index].keyEnd == row1[i].key) {
                        index = i;
                        break;
                      }
                    }
                    var temp = row1[index];
                    row1.remove(temp);
                    row1.insert(currentIndex, temp);
                    selectedList.add(item);
                  }
                  item.isMoved = !item.isMoved;
                });

                update();

                //--- Cập nhật dữ liệu  ---
                widget.onSelectionChanged?.call(selectedList.map((item)
                => item.text).toList());
              },
              borderRadius: BorderRadius.circular(12),
              color: VipColors.onPrimary(context),
              alpha: 10,
                child: Text(item.text,
                    maxLines: 1,
                    style: TextStyle(fontSize: textSize.special)
                ),
              ))
    );
  }

  //=== Tính số dòng  ===
  int _calculateLines(double maxWidth) {
    double totalWidthText = 0;
    for(var text in widget.datas) {
      TextSpan textSpan = TextSpan(
          text: text,
          style: TextStyle(fontSize: textSize.special)
      );

      TextPainter textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
        maxLines: 1,
      );

      textPainter.layout(maxWidth: maxWidth);
      totalWidthText += textPainter.size.width + 16 + spacing;
    }

    return ((totalWidthText / maxWidth).toInt() + 2);
  }

  void _getHeight() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final renderBox = row1.first.key.currentContext?.findRenderObject() as RenderBox?;
      itemHeight = renderBox?.size.height ?? 10;
    });
  }

  //=== Cập nhật giao diện  ===
  void update() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (var item in items) {
        //---   Vị trí ban đầu  ---
        RenderBox renderBoxBegin = item.keyBegin.currentContext?.findRenderObject() as RenderBox;
        Offset positionBegin = renderBoxBegin.localToGlobal(Offset.zero);
        item.topBegin = positionBegin.dy;
        item.leftBegin = positionBegin.dx;

        //---   Vị trí di chuyển tới  ---
        RenderBox renderBoxEnd = item.keyEnd.currentContext?.findRenderObject() as RenderBox;
        Offset positionEnd = renderBoxEnd.localToGlobal(Offset.zero);
        item.topEnd = positionEnd.dy;
        item.leftEnd = positionEnd.dx;

      }
        setState(() {});
    });
  }
}

/*  class item vị trí */
class _ItemLocation {
  final GlobalKey key;
  final String text;

  _ItemLocation(this.key, this.text);
}

/*  class item */
class _ItemAB {
  final GlobalKey keyBegin;
  final GlobalKey keyEnd;
  String text;
  bool isMoved = false;
  double topBegin = 0;
  double leftBegin = 0;
  double topEnd = 0;
  double leftEnd = 0;

  _ItemAB(this.text, this.keyBegin, this.keyEnd);
}
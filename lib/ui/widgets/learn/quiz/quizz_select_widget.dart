import 'package:flutter/material.dart';
import 'package:lap_english/data/model/quizz/quizz_select_answers.dart';
import 'package:lap_english/main.dart';
import 'package:lap_english/ui/widgets/learn/quiz/a_quizz_widget.dart';
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
                height: orientation == Orientation.portrait ? maxHeight * 0.066 : maxHeight * 0.1,
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
            : const _WdgButtonSelect(datas: [], height: 50)
    );

    return newWidget;
  }
}

/// Button select --------------------------------------------------------------
class _WdgButtonSelect extends StatefulWidget {
  final ValueChanged<List<String>>? onSelectionChanged;
  final List<String> datas;
  final double height;
  final Offset? offset;

  const _WdgButtonSelect({
    super.key,
    required this.datas,
    required this.height,
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
  List<_ItemAB> selectedList = [];

  double magin1 = 10;
  double magin2 = 30;
  final double spacing = 12;

  double heightTotal = 0;
  double widthTotal1 = 15;
  double widthTotal2 = 30;
  int row1Index = 0;
  int row2Index = 0;

  bool nextRow1 = false;
  bool nextRow2 = false;

  bool changed = true;
  bool init = false;
  
  @override
  void initState() {
    super.initState();

    for (var text in widget.datas) {
      var keyBegin = GlobalKey();
      var keyEnd = GlobalKey();
      row1.add(_ItemLocation(keyEnd, text));
      row2.add(_ItemLocation(keyBegin, text));
      items.add(_ItemAB(text, keyBegin, keyEnd));
    }

    hasChanged.addListener(onChange);
  }

  void onChange() {
    resetsLocation();
    update();
  }

  @override
  void dispose() {
    super.dispose();
    hasChanged.removeListener(update);
  }

  @override
  Widget build(BuildContext context) {
    if(orientation == Orientation.portrait) {
      magin2 = maxWidth / 10;
    }
    widthTotal2 = magin2;

    var newWidget = Stack(
      children: [
        for (var item in row1)  //-> Hàng 1 ---
          Positioned(
            left: calculationLocation(true, _calculateTextWidth(context, item.text), maxWidth, item),
            top: item.top,
            child: _itemLocation(item),
          ),

        for (int i = 1; i < row1Index + ((orientation == Orientation.portrait || isTablet)? 3 : 2); i++) //-> Dòng kẻ ---
          Positioned(
            top: widget.height * i + (i - 1) * spacing + 1,
            left: magin1,
            right: magin1,
            child: Container(
              height: 2,
              width: maxWidth,
              decoration: BoxDecoration(
                  color: Color.alphaBlend(Theme.of(context).primaryColor.withAlpha(25), Colors.grey),
                  borderRadius: BorderRadius.circular(50)
              ),
            ),
          ),

        for (var item in row2)  //-> Hàng 2 ---
          Positioned(
            left: calculationLocation(false, _calculateTextWidth(context, item.text), maxWidth, item),
            bottom: item.bottom,
            child: _itemLocation(item),
          ),

        ...items.map((item) => _itemSelect(item)), //-> Item  ---
      ],
    );

    if(!init) {
      init = true;
      update();
    }
    return newWidget;
  }

  /// Item vị trí -------------------------------------------------------------
  Widget _itemLocation(_ItemLocation item) {
    return SizedBox(
      height: widget.height,
      width: _calculateTextWidth(context, item.text),
      child: WdgButton(
        key: item.key,
        buttonFit: ButtonFit.scaleDown,
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        color: Colors.transparent,
        child: Text(
            item.text,
            maxLines: 1,
            style: const TextStyle(fontSize: 18, color: Colors.transparent)
        ),
      ),
    );
  }

  /// Item di chuyển -------------------------------------------------------------
  Widget _itemSelect(_ItemAB item) {
    double dy = 0;
    if(widget.offset != null) {
      dy = widget.offset?.dy ?? 0;
    }
    return AnimatedPositioned(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutQuint,
        top: item.isMoved ? (item.topEnd - dy) : (item.topBegin - dy),
        left: item.isMoved ? item.leftEnd : item.leftBegin,
        child: SizedBox(
          height: widget.height,
          width: _calculateTextWidth(context, item.text),
          child: WdgButton(
              buttonFit: ButtonFit.scaleDown,
              onTap: () {
                setState(() {
                  resetsLocation();

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
              color: Theme.of(context).primaryColor.withAlpha(25),
                child: Text(item.text,
                    maxLines: 1, style: const TextStyle(fontSize: 18)),
              ))
    );
  }

  //===   Hàm tính toán vị trí  ===
  double? calculationLocation(bool answer, double width, double widthMax, _ItemLocation item) {
      //--- 1  ---
      if (answer) {
        if (widthTotal1 + width > widthMax - magin1/2) {
          row1Index++;
          nextRow1 = true;
          widthTotal1 = magin1;
        }
        item.top = row1Index * widget.height + row1Index * spacing;
        double currentLeft = widthTotal1;
        widthTotal1 += width + spacing;
        return currentLeft;
      }

      //--- 2  ---
      else {
        if (widthTotal2 + width > widthMax - magin2/2) {
          row2Index++;
          nextRow2 = true;
          widthTotal2 = magin2;
        }
        item.left = widthTotal2;
        item.bottom = row2Index * widget.height + row2Index * spacing;
        widthTotal2 += width + spacing;
        return item.left;
      }
  }

  //===   Tính độ rộng item ===
  double _calculateTextWidth(BuildContext context, String text) {
    final double baseFontSize = Theme.of(context).textTheme.titleLarge?.fontSize ?? 20;
    final double textScaleFactor = MediaQuery.of(context).textScaler.textScaleFactor;
    final double fontSize = baseFontSize * textScaleFactor;

    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: TextStyle(fontSize: fontSize)),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();

    double width = textPainter.size.width + 20;
    if(text.length < 3) {
      width *= 1.4;
    }

    return width;
  }

  //===   Thiết lập lại vị trí  ===
  void resetsLocation() {
    widthTotal1 = magin1;
    widthTotal2 = magin2;
    row1Index = 0;
    row2Index = 0;
    nextRow1 = false;
    nextRow2 = false;
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
        setState(() {
          resetsLocation();
        });
    });
  }
}

/*  class item vị trí */
class _ItemLocation {
  final GlobalKey key;
  final String text;
  double? bottom;
  double? top;
  double? left;

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
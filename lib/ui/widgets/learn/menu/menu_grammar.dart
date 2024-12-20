import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_english/bloc/data_bloc/data_bloc.dart';
import 'package:lap_english/data/model/learn/grammar.dart';
import 'package:lap_english/ui/colors/vip_colors.dart';
import 'package:lap_english/ui/screens/learn_screens/quizz_screen.dart';
import 'package:lap_english/ui/widgets/other/app_bar.dart';
import 'package:lap_english/ui/widgets/other/button.dart';
import 'package:lap_english/ui/widgets/other/dashed_border.dart';
import 'package:lap_english/ui/widgets/other/scaffold.dart';
import 'package:lap_english/ui/widgets/other/special_text.dart';

import '../../../themes/size.dart';
import '../../other/loading_item.dart';

class WdgMenuGrammar extends StatefulWidget {
  final List<TypeGrammar> typeGrammars;

  const WdgMenuGrammar({super.key, required this.typeGrammars});

  @override
  State<StatefulWidget> createState() => _WdgMenuGrammarState();
}

class _WdgMenuGrammarState extends State<WdgMenuGrammar> {
  GlobalKey? _currentSelectKey;
  late List<GlobalKey> keys;
  late List<ExpansionTileController> _controllers;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    keys = List.generate(widget.typeGrammars.length, (index) => GlobalKey());
    _controllers = List.generate(widget.typeGrammars.length, (index) => ExpansionTileController());
  }

  //=== Trượt item lên trên đầu ===
  void _scrollToIndex(int index) {
    final key = keys[index];
    final context = key.currentContext;
    if (context != null) {
      final RenderBox renderBox = context.findRenderObject() as RenderBox;
      final double itemPosition = renderBox.localToGlobal(Offset.zero).dy;
      final double screenPosition = MediaQuery.of(context).padding.top;

      final double currentScrollPosition = _scrollController.offset;
      final double offsetToScroll = currentScrollPosition + itemPosition - screenPosition;

      _scrollController.animateTo(
        offsetToScroll,
        duration: const Duration(milliseconds: 333),
        curve: Curves.decelerate,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.typeGrammars.length,
      controller: _scrollController,
      itemBuilder: (BuildContext contextList, int index) {
       return Container(
                    key: keys[index],
                    margin: const EdgeInsets.all(12),
                    child: WdgDashedBorder(
                        color: VipColors.primary(context),
                        child: ExpansionTile(
                          controller: _controllers[index],
                          expansionAnimationStyle: AnimationStyle(
                              curve: Curves.decelerate,
                              duration: const Duration(milliseconds: 333)
                          ),
                          title: Text(
                            widget.typeGrammars[index].name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: textSize.title),
                          ),
                          trailing: AnimatedRotation(
                            duration: const Duration(milliseconds: 222),
                            turns: keys[index] == _currentSelectKey ? 0.25 : 0,
                            child: const Icon(Icons.keyboard_arrow_right_sharp),
                          ),
                          onExpansionChanged: (isExpanded) {
                            if(_currentSelectKey == keys[index]) {
                              _currentSelectKey = null;
                              Future.delayed(const Duration(milliseconds: 333), () {
                                setState(() {});
                              });
                            }
                            else {
                              if(_currentSelectKey != null) {
                                _controllers[keys.indexOf(_currentSelectKey!)].collapse();
                              }
                              setState(() {
                                _currentSelectKey = keys[index];
                              });
                              Future.delayed(const Duration(milliseconds: 222), () {
                                _scrollToIndex(index - 1);
                              });
                            }
                          },
                          children: [
                            if (keys[index] == _currentSelectKey)
                              BlocProvider(
                                create: (context) => DataBloc<Grammar>()..add(DataEventLoad<Grammar>(args: widget.typeGrammars[index].id)),
                                child: BlocBuilder<DataBloc<Grammar>, DataState>(
                                  builder: (context, grammarState) {
                                    if (grammarState is DataStateLoading<Grammar>) {
                                      return Column(
                                        children: [
                                          ...List.generate(3, (index) => WdgItemLoading(child: Container(margin: const EdgeInsets.all(10), height: 50)))
                                        ],
                                      );

                                    } else if (grammarState is DataStateLoaded<Grammar>) {
                                      return Column(
                                        children: grammarState.data.map((grammar) {
                                          final GlobalKey key = GlobalKey();

                                          /// Item grammar  ----------------------------------------------------------------
                                          return Padding(
                                            padding: const EdgeInsets.all(6),
                                            child: WdgButton(
                                              onTap: () {
                                                final RenderBox renderBox = key.currentContext!.findRenderObject() as RenderBox;
                                                final Offset position = renderBox.localToGlobal(Offset.zero);

                                                //--- Chuyển sang chi tiết  ---
                                                Navigator.of(context).push(PageRouteBuilder(
                                                  pageBuilder: (context, animation, secondaryAnimation) => _DetailGrammar(position, grammar),
                                                  transitionDuration: Duration.zero,
                                                  reverseTransitionDuration: Duration.zero,
                                                ));
                                              },
                                              borderRadius: BorderRadius.circular(12),
                                              color: VipColors.onPrimary(context),
                                              child: ListTile(
                                                title: Text(
                                                    key: key,
                                                    grammar.name,
                                                    style: TextStyle(fontSize: textSize.medium)
                                                ),
                                                trailing: const Icon(Icons.keyboard_double_arrow_right),
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      );
                                    }

                                    return const Center(child: Text('Không có dữ liệu'));
                                  },
                                ),
                              )
                          ],
                        )
                    )
        );
      },
    );
  }
}

/// Màn hình chi tiết ----------------------------------------------------------
class _DetailGrammar extends StatefulWidget {
  final Offset offsetItem;
  final Grammar grammar;

  const _DetailGrammar(this.offsetItem, this.grammar);

  @override
  State<StatefulWidget> createState() => _DetailGrammarState();
}

class _DetailGrammarState extends State<_DetailGrammar> {
  bool isStart = true;
  bool isStarted = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        isStart = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WdgScaffold(
      appBar: const WdgAppBar(),
      body: Stack(
        fit: StackFit.loose,
      children: [
        /// Text ngữ pháp animation ------------------------------------------------------
        TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: textSize.medium, end: textSize.title * 1.2),
          duration: const Duration(milliseconds: 333),
          builder: (context, fontSize, child) {
            return AnimatedPositioned(
              top: isStart ? widget.offsetItem.dy : 0,
              left: isStart ? widget.offsetItem.dx : 0,
              duration: const Duration(milliseconds: 333),
              onEnd: () {
                setState(() {
                  isStarted = true;
                });
              },
              child: Container(
                  alignment: Alignment.topLeft,
                  width: maxWidth,
                  child: Text(
                  widget.grammar.name,
                  style: TextStyle(fontSize: fontSize),
              ))
            );
          },
        ),

        Column(
            children: [
            /// Text vị trí --------------------------------------------------
            Opacity(
                opacity: 0,
                child: Container(
                    alignment: Alignment.topLeft,
                    width: maxWidth,
                    child: Text(
                      widget.grammar.name,
                      style: TextStyle(fontSize: textSize.title * 1.2),
                    )
                )
            ),

            Expanded(
                child: AnimatedScale(
                  duration: const Duration(milliseconds: 333),
                  scale: isStarted ? 1 : 0,
                  child: Column(
                  children: [
                      /// Button luyện tập  --------------------------------------------
                      BlocProvider(
                        create: (context) => DataBloc<GrammaticalStructure>()..add(DataEventLoad<GrammaticalStructure>(args: widget.grammar.id)),
                        child: BlocBuilder<DataBloc<GrammaticalStructure>, DataState>(
                          builder: (context, state) {
                            if (state is DataStateLoaded<GrammaticalStructure>) {
                              if(state.data.isNotEmpty) {
                                return WdgButton(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            QuizzScreen.grammar(
                                                structures: state.data,
                                                grammar: widget.grammar),
                                      ),
                                    );
                                  },
                                  borderRadius: BorderRadius.circular(12),
                                  child: Text('Luyện tập',
                                      style: TextStyle(fontSize: textSize.medium)
                                  ),
                                );
                              }
                              return const SizedBox.shrink();
                            }
                            return const SizedBox.shrink();
                          },
                        ),
                      ),

                      /// Mô tả ngữ pháp  ----------------------------------------
                      Expanded(
                          child: Container(
                              padding: const EdgeInsets.all(6),
                              width: maxWidth,
                              child: WdgDashedBorder(
                                  child: SingleChildScrollView(
                                      child: Padding(
                                          padding: const EdgeInsets.all(6),
                                          child: WdgSpecialText(
                                              text: widget.grammar.description,
                                              size: textSize.medium
                                          )
                                      )
                                  )
                              )
                          )
                      )
                    ],
              ),
            ))
          ]),
        ]
      )
    );
  }
}
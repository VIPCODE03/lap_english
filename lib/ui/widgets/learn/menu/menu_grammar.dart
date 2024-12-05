import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_english/bloc/data_bloc/data_bloc.dart';
import 'package:lap_english/data/model/learn/grammar.dart';
import 'package:lap_english/main.dart';
import 'package:lap_english/ui/colors/vip_colors.dart';
import 'package:lap_english/ui/screens/learn_screens/quizz_screen.dart';
import 'package:lap_english/ui/widgets/other/app_bar.dart';
import 'package:lap_english/ui/widgets/other/button.dart';
import 'package:lap_english/ui/widgets/other/dashed_border.dart';
import 'package:lap_english/ui/widgets/other/scaffold.dart';
import 'package:lap_english/ui/widgets/other/special_text.dart';

class WdgMenuGrammar extends StatefulWidget {
  final List<TypeGrammar> typeGrammars;

  const WdgMenuGrammar({super.key, required this.typeGrammars});

  @override
  State<StatefulWidget> createState() => _WdgMenuGrammarState();
}

class _WdgMenuGrammarState extends State<WdgMenuGrammar> {
  late List<bool> status;

  @override
  void initState() {
    super.initState();
    status = List.generate(widget.typeGrammars.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.typeGrammars.length,
      itemBuilder: (BuildContext context, int index) {
        return BlocProvider(
            create: (context) => DataBloc<Grammar>()
              ..add(DataEventLoad<Grammar>(args: widget.typeGrammars[index].id)),
            child: Container(
                margin: const EdgeInsets.all(10),
                child: WdgDashedBorder(
                    color: VipColors.primary(context),
                    child: ExpansionTile(
                      title: Text(widget.typeGrammars[index].name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),
                      ),
                      trailing: AnimatedRotation(
                        duration: const Duration(milliseconds: 200),
                        turns: status[index] ? 0.25 : 0,
                        child: const Icon(Icons.keyboard_arrow_right_sharp),
                      ),
                      onExpansionChanged: (isExpanded) {
                        setState(() {
                          status[index] = isExpanded;
                        });
                        if (isExpanded) {
                          context.read<DataBloc<Grammar>>().add(
                              DataEventLoad<Grammar>(
                                  args: widget.typeGrammars[index].id));
                        }
                      },
                      children: [
                        BlocBuilder<DataBloc<Grammar>, DataState>(
                          builder: (context, grammarState) {
                            if (grammarState is DataStateLoading<Grammar>) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else if (grammarState
                                is DataStateLoaded<Grammar>) {
                              return Column(
                                children: grammarState.data.map((grammar) {
                                  final GlobalKey key = GlobalKey();
                                  return Padding(
                                      padding: const EdgeInsets.all(14),
                                      child: WdgButton(
                                          key: key,
                                          onTap: () {
                                            final RenderBox renderBox = key.currentContext!.findRenderObject() as RenderBox;
                                            final Offset position = renderBox.localToGlobal(Offset.zero);

                                            Navigator.of(context)
                                                .push(PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) =>
                                                  _DetailGrammar(position, grammar),
                                              transitionDuration: Duration.zero,
                                              reverseTransitionDuration:
                                                  Duration.zero,
                                            ));
                                          },
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: ListTile(
                                            title: Text(grammar.name),
                                            trailing: const Icon(Icons
                                                .keyboard_double_arrow_right),
                                          )));
                                }).toList(),
                              );
                            } else if (grammarState
                                is DataStateError<Grammar>) {
                              return Center(child: Text(grammarState.message));
                            }
                            return const SizedBox.shrink();
                          },
                        ),
                      ],
                    )
                )
            )
        );
      },
    );
  }
}

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
    Future.delayed(const Duration(milliseconds: 10), () {
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
      children: [
        TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 14, end: 24),
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
                alignment: Alignment.center,
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
              Opacity(opacity: 0,
                  child: Container(
                      alignment: Alignment.center,
                      width: maxWidth,
                      child: Text(
                        widget.grammar.name,
                        style: const TextStyle(fontSize: 24),
                      ))
              ),

              BlocProvider(
                create: (context) => DataBloc<GrammaticalStructure>()
                  ..add(DataEventLoad<GrammaticalStructure>(args: widget.grammar.id)),
                child: BlocBuilder<DataBloc<GrammaticalStructure>, DataState>(
                  builder: (context, state) {
                    if (state is DataStateLoaded<GrammaticalStructure>) {
                      return WdgButton(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => QuizzScreen.grammar(structures: state.data),
                            ),
                          );
                        },
                        child: const Text('Luyện tập', style: TextStyle(fontSize: 20)),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ),


              Expanded(
                child: AnimatedScale(
                    duration: const Duration(milliseconds: 333),
                    scale: isStarted ? 1 : 0,
                    child: Container(
                        padding: const EdgeInsets.all(6),
                        width: maxWidth,
                        child: WdgDashedBorder(
                            child: SingleChildScrollView(
                                child: Padding(
                                    padding: const EdgeInsets.all(6),
                                    child: WdgSpecialText(text: widget.grammar.description))
                            )
                        )
                    )
                ),
              )
            ],
          ),
      ])
    );
  }
}
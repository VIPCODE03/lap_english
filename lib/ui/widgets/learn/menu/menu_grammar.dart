import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_english/bloc/data_bloc/data_bloc.dart';
import 'package:lap_english/data/model/learn/grammar.dart';
import 'package:lap_english/ui/colors/vip_colors.dart';
import 'package:lap_english/ui/widgets/other/dashed_border.dart';

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
            title: Text(widget.typeGrammars[index].name),
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
                context.read<DataBloc<Grammar>>()
                    .add(DataEventLoad<Grammar>(args: widget.typeGrammars[index].id));
              }
            },
            children: [
              BlocBuilder<DataBloc<Grammar>, DataState>(
                builder: (context, grammarState) {
                  if (grammarState is DataStateLoading<Grammar>) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (grammarState is DataStateLoaded<Grammar>) {
                    return Column(
                      children: grammarState.data.map((grammar) {
                        return ListTile(
                          title: Text(grammar.name),
                          subtitle: Text(grammar.description),
                        );
                      }).toList(),
                    );
                  } else if (grammarState is DataStateError<Grammar>) {
                    return Center(child: Text(grammarState.message));
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          )))
        );
      },
    );
  }
}

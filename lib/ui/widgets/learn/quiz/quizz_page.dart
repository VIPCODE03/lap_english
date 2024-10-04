import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_english/ui/widgets/other/progress_bar.dart';

import '../../../../data/bloc/quizz_bloc.dart';

class QuizzPage extends StatelessWidget {
  final List<Widget> children;

  const QuizzPage({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocProvider(
        create: (context) => QuizzBloc(children.length)..add(QuizzInit()),
        child: BlocBuilder<QuizzBloc, QuizzState>(
          builder: (context, state) {
            if (state is QuizzInProgress) {
              return Column(
                children: [

                  Container(
                    padding: const EdgeInsets.all(10),
                    child: AnimatedProgressBar(value: state.progress, label: ''),
                  ),

                  const SizedBox(height: 16),
                  Expanded(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      transitionBuilder: (Widget child, Animation<double> animation) {
                        bool random = Random().nextBool();
                        var begin = random ? const Offset(-0.5, 1.5) : const Offset(1.0, 0.1);
                        const end = Offset.zero;
                        var tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: Curves.fastOutSlowIn));

                        return SlideTransition(
                          position: animation.drive(tween),
                          child: child,
                        );
                      },
                      child: children[state.currentIndex].key != ValueKey(state.currentIndex)
                          ? Container(
                          key: ValueKey(state.currentIndex),
                          child: children[state.currentIndex])
                          : children[state.currentIndex],
                    ),
                  ),

                  Container(
                    width: 150,
                    margin: const EdgeInsets.all(50),
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<QuizzBloc>().add(QuizzCheck());
                      },
                      child: const Text('Kiểm tra'),
                    ),
                  )
                ],
              );
            } else if (state is QuizzCompleted) {
              return const Center(child: Text('Quiz Completed!'));
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      )
    );
  }
}


import 'package:flutter/material.dart';
import 'package:lap_english/data/model/quizz_vocabulary.dart';
import 'package:lap_english/ui/widgets/learn/quiz/quizz_widget.dart';
import 'package:lap_english/ui/widgets/other/rich_text.dart';
import 'package:lap_english/utils/text_to_maptext.dart';

/*  Quizz trắc nghiệm 2-4 đáp án  */
class ChooseOneWord extends QuizzWidget<QuizzChooseOneWord> {
  ChooseOneWord({super.key, required super.quizz});

  @override
  QuizzWidgetState<QuizzChooseOneWord, QuizzWidget<QuizzChooseOneWord>> createState() => _ChooseOneWordWidgetState();
}

class _ChooseOneWordWidgetState extends QuizzWidgetState<QuizzChooseOneWord, ChooseOneWord> {
  String? selectedKey;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ///AdaptiveText câu hỏi ----------------------------------------------
          AdaptiveText(texts: parseStringToMap(widget.quizz.question)),
          const SizedBox(height: 20),

          ///Listview danh sách đáp án  ----------------------------------------
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: widget.quizz.answers.length,
              itemBuilder: (context, index) {
                var option = widget.quizz.answers.keys.elementAt(index);
                bool isCorrect = widget.quizz.answers[option] ?? false;
                if(isCorrect) widget.status.correctAnswer = option;
                bool isSelected = option == selectedKey;

                ///Button đáp án  -----------------------------------------------
                return AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.all(5),
                    height: 66,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: isSelected
                          ? Border.all(
                              color: Theme.of(context).primaryColor,
                              width: 1
                          )
                          : null,
                      boxShadow: isSelected
                          ? [
                        BoxShadow(
                          color: Theme.of(context).primaryColor,
                          offset: const Offset(0, 1),
                          blurRadius: 10,
                        )
                      ]
                          : null,
                    ),
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedKey = option;
                            widget.status.isAnswered.value = true;
                            widget.status.isCorrect = isCorrect;
                          });
                        },
                        child: Text(option, style: const TextStyle(fontSize: 20)),
                      ),

                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lap_english/data/model/quizz_vocabulary.dart';
import 'package:lap_english/ui/widgets/learn/quiz/quizz_widget.dart';
import 'package:lap_english/ui/widgets/other/rich_text.dart';

import '../../../../../utils/text_to_maptext.dart';

class QuizzWritingW extends QuizzWidget<QuizzWriteWord> {
  QuizzWritingW({super.key, required super.quizz});

  @override
  QuizzWidgetState<QuizzWriteWord, QuizzWidget<QuizzWriteWord>> createState()
  => _QuizzWritingState();
}

class _QuizzWritingState extends QuizzWidgetState<QuizzWriteWord, QuizzWritingW> {
  final TextEditingController _controller = TextEditingController();
  var _enabled = true;

  late List<String> userInput;

  @override
  void initState() {
    super.initState();
    userInput = List<String>.filled(widget.quizz.answer.length, '');
    widget.status.isChecked.addListener(() {
      setState(() {
        _enabled = false;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
          children: [
            ///AdaptiveText hiển thị câu hỏi  ----------------------------------
            AdaptiveText(texts: parseStringToMap(widget.quizz.question)),

            ///Ô nhập đáp án  --------------------------------------------
            const SizedBox(height: 50),
            Container(
              height: 200,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                child: Stack(
                  children: [
                    ///Row hàng text đáp án --------------------------------------
                    Container(
                      padding: const EdgeInsets.only(top: 50),
                      child: Row       (
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                        List.generate(widget.quizz.answer.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            child: Column(
                              children: [
                                Text(
                                  userInput[index].isNotEmpty
                                      ? userInput[index]
                                      : '_',
                                  style: TextStyle(
                                      color: userInput[index].isEmpty
                                          ? Theme.of(context).primaryColor
                                          : null,
                                      fontSize: 30
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),

                    ///TextField ẩn cho nhập ô chữ  ------------------------------
                    SizedBox(
                      height: 200,
                      child: Opacity(
                        opacity: 0,
                        child: TextField(
                          controller: _controller,
                          enabled: _enabled,
                          onChanged: (text) {
                            setState(() {
                              _updateUserInput(text);
                            });
                          },
                          maxLength: widget.quizz.answer.length,
                        ),
                      ),
                    )
                  ],
                ),
              ),
          )
        ],
      ),
    );
  }

  //=== set text đáp án ===
  void _updateUserInput(String text) {
    //--- Lấy độ dài  ---
    final length = text.length < userInput.length ? text.length : userInput.length;

    //--- Thêm chữ  ---
    for (int i = 0; i < length; i++) {
      userInput[i] = text[i];
    }

    //--- Xóa chữ ---
    for (int i = length; i < userInput.length; i++) {
      userInput[i] = '';
    }

    setStatus(text);
  }


  //=== set trạng thái  ===
  void setStatus(String answer) {
    if (answer.length < widget.quizz.answer.length) {
      widget.status.isAnswered.value = false;
    } else {
      widget.status.isAnswered.value = true;
      widget.status.isCorrect = answer.toLowerCase().trim() == widget.quizz.answer;
      widget.status.correctAnswer = widget.quizz.answer;
    }
  }
}

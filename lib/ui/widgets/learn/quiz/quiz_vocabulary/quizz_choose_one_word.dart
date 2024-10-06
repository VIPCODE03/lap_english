import 'package:flutter/material.dart';
import 'package:lap_english/data/model/quizz.dart';
import 'package:lap_english/data/model/quizz_vocabulary.dart';
import 'package:lap_english/ui/widgets/other/rich_text.dart';
import 'package:lap_english/utils/text_to_maptext.dart';

class QuizzVocabularys {
  ///CREATE widget quizz  --------------------------------------------------------
  static List<Widget> create(BuildContext context, List<Quizz> quizzesVocabulary) {
    List<Widget> quizzWidgets = [];
    for (var quizz in quizzesVocabulary) {
      if(quizz is QuizzChooseOneWord) {quizzWidgets.add(_ChooseOneWord(quizz: quizz));}
      else if(quizz is QuizzSoundOfWord) {quizzWidgets.add(_SoundOfWord(quizz: quizz));}
    }
    return quizzWidgets;
  }
}

/*  Quizz trắc nghiệm 2-4 đáp án  */
class _ChooseOneWord extends StatefulWidget {
  final QuizzChooseOneWord quizz;

  const _ChooseOneWord({required this.quizz});

  @override
  _ChooseOneWordWidgetState createState() => _ChooseOneWordWidgetState();
}

class _ChooseOneWordWidgetState extends State<_ChooseOneWord> {
  int indexCorrect = -1;
  int? indexChoose;
  bool choose = false;

  @override
  void initState() {
    super.initState();
    //--- Tìm vị trí của đáp án đúng  ---
    for (var i = 0; i < widget.quizz.answers.length; i++) {
      if (widget.quizz.answers.values.elementAt(i)) {
        indexCorrect = i;
        break;
      }
    }
  }

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

                Color? buttonColor;
                if (indexChoose != null) {
                  if (index == indexCorrect) {
                    buttonColor = Colors.green; //->  Nút đúng sẽ chuyển màu xanh
                  } else if (index == indexChoose && !isCorrect) {
                    buttonColor = Colors.red; //->  Nút sai chuyển màu đỏ
                  }
                }

                ///Button đáp án  -----------------------------------------------
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  height: 70,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                    ),
                    onPressed: () {
                      setState(() {
                        indexChoose = index;
                        choose = true;
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

/*  Quizz chọn âm thanh */
class _SoundOfWord extends StatefulWidget {
  final QuizzSoundOfWord quizz;

  const _SoundOfWord({required this.quizz});

  @override
  State<StatefulWidget> createState() => _SoundState();
}

class _SoundState extends State<_SoundOfWord> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AdaptiveText(texts: TextToMapText.parseStringToMap(widget.quizz.question)),
        const SizedBox(height: 20),
        SizedBox(
            child: widget.quizz.isHidden
                ? null
                : Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: const Icon(Icons.volume_up),
                  )
        ),
        const SizedBox(height: 20),

        Expanded(child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            children: widget.quizz.answers.keys.map((key) {
              return Container(
                margin: const EdgeInsets.all(10),
                height: 70,
                width: 70,
                child: Card(
                  child: widget.quizz.isHidden
                      ? const Center(child: Icon(Icons.volume_up))
                      : Center(child: Text(key))
                  ,
                )
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

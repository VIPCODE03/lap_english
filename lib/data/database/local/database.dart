
import 'package:lap_english/data/database/local/table/grammar_table.dart';
import 'package:lap_english/data/database/local/table/sentence_table.dart';
import 'package:lap_english/data/database/local/table/user_table.dart';
import 'package:lap_english/data/database/local/table/vocabulary_table.dart';

import '../../../a_librarys/vip_sqflite/database_vip.dart';

///===  Hàm khởi tạo database    ===
DatabaseApp initdatabase() {
  return DatabaseApp(
      name: 'data',
      version: 1,
      tableSchemas: [
        //--- User  ---
        UserTable(),

        //--- Từ vựng ---
        WordTable(),
        SubVocabularyTopicTable(),
        MainVocabularyTopicTable(),

        //--- Câu ---
        SentenceTable(),
        SubSentenceTopicTable(),
        MainSentenceTopicTable(),

        //--- Ngữ pháp  ---
        TypeGrammarTable(),
        GrammarTable(),
        GrammaticalStructureTable(),
        ExerciseGrammarTable()
      ]
  );
}

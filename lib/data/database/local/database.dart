
import 'package:lap_english/data/database/local/table/grammar_table.dart';
import 'package:lap_english/data/database/local/table/w_s_table.dart';
import 'package:lap_english/data/database/local/table/user_table.dart';

import '../../../a_librarys/vip_sqflite/database_vip.dart';

///===  Hàm khởi tạo database    ===
DatabaseApp initdatabase() {
  return DatabaseApp(
      name: 'data',
      version: 1,
      tableSchemas: [
        //--- User  ---
        UserTable(),

        MainTopicTable(),
        SubTopicTable(),
        WordTable(),
        SentenceTable(),

        //--- Ngữ pháp  ---
        TypeGrammarTable(),
        GrammarTable(),
        GrammaticalStructureTable(),
        ExerciseGrammarTable()
      ]
  );
}

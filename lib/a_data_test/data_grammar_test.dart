import '../data/model/learn/grammar.dart';
import '../data/model/quizz/quizz.dart';

List<TypeGrammar> generateGrammarTypes() {
  return [
    TypeGrammar(1, 'Các thì (Tenses)'),
    TypeGrammar(2, 'Câu điều kiện (Conditionals)'),
    TypeGrammar(3, 'Câu bị động (Passive Voice)'),
    TypeGrammar(4, 'Câu gián tiếp (Indirect Speech)'),
    TypeGrammar(5, 'Câu trực tiếp (Direct Speech)'),
    TypeGrammar(6, 'Các dạng câu hỏi (Questions)'),
    TypeGrammar(7, 'Các dạng câu khẳng định và phủ định (Affirmative and Negative Sentences)'),
    TypeGrammar(8, 'Câu mệnh lệnh (Imperative Sentences)'),
    TypeGrammar(9, 'Câu so sánh (Comparative and Superlative Sentences)'),
    TypeGrammar(10, 'Các cấu trúc ngữ pháp nâng cao (Advanced Grammar Structures)'),
  ];
}


List<Grammar> generateGrammars() {
  return [
    // Các thì (Tenses)
    Grammar(1,
        'Thì hiện tại đơn (Present Simple)',
        '''
  **Mô tả sơ lược**:  
  Thì <hiện tại đơn> là thì cơ bản nhất trong tiếng Anh, được sử dụng để diễn tả những <sự kiện mang tính quy luật>, <thói quen hàng ngày>, hoặc <sự thật hiển nhiên>.  

  Cách dùng 
  -----------------------------------  
  - <Diễn tả sự thật hiển nhiên>:  
    Ví dụ: The sun <rises> in the east.  
  - <Thói quen hoặc hành động lặp lại thường xuyên>:  
    Ví dụ: She <drinks> coffee every morning.  
  - <Lịch trình, thời gian biểu>:  
    Ví dụ: The train <leaves> at 8 a.m.  

  Cấu trúc
  -----------------------------------  
  - <Khẳng định>:  
    S + V(s/es) + O  
    Ví dụ: He <plays> football.  
  - <Phủ định>:  
    S + do/does + not + V-inf  
    Ví dụ: She <does not> like tea.  
  - <Nghi vấn>:  
    Do/Does + S + V-inf?  
    Ví dụ: <Does> he work here?  

  Dấu hiệu nhận biết
  -----------------------------------  
  - Các trạng từ chỉ tần suất: <always>, <often>, <usually>, <sometimes>, <rarely>, <never>.  
  - Các cụm từ chỉ thời gian: <every day>, <once a week>, <on Mondays>, <in the morning>.  

  Lưu ý 
  -----------------------------------  
  - Khi chủ ngữ là ngôi thứ ba số ít (he, she, it), động từ thêm <s> hoặc <es>.  
  - Không sử dụng động từ "to be" và trợ động từ cùng lúc trong câu khẳng định.  

  Ví dụ bổ sung 
  -----------------------------------  
  - They <work> in an office.  
  - She <does not go> to school on Sundays.  
  - <Do> you <like> ice cream?  
  ''',
        1
    ),
    Grammar(2, 'Thì hiện tại tiếp diễn (Present Continuous)', 'Diễn tả hành động đang xảy ra tại thời điểm nói hoặc tương lai gần.', 1),
    Grammar(3, 'Thì quá khứ đơn (Past Simple)', 'Diễn tả hành động đã xảy ra và kết thúc trong quá khứ.', 1),
    Grammar(4, 'Thì quá khứ tiếp diễn (Past Continuous)', 'Diễn tả hành động đang xảy ra tại một thời điểm xác định trong quá khứ.', 1),
    Grammar(5, 'Thì tương lai đơn (Future Simple)', 'Diễn tả hành động sẽ xảy ra trong tương lai.', 1),

    // Câu điều kiện (Conditionals)
    Grammar(6, 'Câu điều kiện loại 0 (Zero Conditional)', 'Diễn tả sự thật hiển nhiên hoặc quy luật tự nhiên.', 2),
    Grammar(7, 'Câu điều kiện loại 1 (First Conditional)', 'Diễn tả khả năng xảy ra trong tương lai.', 2),
    Grammar(8, 'Câu điều kiện loại 2 (Second Conditional)', 'Diễn tả điều kiện không có thật hoặc ít khả năng xảy ra ở hiện tại hoặc tương lai.', 2),
    Grammar(9, 'Câu điều kiện loại 3 (Third Conditional)', 'Diễn tả điều kiện không có thật trong quá khứ.', 2),
    Grammar(10, 'Câu điều kiện hỗn hợp (Mixed Conditional)', 'Kết hợp điều kiện loại 2 và 3 để diễn tả các tình huống không có thật trong quá khứ và hiện tại.', 2),

    // Câu bị động (Passive Voice)
    Grammar(11, 'Câu bị động trong thì hiện tại đơn', 'Diễn tả hành động trong câu bị động ở thì hiện tại đơn.', 3),
    Grammar(12, 'Câu bị động trong thì quá khứ đơn', 'Diễn tả hành động trong câu bị động ở thì quá khứ đơn.', 3),
    Grammar(13, 'Câu bị động trong thì hiện tại hoàn thành', 'Diễn tả hành động trong câu bị động ở thì hiện tại hoàn thành.', 3),

    // Câu gián tiếp (Indirect Speech)
    Grammar(14, 'Câu gián tiếp dạng khẳng định', 'Chuyển lời nói khẳng định thành câu gián tiếp.', 4),
    Grammar(15, 'Câu gián tiếp dạng câu hỏi', 'Chuyển câu hỏi thành câu gián tiếp.', 4),
    Grammar(16, 'Câu gián tiếp dạng mệnh lệnh', 'Chuyển câu mệnh lệnh thành câu gián tiếp.', 4),

    // Câu trực tiếp (Direct Speech)
    Grammar(17, 'Câu trực tiếp dạng khẳng định', 'Câu nói trực tiếp dạng khẳng định.', 5),
    Grammar(18, 'Câu trực tiếp dạng câu hỏi', 'Câu nói trực tiếp dạng câu hỏi.', 5),
    Grammar(19, 'Câu trực tiếp dạng mệnh lệnh', 'Câu nói trực tiếp dạng mệnh lệnh.', 5),

    // Các dạng câu hỏi (Questions)
    Grammar(20, 'Câu hỏi Yes/No', 'Câu hỏi yêu cầu trả lời “Yes” hoặc “No”.', 6),
    Grammar(21, 'Câu hỏi Wh- (who, what, when, etc.)', 'Câu hỏi sử dụng từ hỏi (Wh-questions).', 6),

    // Câu mệnh lệnh (Imperative Sentences)
    Grammar(22, 'Câu mệnh lệnh khẳng định', 'Câu mệnh lệnh yêu cầu hoặc chỉ thị hành động.', 7),
    Grammar(23, 'Câu mệnh lệnh phủ định', 'Câu mệnh lệnh yêu cầu không làm hành động gì đó.', 7),

    // Câu so sánh (Comparative and Superlative Sentences)
    Grammar(24, 'Câu so sánh hơn (Comparative)', 'So sánh sự khác biệt giữa hai đối tượng.', 8),
    Grammar(25, 'Câu so sánh nhất (Superlative)', 'So sánh một đối tượng với tất cả những đối tượng còn lại.', 8),
  ];
}

List<GrammaticalStructure> generateGrammaticalStructures() {
  return [
    // Các cấu trúc của "Thì hiện tại đơn"
    GrammaticalStructure(1, 'Khẳng định \n Dùng để diễn tả thói quen, sự thật hiển nhiên, hoặc hành động lặp lại.', '<S> + <V> (hiện tại đơn)', 1),
    GrammaticalStructure(2, 'Phủ định \n Dùng để phủ định hành động trong hiện tại, thói quen hoặc sự thật.', '<S> + <do/does> + <not> + <V> (nguyên thể)', 1),
    GrammaticalStructure(3, 'Câu hỏi Yes/No \n Dùng để hỏi về hành động có thật hoặc thói quen trong hiện tại.', 'Do/Does + S + V (nguyên thể)?', 1),
    GrammaticalStructure(4, 'Câu hỏi Wh- \n Dùng để hỏi thông tin chi tiết về hành động trong hiện tại.', 'Wh- + do/does + S + V (nguyên thể)?', 1),

    // Các cấu trúc của "Thì hiện tại tiếp diễn"
    GrammaticalStructure(5, 'Khẳng định \n Dùng để diễn tả hành động đang xảy ra ở hiện tại hoặc xu hướng đang diễn ra.', 'S + am/are/is + V-ing', 2),
    GrammaticalStructure(6, 'Phủ định \n Dùng để phủ định hành động đang xảy ra ở hiện tại.', 'S + am/are/is + not + V-ing', 2),
    GrammaticalStructure(7, 'Câu hỏi Yes/No \n Dùng để hỏi về hành động đang diễn ra tại thời điểm nói.', 'Am/Are/Is + S + V-ing?', 2),
    GrammaticalStructure(8, 'Câu hỏi Wh- \n Dùng để hỏi chi tiết về hành động đang diễn ra trong hiện tại.', 'Wh- + am/are/is + S + V-ing?', 2),

    // Các cấu trúc của "Thì quá khứ đơn"
    GrammaticalStructure(9, 'Khẳng định \n Dùng để diễn tả hành động đã xảy ra và kết thúc trong quá khứ.', 'S + V (quá khứ đơn)', 3),
    GrammaticalStructure(10, 'Phủ định \n Dùng để phủ định hành động đã xảy ra trong quá khứ.', 'S + did + not + V (nguyên thể)', 3),
    GrammaticalStructure(11, 'Câu hỏi Yes/No \n Dùng để hỏi về hành động đã xảy ra trong quá khứ.', 'Did + S + V (nguyên thể)?', 3),
    GrammaticalStructure(12, 'Câu hỏi Wh- \n Dùng để hỏi thông tin chi tiết về hành động đã xảy ra trong quá khứ.', 'Wh- + did + S + V (nguyên thể)?', 3),

    // Các cấu trúc của "Thì quá khứ tiếp diễn"
    GrammaticalStructure(13, 'Khẳng định \n Dùng để diễn tả hành động đang xảy ra tại một thời điểm trong quá khứ.', 'S + was/were + V-ing', 4),
    GrammaticalStructure(14, 'Phủ định \n Dùng để phủ định hành động đang xảy ra tại một thời điểm trong quá khứ.', 'S + was/were + not + V-ing', 4),
    GrammaticalStructure(15, 'Câu hỏi Yes/No \n Dùng để hỏi về hành động đang diễn ra trong quá khứ.', 'Was/Were + S + V-ing?', 4),
    GrammaticalStructure(16, 'Câu hỏi Wh- \n Dùng để hỏi chi tiết về hành động đang diễn ra trong quá khứ.', 'Wh- + was/were + S + V-ing?', 4),

    // Các cấu trúc của "Câu điều kiện loại 1"
    GrammaticalStructure(17, 'Khẳng định \n Dùng để diễn tả điều kiện có thể xảy ra trong tương lai, nếu điều kiện hiện tại được thỏa mãn.', 'If + S + V (hiện tại đơn), S + will + V (nguyên thể)', 5),
    GrammaticalStructure(18, 'Phủ định \n Dùng để phủ định điều kiện trong câu điều kiện loại 1.', 'If + S + V (hiện tại đơn), S + will not + V (nguyên thể)', 5),
    GrammaticalStructure(19, 'Câu hỏi Yes/No \n Dùng để hỏi về điều kiện có thể xảy ra trong tương lai.', 'If + S + V (hiện tại đơn), Will + S + V (nguyên thể)?', 5),
    GrammaticalStructure(20, 'Câu hỏi Wh- \n Dùng để hỏi chi tiết về điều kiện và kết quả trong câu điều kiện loại 1.', 'If + S + V (hiện tại đơn), Wh- + will + S + V (nguyên thể)?', 5),

    // Các cấu trúc của "Câu điều kiện loại 2"
    GrammaticalStructure(21, 'Khẳng định \n Dùng để diễn tả điều kiện không có thật trong hiện tại hoặc tương lai.', 'If + S + V (quá khứ đơn), S + would + V (nguyên thể)', 6),
    GrammaticalStructure(22, 'Phủ định \n Dùng để phủ định điều kiện không có thật trong hiện tại hoặc tương lai.', 'If + S + V (quá khứ đơn), S + would not + V (nguyên thể)', 6),
    GrammaticalStructure(23, 'Câu hỏi Yes/No \n Dùng để hỏi về điều kiện không có thật trong hiện tại hoặc tương lai.', 'If + S + V (quá khứ đơn), Would + S + V (nguyên thể)?', 6),
    GrammaticalStructure(24, 'Câu hỏi Wh- \n Dùng để hỏi chi tiết về điều kiện không có thật trong hiện tại hoặc tương lai.', 'If + S + V (quá khứ đơn), Wh- + would + S + V (nguyên thể)?', 6),

    // Các cấu trúc của "Câu bị động"
    GrammaticalStructure(25, 'Khẳng định \n Dùng để diễn tả hành động được thực hiện bởi một tác nhân không xác định.', 'S + am/are/is + V3 (quá khứ phân từ)', 7),
    GrammaticalStructure(26, 'Phủ định \n Dùng để phủ định hành động bị động trong hiện tại.', 'S + am/are/is + not + V3 (quá khứ phân từ)', 7),
    GrammaticalStructure(27, 'Câu hỏi Yes/No \n Dùng để hỏi về hành động bị động trong hiện tại.', 'Am/Are/Is + S + V3 (quá khứ phân từ)?', 7),
    GrammaticalStructure(28, 'Câu hỏi Wh- \n Dùng để hỏi chi tiết về hành động bị động trong hiện tại.', 'Wh- + am/are/is + S + V3 (quá khứ phân từ)?', 7),
  ];
}

List<ExerciseGrammar> generateExerciseGrammarForPresentSimple() {
  return [
    // Khẳng định: Chọn từ đúng
    ExerciseGrammar(
      1, // ID của cấu trúc "Khẳng định"
      CustomQuiz(
        "Chọn từ đúng: <I / eat / eats> breakfast every day.",
        ["eat", "eats"],
        "eat",
        {"eat": true, "eats": false},
        TypeQuiz.chooseOne,
      ),
    ),

    ExerciseGrammar(
      1, // ID của cấu trúc "Khẳng định"
      CustomQuiz(
        "Chọn từ đúng: <I / eat / eats> breakfast every day.",
        ["eat", "eats"],
        "eat",
        {"eat": true, "eats": false},
        TypeQuiz.chooseOne,
      ),
    ),

    // Khẳng định: Chọn từ đúng
    ExerciseGrammar(
      1, // ID của cấu trúc "Khẳng định"
      CustomQuiz(
        "Chọn từ đúng: <She / play / plays> tennis on weekends.",
        ["play", "plays"],
        "plays",
        {"play": false, "plays": true},
        TypeQuiz.chooseOne,
      ),
    ),

    // Khẳng định: Hoàn thành câu
    ExerciseGrammar(
      1, // ID của cấu trúc "Khẳng định"
      CustomQuiz(
        "Hoàn thành câu: <He / study / studies> English every day.",
        ["He", "study", "studies", "English", "every", "day", "English", "every", "day", "English", "every"],
        "He studies English every day.",
        {"He": true, "studies": true, "English": true, "every": true, "day": true},
        TypeQuiz.select,
      ),
    ),

    // Khẳng định: Chọn từ đúng
    ExerciseGrammar(
      1, // ID của cấu trúc "Khẳng định"
      CustomQuiz(
        "Chọn từ đúng: <We / go / goes> to the gym in the evening.",
        ["go", "goes"],
        "go",
        {"go": true, "goes": false},
        TypeQuiz.chooseOne,
      ),
    ),

    // Khẳng định: Hoàn thành câu
    ExerciseGrammar(
      1, // ID của cấu trúc "Khẳng định"
      CustomQuiz(
        "Hoàn thành câu: <They / not / like> spicy food.",
        ["They", "do", "not", "like", "spicy", "food"],
        "They do not like spicy food.",
        {"They": true, "do": true, "not": true, "like": true, "spicy": true, "food": true},
        TypeQuiz.select,
      ),
    ),

    // Khẳng định: Chọn từ đúng
    ExerciseGrammar(
      1, // ID của cấu trúc "Khẳng định"
      CustomQuiz(
        "Chọn từ đúng: <John / work / works> at a software company.",
        ["work", "works"],
        "works",
        {"work": false, "works": true},
        TypeQuiz.chooseOne,
      ),
    ),

    // Phủ định: Hoàn thành câu
    ExerciseGrammar(
      2, // ID của cấu trúc "Phủ định"
      CustomQuiz(
        "Hoàn thành câu: <I / not / like> coffee.",
        ["I", "do", "not", "like", "coffee"],
        "I do not like coffee.",
        {"I": true, "do": true, "not": true, "like": true, "coffee": true},
        TypeQuiz.select,
      ),
    ),

    // Câu hỏi Yes/No: Chọn từ đúng
    ExerciseGrammar(
      3, // ID của cấu trúc "Câu hỏi Yes/No"
      CustomQuiz(
        "Chọn từ đúng: <Do / Does> she play tennis?",
        ["Do", "Does"],
        "Does",
        {"Do": false, "Does": true},
        TypeQuiz.chooseOne,
      ),
    ),

    // Câu hỏi Wh-: Hoàn thành câu
    ExerciseGrammar(
      4, // ID của cấu trúc "Câu hỏi Wh-"
      CustomQuiz(
        "Hoàn thành câu: <Where / do / you / live>?",
        ["Where", "do", "you", "live"],
        "Where do you live?",
        {"Where": true, "do": true, "you": true, "live": true},
        TypeQuiz.select,
      ),
    ),

    // Khẳng định: Hoàn thành câu
    ExerciseGrammar(
      5, // ID của cấu trúc "Khẳng định"
      CustomQuiz(
        "Hoàn thành câu: <She / work / at a bank>.",
        ["She", "works", "at", "a", "bank"],
        "She works at a bank.",
        {"She": true, "works": true, "at": true, "a": true, "bank": true},
        TypeQuiz.select,
      ),
    ),

    // Phủ định: Chọn từ đúng
    ExerciseGrammar(
      6, // ID của cấu trúc "Phủ định"
      CustomQuiz(
        "Chọn từ đúng: <I / not / drink / tea> in the morning.",
        ["do", "not", "drink", "tea"],
        "I do not drink tea in the morning.",
        {"do": true, "not": true, "drink": true, "tea": true},
        TypeQuiz.select,
      ),
    ),

    // Câu hỏi Yes/No: Hoàn thành câu
    ExerciseGrammar(
      7, // ID của cấu trúc "Câu hỏi Yes/No"
      CustomQuiz(
        "Hoàn thành câu: <Do / you / like / this song>?",
        ["Do", "you", "like", "this", "song"],
        "Do you like this song?",
        {"Do": true, "you": true, "like": true, "this": true, "song": true},
        TypeQuiz.select,
      ),
    ),

    // Câu hỏi Wh-: Chọn từ đúng
    ExerciseGrammar(
      8, // ID của cấu trúc "Câu hỏi Wh-"
      CustomQuiz(
        "Chọn từ đúng: <Where / do / you / go> on weekends?",
        ["Where", "do", "you", "go"],
        "Where do you go",
        {"Where": true, "do": true, "you": true, "go": true},
        TypeQuiz.chooseOne,
      ),
    ),
  ];
}



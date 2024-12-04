import '../data/model/learn/grammar.dart';

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
    Grammar(1, 'Thì hiện tại đơn (Present Simple)', 'Diễn tả sự thật hiển nhiên, thói quen, sự việc xảy ra thường xuyên.', 1),
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
    GrammaticalStructure(1, 'Khẳng định', 'S + V (hiện tại đơn)', 1),
    GrammaticalStructure(2, 'Phủ định', 'S + do/does + not + V (nguyên thể)', 1),
    GrammaticalStructure(3, 'Câu hỏi Yes/No', 'Do/Does + S + V (nguyên thể)?', 1),
    GrammaticalStructure(4, 'Câu hỏi Wh-', 'Wh- + do/does + S + V (nguyên thể)?', 1),

    // Các cấu trúc của "Thì hiện tại tiếp diễn"
    GrammaticalStructure(5, 'Khẳng định', 'S + am/are/is + V-ing', 2),
    GrammaticalStructure(6, 'Phủ định', 'S + am/are/is + not + V-ing', 2),
    GrammaticalStructure(7, 'Câu hỏi Yes/No', 'Am/Are/Is + S + V-ing?', 2),
    GrammaticalStructure(8, 'Câu hỏi Wh-', 'Wh- + am/are/is + S + V-ing?', 2),

    // Các cấu trúc của "Thì quá khứ đơn"
    GrammaticalStructure(9, 'Khẳng định', 'S + V (quá khứ đơn)', 3),
    GrammaticalStructure(10, 'Phủ định', 'S + did + not + V (nguyên thể)', 3),
    GrammaticalStructure(11, 'Câu hỏi Yes/No', 'Did + S + V (nguyên thể)?', 3),
    GrammaticalStructure(12, 'Câu hỏi Wh-', 'Wh- + did + S + V (nguyên thể)?', 3),

    // Các cấu trúc của "Thì quá khứ tiếp diễn"
    GrammaticalStructure(13, 'Khẳng định', 'S + was/were + V-ing', 4),
    GrammaticalStructure(14, 'Phủ định', 'S + was/were + not + V-ing', 4),
    GrammaticalStructure(15, 'Câu hỏi Yes/No', 'Was/Were + S + V-ing?', 4),
    GrammaticalStructure(16, 'Câu hỏi Wh-', 'Wh- + was/were + S + V-ing?', 4),

    // Các cấu trúc của "Câu điều kiện loại 1"
    GrammaticalStructure(17, 'Khẳng định', 'If + S + V (hiện tại đơn), S + will + V (nguyên thể)', 5),
    GrammaticalStructure(18, 'Phủ định', 'If + S + V (hiện tại đơn), S + will not + V (nguyên thể)', 5),
    GrammaticalStructure(19, 'Câu hỏi Yes/No', 'If + S + V (hiện tại đơn), Will + S + V (nguyên thể)?', 5),
    GrammaticalStructure(20, 'Câu hỏi Wh-', 'If + S + V (hiện tại đơn), Wh- + will + S + V (nguyên thể)?', 5),

    // Các cấu trúc của "Câu điều kiện loại 2"
    GrammaticalStructure(21, 'Khẳng định', 'If + S + V (quá khứ đơn), S + would + V (nguyên thể)', 6),
    GrammaticalStructure(22, 'Phủ định', 'If + S + V (quá khứ đơn), S + would not + V (nguyên thể)', 6),
    GrammaticalStructure(23, 'Câu hỏi Yes/No', 'If + S + V (quá khứ đơn), Would + S + V (nguyên thể)?', 6),
    GrammaticalStructure(24, 'Câu hỏi Wh-', 'If + S + V (quá khứ đơn), Wh- + would + S + V (nguyên thể)?', 6),

    // Các cấu trúc của "Câu bị động"
    GrammaticalStructure(25, 'Khẳng định', 'S + am/are/is + V3 (quá khứ phân từ)', 7),
    GrammaticalStructure(26, 'Phủ định', 'S + am/are/is + not + V3 (quá khứ phân từ)', 7),
    GrammaticalStructure(27, 'Câu hỏi Yes/No', 'Am/Are/Is + S + V3 (quá khứ phân từ)?', 7),
    GrammaticalStructure(28, 'Câu hỏi Wh-', 'Wh- + am/are/is + S + V3 (quá khứ phân từ)?', 7),
  ];
}


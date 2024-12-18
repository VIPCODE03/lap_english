import 'dart:convert';
import 'package:lap_english/data/model/learn/status.dart';
import 'package:lap_english/data/model/learn/word_sentence.dart';

List<MainTopic> generateMainSentenceTopics() {
  return [
    MainTopic(1, 'Chủ đề chính 1', MdlUnlockStatusManager(diamond: 50, gold: 200, locked: false)),
    MainTopic(1, 'Chủ đề chính 2', MdlUnlockStatusManager(diamond: 50, gold: 200, locked: false)),
    MainTopic(1, 'Chủ đề chính 3', MdlUnlockStatusManager(diamond: 50, gold: 200, locked: false)),
  ];
}

List<SubTopic> generateSubSentenceTopics() {
  return [
    SubTopic(101, 'Gọi món ăn', 'https://example.com/image1.jpg', 1, MdlUnlockStatusManager(diamond: 0, gold: 50, locked: true), isLearned: false),
    SubTopic(102, 'Các món ăn', 'https://example.com/image2.jpg', 1, MdlUnlockStatusManager(diamond: 0, gold: 50, locked: true), isLearned: false),
    SubTopic(103, 'Phương tiện đường bộ', 'https://example.com/image3.jpg', 2, MdlUnlockStatusManager(diamond: 5, gold: 50, locked: true), isLearned: false),
    SubTopic(104, 'Phương tiện đường thủy', 'https://example.com/image3.jpg', 2, MdlUnlockStatusManager(diamond: 5, gold: 50, locked: true), isLearned: false),
    SubTopic(105, 'Chạy', 'https://example.com/image3.jpg', 2, MdlUnlockStatusManager(diamond: 5, gold: 50, locked: true), isLearned: false),
    SubTopic(106, 'Phương tiện đường bộ', 'https://example.com/image3.jpg', 2, MdlUnlockStatusManager(diamond: 5, gold: 50, locked: true), isLearned: false),
    SubTopic(107, 'Phương tiện đường bộ', 'https://example.com/image3.jpg', 2, MdlUnlockStatusManager(diamond: 5, gold: 50, locked: true), isLearned: false),
    SubTopic(108, 'Phương tiện đường bộ', 'https://example.com/image3.jpg', 2, MdlUnlockStatusManager(diamond: 5, gold: 50, locked: true), isLearned: false),
    SubTopic(109, 'Phương tiện đường bộ', 'https://example.com/image3.jpg', 2, MdlUnlockStatusManager(diamond: 5, gold: 50, locked: true), isLearned: false),
  ];
}

List<Sentence> generateSentences() {
  return [
    // Câu cho chủ đề 'Gọi món ăn'
    Sentence(201, 'Can I see the menu, please?', 'Tôi có thể xem thực đơn được không?', 101),
    Sentence(202, 'I would like to order a steak.', 'Tôi muốn gọi một phần bít tết.', 101),
    Sentence(203, 'Do you have any vegetarian dishes?', 'Quán có món chay nào không?', 101),
    Sentence(204, 'Could I have some water, please?', 'Tôi có thể xin nước không?', 101),
    Sentence(205, 'How spicy is this dish?', 'Món này cay cỡ nào?', 101),

    // Câu cho chủ đề 'Các món ăn'
    Sentence(206, 'This soup is very delicious.', 'Món súp này rất ngon.', 102),
    Sentence(207, 'The pizza is topped with cheese and mushrooms.', 'Chiếc pizza này được phủ phô mai và nấm.', 102),
    Sentence(208, 'I like eating sushi.', 'Tôi thích ăn sushi.', 102),
    Sentence(209, 'The salad has fresh vegetables.', 'Món salad này có rau tươi.', 102),
    Sentence(210, 'Desserts are served after the main course.', 'Món tráng miệng được phục vụ sau món chính.', 102),

    // Câu cho chủ đề 'Phương tiện đường bộ'
    Sentence(211, 'I am going to travel by bus.', 'Tôi sẽ đi bằng xe buýt.', 103),
    Sentence(212, 'Do you have a bicycle?', 'Bạn có xe đạp không?', 103),
    Sentence(213, 'The car is parked outside.', 'Xe ô tô đang đậu bên ngoài.', 103),
    Sentence(214, 'Motorcycles can be fast.', 'Xe máy có thể rất nhanh.', 103),
    Sentence(215, 'Walking is good exercise.', 'Đi bộ là bài tập tốt.', 103),
    Sentence(216, 'I need to catch the next train.', 'Tôi cần bắt chuyến tàu tiếp theo.', 103),
  ];
}

void main() {
  // Chuyển đối tượng thành chuỗi JSON
  String jsonString = jsonEncode(generateSubSentenceTopics().first.toJson());

  // In chuỗi JSON ra màn hình
  print(jsonString);
}
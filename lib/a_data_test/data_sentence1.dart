import 'dart:convert';

import 'package:lap_english/data/model/learn/status.dart';

import '../data/model/learn/sentence.dart';

List<MdlMainSentenceTopic> generateMainSentenceTopics() {
  return [
    MdlMainSentenceTopic(1, 'Chủ đề chính 1', MdlUnlockStatusManager(diamond: 50, gold: 200, locked: false)),
    MdlMainSentenceTopic(1, 'Chủ đề chính 2', MdlUnlockStatusManager(diamond: 50, gold: 200, locked: false)),
    MdlMainSentenceTopic(1, 'Chủ đề chính 3', MdlUnlockStatusManager(diamond: 50, gold: 200, locked: false)),
  ];
}

List<MdlSubSentenceTopic> generateSubSentenceTopics() {
  return [
    MdlSubSentenceTopic(101, 'Gọi món ăn', 'https://example.com/image1.jpg', 1, MdlUnlockStatusManager(diamond: 0, gold: 50, locked: true), isLearned: false),
    MdlSubSentenceTopic(102, 'Các món ăn', 'https://example.com/image2.jpg', 1, MdlUnlockStatusManager(diamond: 0, gold: 50, locked: true), isLearned: false),
    MdlSubSentenceTopic(103, 'Phương tiện đường bộ', 'https://example.com/image3.jpg', 2, MdlUnlockStatusManager(diamond: 5, gold: 50, locked: true), isLearned: false),
    MdlSubSentenceTopic(104, 'Phương tiện đường thủy', 'https://example.com/image3.jpg', 2, MdlUnlockStatusManager(diamond: 5, gold: 50, locked: true), isLearned: false),
    MdlSubSentenceTopic(105, 'Chạy', 'https://example.com/image3.jpg', 2, MdlUnlockStatusManager(diamond: 5, gold: 50, locked: true), isLearned: false),
    MdlSubSentenceTopic(106, 'Phương tiện đường bộ', 'https://example.com/image3.jpg', 2, MdlUnlockStatusManager(diamond: 5, gold: 50, locked: true), isLearned: false),
    MdlSubSentenceTopic(107, 'Phương tiện đường bộ', 'https://example.com/image3.jpg', 2, MdlUnlockStatusManager(diamond: 5, gold: 50, locked: true), isLearned: false),
    MdlSubSentenceTopic(108, 'Phương tiện đường bộ', 'https://example.com/image3.jpg', 2, MdlUnlockStatusManager(diamond: 5, gold: 50, locked: true), isLearned: false),
    MdlSubSentenceTopic(109, 'Phương tiện đường bộ', 'https://example.com/image3.jpg', 2, MdlUnlockStatusManager(diamond: 5, gold: 50, locked: true), isLearned: false),
  ];
}

List<MdlSentence> generateSentences() {
  return [
    // Câu cho chủ đề 'Gọi món ăn'
    MdlSentence(201, 'Can I see the menu, please?', 'Tôi có thể xem thực đơn được không?', 101),
    MdlSentence(202, 'I would like to order a steak.', 'Tôi muốn gọi một phần bít tết.', 101),
    MdlSentence(203, 'Do you have any vegetarian dishes?', 'Quán có món chay nào không?', 101),
    MdlSentence(204, 'Could I have some water, please?', 'Tôi có thể xin nước không?', 101),
    MdlSentence(205, 'How spicy is this dish?', 'Món này cay cỡ nào?', 101),

    // Câu cho chủ đề 'Các món ăn'
    MdlSentence(206, 'This soup is very delicious.', 'Món súp này rất ngon.', 102),
    MdlSentence(207, 'The pizza is topped with cheese and mushrooms.', 'Chiếc pizza này được phủ phô mai và nấm.', 102),
    MdlSentence(208, 'I like eating sushi.', 'Tôi thích ăn sushi.', 102),
    MdlSentence(209, 'The salad has fresh vegetables.', 'Món salad này có rau tươi.', 102),
    MdlSentence(210, 'Desserts are served after the main course.', 'Món tráng miệng được phục vụ sau món chính.', 102),

    // Câu cho chủ đề 'Phương tiện đường bộ'
    MdlSentence(211, 'I am going to travel by bus.', 'Tôi sẽ đi bằng xe buýt.', 103),
    MdlSentence(212, 'Do you have a bicycle?', 'Bạn có xe đạp không?', 103),
    MdlSentence(213, 'The car is parked outside.', 'Xe ô tô đang đậu bên ngoài.', 103),
    MdlSentence(214, 'Motorcycles can be fast.', 'Xe máy có thể rất nhanh.', 103),
    MdlSentence(215, 'Walking is good exercise.', 'Đi bộ là bài tập tốt.', 103),
    MdlSentence(216, 'I need to catch the next train.', 'Tôi cần bắt chuyến tàu tiếp theo.', 103),
  ];
}

void main() {
  // Chuyển đối tượng thành chuỗi JSON
  String jsonString = jsonEncode(generateSubSentenceTopics().first.toJson());

  // In chuỗi JSON ra màn hình
  print(jsonString);
}
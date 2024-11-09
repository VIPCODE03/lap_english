import '../data/model/learn/sentence.dart';

List<MdlMainSentenceTopic> generateMainSentenceTopics() {
  return [
    MdlMainSentenceTopic(1, 'Chủ đề chính 1'),
    MdlMainSentenceTopic(2, 'Chủ đề chính 2'),
    MdlMainSentenceTopic(3, 'Chủ đề chính 3'),
    MdlMainSentenceTopic(4, 'Chủ đề chính 3'),
    MdlMainSentenceTopic(5, 'Chủ đề chính 3'),
    MdlMainSentenceTopic(6, 'Chủ đề chính 3'),
    MdlMainSentenceTopic(7, 'Chủ đề chính 3'),
    MdlMainSentenceTopic(8, 'Chủ đề chính 3'),
    MdlMainSentenceTopic(9, 'Chủ đề chính 3'),
    MdlMainSentenceTopic(10, 'Chủ đề chính 3'),
    MdlMainSentenceTopic(11, 'Chủ đề chính 3'),
    MdlMainSentenceTopic(12, 'Chủ đề chính 3'),
    MdlMainSentenceTopic(13, 'Chủ đề chính 3'),
    MdlMainSentenceTopic(14, 'Chủ đề chính 3'),
    MdlMainSentenceTopic(15, 'Chủ đề chính 3'),
    MdlMainSentenceTopic(16, 'Chủ đề chính 3'),
    MdlMainSentenceTopic(17, 'Chủ đề chính 3'),
    MdlMainSentenceTopic(18, 'Chủ đề chính 3'),
    MdlMainSentenceTopic(19, 'Chủ đề chính 3'),
    MdlMainSentenceTopic(20, 'Chủ đề chính 3'),
  ];
}

List<MdlSubSentenceTopic> generateSubSentenceTopics() {
  return [
    MdlSubSentenceTopic(101, 'Gọi món ăn', 'https://example.com/image1.jpg', 1, isLearned: false),
    MdlSubSentenceTopic(102, 'Các món ăn', 'https://example.com/image2.jpg', 1, isLearned: false),
    MdlSubSentenceTopic(103, 'Phương tiện đường bộ', 'https://example.com/image3.jpg', 2, isLearned: false),
    MdlSubSentenceTopic(104, 'Phương tiện đường thủy', 'https://example.com/image3.jpg', 2, isLearned: false),
    MdlSubSentenceTopic(105, 'Chạy', 'https://example.com/image3.jpg', 2, isLearned: false),
    MdlSubSentenceTopic(106, 'Phương tiện đường bộ', 'https://example.com/image3.jpg', 2, isLearned: false),
    MdlSubSentenceTopic(107, 'Phương tiện đường bộ', 'https://example.com/image3.jpg', 2, isLearned: false),
    MdlSubSentenceTopic(108, 'Phương tiện đường bộ', 'https://example.com/image3.jpg', 2, isLearned: false),
    MdlSubSentenceTopic(109, 'Phương tiện đường bộ', 'https://example.com/image3.jpg', 2, isLearned: false),
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


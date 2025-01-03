
import 'package:lap_english/data/model/quizz/quizz.dart';

import '../data/model/learn/challenge.dart';

Challenge generateEnglishChallenge() {
  return Challenge(
      id: 1,
      content: [
        'Hi - Chào',
        'Hello - Xin chào',
        'Cat - Con mèo',
        'Dog - Con chó',
        'Melon - Quả dưa hấu'
      ],
      quizzes: [
        CustomQuiz('Từ nào sau đây dùng để chào hỏi', ['Hi', 'Cat', 'Dog', 'Apple'], 'Hi', TypeQuiz.chooseOne),
        CustomQuiz('Chọn các từ chỉ con vật', ['Cat', 'Hello', 'Dog', 'Apple'], 'Cat Dog', TypeQuiz.select),
        CustomQuiz('Quả nào sau đây ruột đỏ vỏ xanh', ['Apple', 'Orange', 'Mulberry', 'Melon'], 'Melon', TypeQuiz.chooseOne),
        CustomQuiz('Từ nào bắt đầu cuộc gặp gỡ', ['Hello', 'Goodbye'], 'Hello', TypeQuiz.chooseOne),
        CustomQuiz('Con nào thường được nuôi để bắt chuột?', ['Cat', 'Dog'], 'Cat', TypeQuiz.chooseOne),
        CustomQuiz('Viết từ quả dưa hấu', [], 'Melon', TypeQuiz.write),
      ]
  );
}

Challenge generateChallenge() {
  return Challenge(
    id: 2,
    content: [
      'Apple - Quả táo',
      'Banana - Quả chuối',
      'Carrot - Củ cà rốt',
      'Orange - Quả cam',
      'Strawberry - Quả dâu tây',
    ],
    quizzes: [
      CustomQuiz(
        'Từ nào là tên một loại trái cây?',
        ['Apple', 'Carrot', 'Table', 'Chair'],
        'Apple',
        TypeQuiz.chooseOne,
      ),
      CustomQuiz(
        'Chọn tất cả các từ là tên loại trái cây?',
        ['Banana', 'Carrot', 'Orange', 'Pencil'],
        'Banana Orange',
        TypeQuiz.select,
      ),
      CustomQuiz(
        'Quả nào có màu đỏ và có nhiều hạt nhỏ bên ngoài?',
        ['Banana', 'Strawberry', 'Orange', 'Apple'],
        'Strawberry',
        TypeQuiz.chooseOne,
      ),
      CustomQuiz(
        'Từ nào chỉ một loại củ?',
        ['Carrot', 'Apple', 'Banana'],
        'Carrot',
        TypeQuiz.chooseOne,
      ),
      CustomQuiz(
        'Viết tên một loại quả có màu cam.',
        [],
        'Orange',
        TypeQuiz.write,
      ),
    ],
  );
}

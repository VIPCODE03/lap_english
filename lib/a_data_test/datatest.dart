// Function to generate a list of main topics
import 'package:lap_english/data/model/learn/word_sentence.dart';

import '../data/model/learn/status.dart';

List<MainTopic> generateMainVocabularyTopics() {
  final List<Map<String, dynamic>> data = [
    {"id": 1, "name": "Phổ biến"},
    {"id": 2, "name": "Trái cây"},
    {"id": 3, "name": "Anh triệu đẹp troai vl"},
    {"id": 4, "name": "Anh triệu vip vl",},
    {"id": 5, "name": "Động vật",},
    {"id": 6, "name": "Địa lý"},
    {"id": 7, "name": "Món ăn"},
    {"id": 8, "name": "Sự kiện lịch sử"},
    {"id": 9, "name": "Văn học"},
    {"id": 10, "name": "Khoa học"},
    {"id": 11, "name": "Con số"},
    {"id": 12, "name": "Môn học"},
    {"id": 13, "name": "Đời sống"}
  ];

  return data.map((item) {
    return MainTopic(
      item['id'],
      item['name'],
      MdlUnlockStatusManager(diamond: 0, gold: 0, locked: true),
    );
  }).toList();
}

List<SubTopic> generateSubVocabularyTopics() {
  final List<Map<String, dynamic>> data = [
    // Chủ đề con của "Phổ biến"
    {
      "id": 1,
      "name": "Gia đình",
      "imageUrl": "https://i.pinimg.com/236x/48/ce/91/48ce9180a30c3d797b3fc6de2eec60ed.jpg",
      "isLearned": false,
      "idMainTopic": 1
    },
    {
      "id": 2,
      "name": "Công việc",
      "imageUrl": "https://i.pinimg.com/236x/48/ce/91/48ce9180a30c3d797b3fc6de2eec60ed.jpg",
      "isLearned": false,
      "idMainTopic": 1
    },
    {
      "id": 3,
      "name": "Sở thích",
      "imageUrl": "https://i.pinimg.com/236x/48/ce/91/48ce9180a30c3d797b3fc6de2eec60ed.jpg",
      "isLearned": false,
      "idMainTopic": 1
    },

    // Chủ đề con của "Trái cây"
    {
      "id": 4,
      "name": "Quả cam",
      "imageUrl": "https://i.pinimg.com/236x/48/ce/91/48ce9180a30c3d797b3fc6de2eec60ed.jpg",
      "isLearned": true,
      "idMainTopic": 2
    },
    {
      "id": 5,
      "name": "Quả táo",
      "imageUrl": "https://i.pinimg.com/236x/48/ce/91/48ce9180a30c3d797b3fc6de2eec60ed.jpg",
      "isLearned": false,
      "idMainTopic": 2
    },
    {
      "id": 6,
      "name": "Quả dưa hấu",
      "imageUrl": "https://i.pinimg.com/236x/48/ce/91/48ce9180a30c3d797b3fc6de2eec60ed.jpg",
      "isLearned": false,
      "idMainTopic": 2
    },
  ];

  return data.map((item) {
    return SubTopic(
      item['id'],
      item['name'],
      item['imageUrl'],
      item['idMainTopic'],
      MdlUnlockStatusManager(diamond: 0, gold: 0, locked: true),
      isLearned: item['isLearned'] ?? false,
    );
  }).toList();
}


// Function to generate a list of words
List<Map<String, dynamic>> generateWords() {
  return [
    {
      "id": 1001,
      "word": "Father",
      "meaning": "Bố, cha",
      "pronounceUK": "/ˈfɑːðər/",
      "pronounceUS": "/ˈfɑːðər/",
      "type": "Danh từ",
      "level": "A1",
      "example": "My father is a doctor.",
      "subTopicId": 1,
      "imageBlobName": "https://khoinguonsangtao.vn/wp-content/uploads/2023/02/anh-hello-kitty-thien-than-dang-yeu.jpg",
      "audioUkBlobName": null,
      "audioUsBlobName": null
    },
    {
      "id": 1002,
      "word": "Mother",
      "meaning": "Mẹ",
      "pronounceUK": "/ˈmʌðər/",
      "pronounceUS": "/ˈmʌðər/",
      "type": "Danh từ",
      "level": "A1",
      "example": "My mother is a teacher.",
      "subTopicId": 1,
      "imageBlobName": "https://inkythuatso.com/uploads/thumbnails/800/2023/02/hinh-con-ngua-de-thuong-chibi-3-24-09-34-45.jpg",
      "audioUkBlobName": null,
      "audioUsBlobName": null
    },
    {
      "id": 1003,
      "word": "Brother",
      "meaning": "Anh, em trai",
      "pronounceUK": "/ˈbrʌðər/",
      "pronounceUS": "/ˈbrʌðər/",
      "type": "Danh từ",
      "level": "A1",
      "example": "I have one brother.",
      "subTopicId": 1,
      "imageBlobName": "https://file.vfo.vn/hinh/2014/1/anh-con-ngua-1.png",
      "audioUkBlobName": null,
      "audioUsBlobName": null
    },
    {
      "id": 1004,
      "word": "Sister",
      "meaning": "Chị, em gái",
      "pronounceUK": "/ˈsɪstər/",
      "pronounceUS": "/ˈsɪstər/",
      "type": "Danh từ",
      "level": "A1",
      "example": "My sister is very kind.",
      "subTopicId": 1,
      "imageBlobName": "https://img.freepik.com/premium-vector/cute-horse-cartoon-isolated-white-background-horse-icon-concept_11393-533.jpg?w=2000",
      "audioUkBlobName": null,
      "audioUsBlobName": null
    },
    {
      "id": 1005,
      "word": "Parents",
      "meaning": "Bố mẹ",
      "pronounceUK": "/ˈpeərənts/",
      "pronounceUS": "/ˈperənts/",
      "type": "Danh từ",
      "level": "A1",
      "example": "My parents live in the city.",
      "subTopicId": 1,
      "imageBlobName": "https://haycafe.vn/wp-content/uploads/2022/02/Hinh-anh-con-gai-cute-de-thuong-hoat-hinh.jpg",
      "audioUkBlobName": null,
      "audioUsBlobName": null
    },

    {
        "id": 1006,
        "word": "Job",
        "meaning": "Công việc",
        "pronounceUK": "/dʒɒb/",
        "pronounceUS": "/dʒɑːb/",
        "type": "Danh từ",
        "level": "A2",
        "example": "He has a new job.",
        "subTopicId": 2,
        "imageBlobName": "https://khoinguonsangtao.vn/wp-content/uploads/2023/02/anh-hello-kitty-thien-than-dang-yeu.jpg",
        "audioUkBlobName": null,
        "audioUsBlobName": null
    },
      {
        "id": 1007,
        "word": "Work",
        "meaning": "Làm việc",
        "pronounceUK": "/wɜːk/",
        "pronounceUS": "/wɜːrk/",
        "type": "Danh từ",
        "level": "A1",
        "example": "I work at a hospital.",
        "subTopicId": 2,
        "imageBlobName": "https://khoinguonsangtao.vn/wp-content/uploads/2023/02/anh-hello-kitty-thien-than-dang-yeu.jpg",
        "audioUkBlobName": null,
        "audioUsBlobName": null
      },
      {
        "id": 1008,
        "word": "Boss",
        "meaning": "Sếp",
        "pronounceUK": "/bɒs/",
        "pronounceUS": "/bɔːs/",
        "type": "Danh từ",
        "level": "A2",
        "example": "My boss is very nice.",
        "subTopicId": 2,
        "imageBlobName": "https://khoinguonsangtao.vn/wp-content/uploads/2023/02/anh-hello-kitty-thien-than-dang-yeu.jpg",
        "audioUkBlobName": null,
        "audioUsBlobName": null
      },
      {
        "id": 1009,
        "word": "Colleague",
        "meaning": "Đồng nghiệp",
        "pronounceUK": "/ˈkɒliːɡ/",
        "pronounceUS": "/ˈkɑːliːɡ/",
        "type": "Danh từ",
        "level": "A2",
        "example": "She is my colleague.",
        "subTopicId": 2,
        "imageBlobName": "https://khoinguonsangtao.vn/wp-content/uploads/2023/02/anh-hello-kitty-thien-than-dang-yeu.jpg",
        "audioUkBlobName": null,
        "audioUsBlobName": null
      },
      {
        "id": 1010,
        "word": "Salary",
        "meaning": "Lương",
        "pronounceUK": "/ˈsæləri/",
        "pronounceUS": "/ˈsæləri/",
        "type": "Danh từ",
        "level": "B1",
        "example": "He gets a high salary.",
        "subTopicId": 2,
        "imageBlobName": "https://khoinguonsangtao.vn/wp-content/uploads/2023/02/anh-hello-kitty-thien-than-dang-yeu.jpg",
        "audioUkBlobName": null,
        "audioUsBlobName": null
      },
  ];
}
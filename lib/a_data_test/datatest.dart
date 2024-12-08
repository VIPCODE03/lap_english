// Function to generate a list of main topics
List<Map<String, dynamic>> generateMainVocabularyTopics() {
  return [
    {
      "id": 1,
      "name": "Phổ biến"
    },
    {
      "id": 2,
      "name": "Trái cây"
    },
    {
      "id": 3,
      "name": "Anh triệu đẹp troai vl"
    },
    {
      "id": 4,
      "name": "Anh triệu vip vl"
    },
    {
      "id": 5,
      "name": "Động vật"
    },
    {
      "id": 6,
      "name": "Địa lý"
    },
    {
      "id": 7,
      "name": "Món ăn"
    },
    {
      "id": 8,
      "name": "Sự kiện lịch sử"
    },
    {
      "id": 9,
      "name": "Văn học"
    },
    {
      "id": 10,
      "name": "Khoa học"
    },
    {
      "id": 11,
      "name": "Con số"
    },
    {
      "id": 12,
      "name": "Môn học"
    },
    {
      "id": 13,
      "name": "Đời sống"
    }
  ];
}

// Function to generate a list of sub-topics
List<Map<String, dynamic>> generateSubVocabularyTopics() {
  return [
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

    // Chủ đề con của "Anh triệu đẹp troai vl"
    {
      "id": 7,
      "name": "Phong cách",
      "imageUrl": "https://i.pinimg.com/236x/48/ce/91/48ce9180a30c3d797b3fc6de2eec60ed.jpg",
      "isLearned": false,
      "idMainTopic": 3
    },
    {
      "id": 8,
      "name": "Thời trang",
      "imageUrl": "https://i.pinimg.com/236x/48/ce/91/48ce9180a30c3d797b3fc6de2eec60ed.jpg",
      "isLearned": false,
      "idMainTopic": 3
    },

    // Chủ đề con của "Anh triệu vip vl"
    {
      "id": 10,
      "name": "Siêu xe",
      "imageUrl": "https://png.pngtree.com/png-vector/20201223/ourlarge/pngtree-cute-cartoon-girl-material-png-image_2604322.jpg",
      "isLearned": false,
      "idMainTopic": 4
    },
    {
      "id": 11,
      "name": "Du lịch",
      "imageUrl": "https://png.pngtree.com/png-vector/20201223/ourlarge/pngtree-cute-cartoon-girl-material-png-image_2604322.jpg",
      "isLearned": false,
      "idMainTopic": 4
    },
    {
      "id": 12,
      "name": "Kinh doanh",
      "imageUrl": "https://i.pinimg.com/236x/48/ce/91/48ce9180a30c3d797b3fc6de2eec60ed.jpg",
      "isLearned": false,
      "idMainTopic": 4
    },

    // Chủ đề con của "Động vật"
    {
      "id": 13,
      "name": "Chó",
      "imageUrl": "https://png.pngtree.com/png-vector/20201223/ourlarge/pngtree-cute-cartoon-girl-material-png-image_2604322.jpg",
      "isLearned": false,
      "idMainTopic": 5
    },
    {
      "id": 14,
      "name": "Mèo",
      "imageUrl": "https://png.pngtree.com/png-vector/20201223/ourlarge/pngtree-cute-cartoon-girl-material-png-image_2604322.jpg",
      "isLearned": false,
      "idMainTopic": 5
    },

    // Chủ đề con của "Địa lý"
    {
      "id": 15,
      "name": "Quốc gia",
      "imageUrl": "https://i.pinimg.com/236x/48/ce/91/48ce9180a30c3d797b3fc6de2eec60ed.jpg",
      "isLearned": false,
      "idMainTopic": 6
    },
    {
      "id": 16,
      "name": "Thành phố",
      "imageUrl": "https://png.pngtree.com/png-vector/20201223/ourlarge/pngtree-cute-cartoon-girl-material-png-image_2604322.jpg",
      "isLearned": false,
      "idMainTopic": 6
    },

    // Chủ đề con của "Món ăn"
    {
      "id": 116,
      "name": "Bánh mì",
      "imageUrl": "https://example.com/bread.jpg",
      "isLearned": false,
      "idMainTopic": 7
    },
    {
      "id": 117,
      "name": "Phở",
      "imageUrl": "https://example.com/pho.jpg",
      "isLearned": false,
      "idMainTopic": 7
    },

    // Chủ đề con của "Sự kiện lịch sử"
    {
      "id": 118,
      "name": "Chiến tranh thế giới",
      "imageUrl": "https://example.com/worldwar.jpg",
      "isLearned": false,
      "idMainTopic": 8
    },
    {
      "id": 119,
      "name": "Cách mạng",
      "imageUrl": "https://example.com/revolution.jpg",
      "isLearned": false,
      "idMainTopic": 8
    },

    // Chủ đề con của "Văn học"
    {
      "id": 120,
      "name": "Tiểu thuyết",
      "imageUrl": "https://example.com/novel.jpg",
      "isLearned": false,
      "idMainTopic": 9
    },
    {
      "id": 121,
      "name": "Thơ",
      "imageUrl": "https://example.com/poem.jpg",
      "isLearned": false,
      "idMainTopic": 9
    },

    // Chủ đề con của "Khoa học"
    {
      "id": 122,
      "name": "Vật lý",
      "imageUrl": "https://example.com/physics.jpg",
      "isLearned": false,
      "idMainTopic": 10
    },
    {
      "id": 123,
      "name": "Hóa học",
      "imageUrl": "https://example.com/chemistry.jpg",
      "isLearned": false,
      "idMainTopic": 10
    }
  ];
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
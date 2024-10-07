// mock_data.dart

class MockData {
  static const String jsonString = '''
  [
    {
      "id": 1,
      "name": "Phổ biến",
      "subTopics": [
        {
          "id": 101,
          "name": "Gia đình",
          "imageUrl": "https://anvientv.com.vn/uploads/upload/1672721733_chup-anh-gia-dinh-4-nguoi(7).jpg", 
          "words": [
            {
              "id": 1001,
              "word": "Father",
              "meaning": "Bố, cha",
              "pronounceUK": "/ˈfɑːðər/",
              "pronounceUS": "/ˈfɑːðər/",
              "type": "Danh từ",
              "level": "A1",
              "examples": ["My father is a doctor.", "I love my father."]
            },
            {
              "id": 1002,
              "word": "Mother",
              "meaning": "Mẹ, bà",
              "pronounceUK": "/ˈmʌðər/",
              "pronounceUS": "/ˈmʌðər/",
              "type": "Danh từ",
              "level": "A1",
              "examples": ["My mother cooks well.", "I miss my mother."]
            },
            {
              "id": 1003,
              "word": "Brother",
              "meaning": "Anh, em trai",
              "pronounceUK": "/ˈbrʌðər/",
              "pronounceUS": "/ˈbrʌðər/",
              "type": "Danh từ",
              "level": "A1",
              "examples": ["I have one brother.", "My brother plays football."]
            },
            {
              "id": 1004,
              "word": "Sister",
              "meaning": "Chị, em gái",
              "pronounceUK": "/ˈsɪstər/",
              "pronounceUS": "/ˈsɪstər/",
              "type": "Danh từ",
              "level": "A1",
              "examples": ["My sister is very kind.", "I share a room with my sister."]
            },
            {
              "id": 1005,
              "word": "Grandfather",
              "meaning": "Ông, ông ngoại",
              "pronounceUK": "/ˈɡrændfɑːðər/",
              "pronounceUS": "/ˈɡrændfɑːðər/",
              "type": "Danh từ",
              "level": "A1",
              "examples": ["My grandfather tells stories.", "I visit my grandfather on weekends."]
            },
            {
              "id": 1006,
              "word": "Grandmother",
              "meaning": "Bà, bà ngoại",
              "pronounceUK": "/ˈɡrændˌmʌðər/",
              "pronounceUS": "/ˈɡrændˌmʌðər/",
              "type": "Danh từ",
              "level": "A1",
              "examples": ["My grandmother bakes cookies.", "I love my grandmother."]
            },
            {
              "id": 1007,
              "word": "Aunt",
              "meaning": "Dì, cô",
              "pronounceUK": "/ænt/",
              "pronounceUS": "/ænt/",
              "type": "Danh từ",
              "level": "A1",
              "examples": ["My aunt lives in another city.", "I visit my aunt during holidays."]
            },
            {
              "id": 1008,
              "word": "Uncle",
              "meaning": "Chú, bác",
              "pronounceUK": "/ˈʌŋkl/",
              "pronounceUS": "/ˈʌŋkl/",
              "type": "Danh từ",
              "level": "A1",
              "examples": ["My uncle is funny.", "I play with my uncle."]
            },
            {
              "id": 1009,
              "word": "Cousin",
              "meaning": "Anh, chị, em họ",
              "pronounceUK": "/ˈkʌz.ən/",
              "pronounceUS": "/ˈkʌz.ən/",
              "type": "Danh từ",
              "level": "A1",
              "examples": ["I have many cousins.", "My cousin is my best friend."]
            },
            {
              "id": 1010,
              "word": "Family",
              "meaning": "Gia đình",
              "pronounceUK": "/ˈfæm.ɪ.li/",
              "pronounceUS": "/ˈfæm.ɪ.li/",
              "type": "Danh từ",
              "level": "A1",
              "examples": ["I love my family.", "We have a big family."]
            }
          ]
        },
        {
          "id": 102,
          "name": "Trái cây",
          "imageUrl": "https://img.lovepik.com/element/40102/1171.png_1200.png", 
          "words": [
            {
              "id": 1002,
              "word": "Apple",
              "meaning": "Táo",
              "pronounceUK": "ˈæpl",
              "pronounceUS": "ˈæpəl",
              "type": "Danh từ",
              "level": "Dễ",
              "examples": ["She ate an apple.", "The apple is red."]
            },
            {
              "id": 1003,
              "word": "Banana",
              "meaning": "Chuối",
              "pronounceUK": "bəˈnɑːnə",
              "pronounceUS": "bəˈnænə",
              "type": "Danh từ",
              "level": "Dễ",
              "examples": ["I like eating bananas.", "Bananas are yellow."]
            },
            {
              "id": 1004,
              "word": "Orange",
              "meaning": "Cam",
              "pronounceUK": "ˈɒrɪndʒ",
              "pronounceUS": "ˈɔːrɪndʒ",
              "type": "Danh từ",
              "level": "Dễ",
              "examples": ["He drinks orange juice.", "Oranges are rich in vitamin C."]
            },
            {
              "id": 1005,
              "word": "Grapes",
              "meaning": "Nho",
              "pronounceUK": "ɡreɪps",
              "pronounceUS": "ɡreɪps",
              "type": "Danh từ",
              "level": "Dễ",
              "examples": ["She bought a bunch of grapes.", "Grapes are sweet."]
            },
            {
              "id": 1006,
              "word": "Pineapple",
              "meaning": "Dứa",
              "pronounceUK": "ˈpaɪnæpl",
              "pronounceUS": "ˈpaɪnˌæpl",
              "type": "Danh từ",
              "level": "Trung bình",
              "examples": ["Pineapples are tropical fruits.", "The pineapple is sour."]
            }
          ]
        }
      ]
    },
    {
      "id": 2,
      "name": "Chủ đề 2",
      "subTopics": [
        {
          "id": 201,
          "name": "Chủ đề con 3",
          "imageUrl": "https://img6.thuthuatphanmem.vn/uploads/2022/11/17/anh-chibi-cute_014001732.png",  
          "words": [
            {
              "id": 1003,
              "word": "Từ vựng 3",
              "meaning": "Ý nghĩa 3",
              "pronounceUK": "phát âm UK",
              "pronounceUS": "phát âm US",
              "type": "Tính từ",
              "level": "Khó",
              "examples": ["Ví dụ 5", "Ví dụ 6"]
            }
          ]
        },
        {
          "id": 202,
          "name": "Chủ đề con 4",
          "imageUrl": "https://i.ytimg.com/vi/qTbqRSE60x0/maxresdefault.jpg", 
          "words": []
        },
        {
          "id": 203,
          "name": "Chủ đề con 5",
          "imageUrl": "https://img2.thuthuatphanmem.vn/uploads/2019/03/14/hinh-anh-ve-qua-tao_095351501.jpg",  
          "words": []
        },
        {
          "id": 204,
          "name": "Chủ đề con 6",
          "imageUrl": "https://img5.thuthuatphanmem.vn/uploads/2021/11/08/hinh-nen-ton-ngo-khong-3d_043205857.jpg",  
          "words": []
        },
        {
          "id": 205,
          "name": "Chủ đề con 7",
          "imageUrl": "https://img5.thuthuatphanmem.vn/uploads/2021/11/08/hinh-nen-ton-ngo-khong-3d_043205857.jpg", 
          "words": []
        }
      ]
    },
    {
      "id": 3,
      "name": "Anh triệu đẹp troai vl",
      "subTopics": [
        {
          "id": 301,
          "name": "Chủ đề con 8",
          "imageUrl": "https://img.lovepik.com/element/40020/5555.png_860.png",
          "words": [
            {
              "id": 1003,
              "word": "Từ vựng 3",
              "meaning": "Ý nghĩa 3",
              "pronounceUK": "phát âm UK",
              "pronounceUS": "phát âm US",
              "type": "Tính từ",
              "level": "Khó",
              "examples": ["Ví dụ 5", "Ví dụ 6"]
            }
          ]
        },
        {
          "id": 302,
          "name": "Chủ đề con 9",
          "imageUrl": "http://hinhnendepnhat.net/wp-content/uploads/2014/06/hinh-nen-hoat-hinh-choco-dang-yeu-dang-hoc-bai.jpg", 
          "words": []
        },
        {
          "id": 303,
          "name": "Chủ đề con 10",
          "imageUrl": "https://tingenz.com/wp-content/uploads/2022/03/anh-con-vit-cute-12.jpg",
          "words": []
        },
        {
          "id": 304,
          "name": "Chủ đề con 11",
          "imageUrl": "https://img5.thuthuatphanmem.vn/uploads/2021/11/08/hinh-nen-ton-ngo-khong-3d_043205857.jpg", 
          "words": []
        },
        {
          "id": 305,
          "name": "Chủ đề con 12",
          "imageUrl": "https://img5.thuthuatphanmem.vn/uploads/2021/11/08/hinh-nen-ton-ngo-khong-3d_043205857.jpg", 
          "words": []
        }
      ]
    }
  ]
  ''';
}


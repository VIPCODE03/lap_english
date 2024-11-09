// mock_data.dart

import 'dart:convert';

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
    },    {
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
    },    {
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
      "id": 101,
      "name": "Gia đình",
      "imageUrl": "https://i.pinimg.com/236x/48/ce/91/48ce9180a30c3d797b3fc6de2eec60ed.jpg",
      "isLearned": false,
      "idMainTopic": 1
    },
    {
      "id": 102,
      "name": "Công việc",
      "imageUrl": "https://i.pinimg.com/236x/48/ce/91/48ce9180a30c3d797b3fc6de2eec60ed.jpg",
      "isLearned": false,
      "idMainTopic": 1
    },
    {
      "id": 103,
      "name": "Sở thích",
      "imageUrl": "https://i.pinimg.com/236x/48/ce/91/48ce9180a30c3d797b3fc6de2eec60ed.jpg",
      "isLearned": false,
      "idMainTopic": 1
    },

    // Chủ đề con của "Trái cây"
    {
      "id": 104,
      "name": "Quả cam",
      "imageUrl": "https://i.pinimg.com/236x/48/ce/91/48ce9180a30c3d797b3fc6de2eec60ed.jpg",
      "isLearned": true,
      "idMainTopic": 2
    },
    {
      "id": 105,
      "name": "Quả táo",
      "imageUrl": "https://i.pinimg.com/236x/48/ce/91/48ce9180a30c3d797b3fc6de2eec60ed.jpg",
      "isLearned": false,
      "idMainTopic": 2
    },
    {
      "id": 106,
      "name": "Quả dưa hấu",
      "imageUrl": "https://i.pinimg.com/236x/48/ce/91/48ce9180a30c3d797b3fc6de2eec60ed.jpg",
      "isLearned": false,
      "idMainTopic": 2
    },

    // Chủ đề con của "Anh triệu đẹp troai vl"
    {
      "id": 107,
      "name": "Phong cách",
      "imageUrl": "https://i.pinimg.com/236x/48/ce/91/48ce9180a30c3d797b3fc6de2eec60ed.jpg",
      "isLearned": false,
      "idMainTopic": 3
    },
    {
      "id": 108,
      "name": "Thời trang",
      "imageUrl": "https://i.pinimg.com/236x/48/ce/91/48ce9180a30c3d797b3fc6de2eec60ed.jpg",
      "isLearned": false,
      "idMainTopic": 3
    },

    // Chủ đề con của "Anh triệu vip vl"
    {
      "id": 109,
      "name": "Siêu xe",
      "imageUrl": "https://png.pngtree.com/png-vector/20201223/ourlarge/pngtree-cute-cartoon-girl-material-png-image_2604322.jpg",
      "isLearned": false,
      "idMainTopic": 4
    },
    {
      "id": 110,
      "name": "Du lịch",
      "imageUrl": "https://png.pngtree.com/png-vector/20201223/ourlarge/pngtree-cute-cartoon-girl-material-png-image_2604322.jpg",
      "isLearned": false,
      "idMainTopic": 4
    },
    {
      "id": 111,
      "name": "Kinh doanh",
      "imageUrl": "https://i.pinimg.com/236x/48/ce/91/48ce9180a30c3d797b3fc6de2eec60ed.jpg",
      "isLearned": false,
      "idMainTopic": 4
    },

    // Chủ đề con của "Động vật"
    {
      "id": 112,
      "name": "Chó",
      "imageUrl": "https://png.pngtree.com/png-vector/20201223/ourlarge/pngtree-cute-cartoon-girl-material-png-image_2604322.jpg",
      "isLearned": false,
      "idMainTopic": 5
    },
    {
      "id": 113,
      "name": "Mèo",
      "imageUrl": "https://png.pngtree.com/png-vector/20201223/ourlarge/pngtree-cute-cartoon-girl-material-png-image_2604322.jpg",
      "isLearned": false,
      "idMainTopic": 5
    },

    // Chủ đề con của "Địa lý"
    {
      "id": 114,
      "name": "Quốc gia",
      "imageUrl": "https://i.pinimg.com/236x/48/ce/91/48ce9180a30c3d797b3fc6de2eec60ed.jpg",
      "isLearned": false,
      "idMainTopic": 6
    },
    {
      "id": 115,
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
    // Từ vựng của chủ đề con "Gia đình"
    {
      "id": 1001,
      "word": "Father",
      "meaning": "Bố, cha",
      "pronounceUK": "/ˈfɑːðər/",
      "pronounceUS": "/ˈfɑːðər/",
      "type": "Danh từ",
      "level": "A1",
      "example": "My father is a doctor.",
      "idSubTopic": 101
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
      "idSubTopic": 101
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
      "idSubTopic": 101
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
      "idSubTopic": 101
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
      "idSubTopic": 101
    },

    // Từ vựng của chủ đề con "Công việc"
    {
      "id": 1006,
      "word": "Job",
      "meaning": "Công việc",
      "pronounceUK": "/dʒɒb/",
      "pronounceUS": "/dʒɑːb/",
      "type": "Danh từ",
      "level": "A2",
      "example": "He has a new job.",
      "idSubTopic": 102
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
      "idSubTopic": 102
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
      "idSubTopic": 102
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
      "idSubTopic": 102
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
      "idSubTopic": 102
    },

    // Từ vựng của chủ đề con "Sở thích"
    {
      "id": 1011,
      "word": "Reading",
      "meaning": "Đọc sách",
      "pronounceUK": "/ˈriːdɪŋ/",
      "pronounceUS": "/ˈriːdɪŋ/",
      "type": "Danh từ",
      "level": "A1",
      "example": "I love reading books.",
      "idSubTopic": 103
    },
    {
      "id": 1012,
      "word": "Swimming",
      "meaning": "Bơi lội",
      "pronounceUK": "/ˈswɪmɪŋ/",
      "pronounceUS": "/ˈswɪmɪŋ/",
      "type": "Danh từ",
      "level": "A2",
      "example": "She enjoys swimming in the sea.",
      "idSubTopic": 103
    },
    {
      "id": 1013,
      "word": "Painting",
      "meaning": "Vẽ tranh",
      "pronounceUK": "/ˈpeɪntɪŋ/",
      "pronounceUS": "/ˈpeɪntɪŋ/",
      "type": "Danh từ",
      "level": "B1",
      "example": "He loves painting landscapes.",
      "idSubTopic": 103
    },
    {
      "id": 1014,
      "word": "Cooking",
      "meaning": "Nấu ăn",
      "pronounceUK": "/ˈkʊkɪŋ/",
      "pronounceUS": "/ˈkʊkɪŋ/",
      "type": "Danh từ",
      "level": "A2",
      "example": "She enjoys cooking Italian food.",
      "idSubTopic": 103
    },
    {
      "id": 1015,
      "word": "Cycling",
      "meaning": "Đạp xe",
      "pronounceUK": "/ˈsaɪklɪŋ/",
      "pronounceUS": "/ˈsaɪklɪŋ/",
      "type": "Danh từ",
      "level": "A1",
      "example": "Cycling is good for health.",
      "idSubTopic": 103
    },

    // Từ vựng của chủ đề con "Quả cam"
    {
      "id": 1016,
      "word": "Orange",
      "meaning": "Cam",
      "pronounceUK": "/ˈɔːrɪndʒ/",
      "pronounceUS": "/ˈɔːrɪndʒ/",
      "type": "Danh từ",
      "level": "A1",
      "example": "I drink orange juice every morning.",
      "idSubTopic": 104
    },
    {
      "id": 1017,
      "word": "Peel",
      "meaning": "Vỏ (quả)",
      "pronounceUK": "/piːl/",
      "pronounceUS": "/piːl/",
      "type": "Danh từ",
      "level": "A2",
      "example": "Peel the orange before eating.",
      "idSubTopic": 104
    },
    {
      "id": 1018,
      "word": "Juice",
      "meaning": "Nước ép",
      "pronounceUK": "/dʒuːs/",
      "pronounceUS": "/dʒuːs/",
      "type": "Danh từ",
      "level": "A2",
      "example": "I like to drink fresh juice.",
      "idSubTopic": 104
    },
    {
      "id": 1019,
      "word": "Sweet",
      "meaning": "Ngọt",
      "pronounceUK": "/swiːt/",
      "pronounceUS": "/swiːt/",
      "type": "Tính từ",
      "level": "A1",
      "example": "This orange is very sweet.",
      "idSubTopic": 104
    },
    {
      "id": 1020,
      "word": "Citrus",
      "meaning": "Cây họ cam quýt",
      "pronounceUK": "/ˈsɪtrəs/",
      "pronounceUS": "/ˈsɪtrəs/",
      "type": "Danh từ",
      "level": "B1",
      "example": "Oranges are a type of citrus fruit.",
      "idSubTopic": 104
    },
    {
      "id": 2000,
      "word": "Force",
      "meaning": "Lực",
      "pronounceUK": "/fɔːs/",
      "pronounceUS": "/fɔːrs/",
      "type": "Danh từ",
      "level": "B1",
      "example": "Force is required to move an object.",
      "idSubTopic": 122
    },
    {
      "id": 2001,
      "word": "Energy",
      "meaning": "Năng lượng",
      "pronounceUK": "/ˈɛnədʒi/",
      "pronounceUS": "/ˈɛnərdʒi/",
      "type": "Danh từ",
      "level": "A2",
      "example": "Solar panels convert sunlight into energy.",
      "idSubTopic": 122
    },
    {
      "id": 2002,
      "word": "Gravity",
      "meaning": "Lực hấp dẫn",
      "pronounceUK": "/ˈɡrævɪti/",
      "pronounceUS": "/ˈɡrævɪti/",
      "type": "Danh từ",
      "level": "B1",
      "example": "Gravity pulls objects toward the Earth.",
      "idSubTopic": 122
    },
    {
      "id": 2003,
      "word": "Acceleration",
      "meaning": "Gia tốc",
      "pronounceUK": "/əkˌsɛləˈreɪʃən/",
      "pronounceUS": "/əkˌsɛləˈreɪʃən/",
      "type": "Danh từ",
      "level": "B2",
      "example": "The car's acceleration was impressive.",
      "idSubTopic": 122
    },
    {
      "id": 2004,
      "word": "Velocity",
      "meaning": "Vận tốc",
      "pronounceUK": "/vəˈlɒsəti/",
      "pronounceUS": "/vəˈlɑːsəti/",
      "type": "Danh từ",
      "level": "B2",
      "example": "The velocity of the car increased as it went down the hill.",
      "idSubTopic": 122
    },
    {
      "id": 2005,
      "word": "Mass",
      "meaning": "Khối lượng",
      "pronounceUK": "/mæs/",
      "pronounceUS": "/mæs/",
      "type": "Danh từ",
      "level": "A2",
      "example": "The mass of the object is important in physics.",
      "idSubTopic": 122
    },
    {
      "id": 2006,
      "word": "Momentum",
      "meaning": "Động lượng",
      "pronounceUK": "/məˈmɛntəm/",
      "pronounceUS": "/məˈmɛntəm/",
      "type": "Danh từ",
      "level": "B2",
      "example": "The momentum of the car increased as it gained speed.",
      "idSubTopic": 122
    },
    {
      "id": 2007,
      "word": "Kinetic",
      "meaning": "Động lực học",
      "pronounceUK": "/kɪˈnɛtɪk/",
      "pronounceUS": "/kɪˈnɛtɪk/",
      "type": "Tính từ",
      "level": "B2",
      "example": "Kinetic energy is the energy of motion.",
      "idSubTopic": 122
    },
    {
      "id": 2008,
      "word": "Potential",
      "meaning": "Tiềm năng",
      "pronounceUK": "/pəˈtɛnʃəl/",
      "pronounceUS": "/pəˈtɛnʃəl/",
      "type": "Tính từ",
      "level": "B2",
      "example": "The ball has potential energy when it is at the top of the hill.",
      "idSubTopic": 122
    },
    {
      "id": 2009,
      "word": "Friction",
      "meaning": "Ma sát",
      "pronounceUK": "/ˈfrɪkʃən/",
      "pronounceUS": "/ˈfrɪkʃən/",
      "type": "Danh từ",
      "level": "B1",
      "example": "Friction between the ground and the tires slows down the car.",
      "idSubTopic": 122
    },
  ];
}

void main() {
  String a = jsonEncode(generateWords());
  print(a);
}

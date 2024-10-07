class DataSentence {
  static const String sentenceJsonString = '''
  [
    {
      "id": 1,
      "name": "Daily Conversations",
      "subSentenceTopics": [
        {
          "id": 1,
          "name": "Greetings",
          "imageUrl": "https://example.com/greetings.jpg",
          "sentences": [
            {
              "id": 1,
              "sentence": "Hello, how are you?",
              "translation": "Xin chào, bạn khỏe không?"
            },
            {
              "id": 2,
              "sentence": "Good morning!",
              "translation": "Chào buổi sáng!"
            },
            {
              "id": 3,
              "sentence": "Hi there! What's up?",
              "translation": "Chào bạn! Có gì mới không?"
            },
            {
              "id": 4,
              "sentence": "Nice to meet you!",
              "translation": "Rất vui được gặp bạn!"
            },
            {
              "id": 5,
              "sentence": "How's your day going?",
              "translation": "Ngày của bạn thế nào?"
            },
            {
              "id": 6,
              "sentence": "It's great to see you!",
              "translation": "Rất vui được gặp bạn!"
            },
            {
              "id": 7,
              "sentence": "Long time no see!",
              "translation": "Lâu không gặp!"
            },
            {
              "id": 8,
              "sentence": "What have you been up to?",
              "translation": "Bạn đã làm gì trong thời gian qua?"
            }
          ]
        },
        {
          "id": 2,
          "name": "Farewells",
          "imageUrl": "https://example.com/farewells.jpg",
          "sentences": [
            {
              "id": 9,
              "sentence": "Goodbye, see you later!",
              "translation": "Tạm biệt, hẹn gặp lại!"
            },
            {
              "id": 10,
              "sentence": "Take care!",
              "translation": "Bảo trọng nhé!"
            }
          ]
        }
      ]
    },
    {
      "id": 2,
      "name": "Travel",
      "subSentenceTopics": [
        {
          "id": 3,
          "name": "At the Airport",
          "imageUrl": "https://example.com/airport.jpg",
          "sentences": [
            {
              "id": 11,
              "sentence": "Where is the check-in counter?",
              "translation": "Quầy làm thủ tục ở đâu?"
            },
            {
              "id": 12,
              "sentence": "I would like to check in, please.",
              "translation": "Tôi muốn làm thủ tục lên máy bay."
            }
          ]
        },
        {
          "id": 4,
          "name": "On the Plane",
          "imageUrl": "https://example.com/plane.jpg",
          "sentences": [
            {
              "id": 13,
              "sentence": "Can I have a window seat, please?",
              "translation": "Tôi có thể ngồi ghế gần cửa sổ được không?"
            },
            {
              "id": 14,
              "sentence": "How long is the flight?",
              "translation": "Chuyến bay sẽ kéo dài bao lâu?"
            }
          ]
        }
      ]
    }
  ]
  ''';
}

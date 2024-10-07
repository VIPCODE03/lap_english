
class Example {
  static String getExampleVocabulary() {
    const data = '''
    [
      {
        "id": 1,
        "name": "Động vật",
        "subTopics": [
          {
            "id": 1,
            "name": "Động vật có vú", 
            "imageUrl": "https://i.pinimg.com/736x/5a/08/ac/5a08ac4f376d04d4e7570ee9585c2b12.jpg",
            "words": [
              {
                "id": 1,
                "word": "Cow",
                "meaning": "Con bò",
                "pronounceUK": "kaʊ",
                "pronounceUS": "kaʊ",
                "type": "noun",
                "level": "A1",
                "examples": [
                  "The cow is grazing in the field.",
                  "We get milk from cows."
                ]
              },
              {
                "id": 2,
                "word": "Sheep", 
                "meaning": "Con cừu",
                "pronounceUK": "ʃiːp",
                "pronounceUS": "ʃiːp",
                "type": "noun",
                "level": "A2",
                "examples": [
                  "The sheep are being herded into the barn.",
                  "We use sheep wool to make clothes."
                ]
              }
            ]
          }
        ]
      },
      {
        "id": 2,
        "name": "Giao thông", 
        "subTopics": [
          {
            "id": 2,
            "name": "Phương tiện đường bộ", 
            "imageUrl": "https://i.pinimg.com/736x/5a/08/ac/5a08ac4f376d04d4e7570ee9585c2b12.jpg",
            "words": [
              {
                "id": 3,
                "word": "Car",
                "meaning": "Ô tô",
                "pronounceUK": "kɑː",
                "pronounceUS": "kɑːr",
                "type": "noun",
                "level": "A1",
                "examples": [
                  "She drives a red car.",
                  "Cars are faster than bicycles."
                ]
              },
            ]
          }
        ]
      }
    ]
    ''';
    return data;
  }
}

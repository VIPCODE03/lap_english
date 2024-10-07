import 'package:flutter/material.dart';
import '../services/bot.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('FutureBuilder Example')),
        body: Center(
          child: FutureBuilder<String>(
            future: create(), // Gọi hàm create() tại đây
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator(); // Hiển thị loading
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}'); // Hiển thị lỗi
              } else if (snapshot.hasData) {
                String data = snapshot.data ?? '';
                // Nếu chuỗi dài hơn 100 ký tự, chia thành danh sách
                if (data.length > 100) {
                  List<String> lines = splitStringIntoChunks(data, 100);
                  return ListView.builder(
                    itemCount: lines.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(lines[index]),
                      );
                    },
                  );
                } else {
                  return Text('Result: ${data}');
                }
              }
              return Container(); // Trường hợp không có dữ liệu
            },
          ),
        ),
      ),
    );
  }

  // Hàm chia chuỗi thành các đoạn ngắn
  List<String> splitStringIntoChunks(String str, int chunkSize) {
    List<String> chunks = [];
    for (var i = 0; i < str.length; i += chunkSize) {
      chunks.add(str.substring(i, i + chunkSize > str.length ? str.length : i + chunkSize));
    }
    return chunks;
  }

  Future<String> create() async {
    GeminiAI gemini = GeminiAI(model: GeminiAI.flash);
    String jsonString = await gemini.ask(createW()) ?? '';
    print(jsonString);
    return jsonString;
  }
}

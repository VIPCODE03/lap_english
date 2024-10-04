import 'package:flutter/material.dart';
import 'package:lap_english/ui/screens/learn_screen/vocabulary/menu_screen.dart';
import 'package:lap_english/ui/widgets/other/expandable_view.dart';



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GridPage(),
    );
  }
}

class GridPage extends StatefulWidget {
  @override
  _GridPageState createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> {
  double _expandedHeight = 100.0; // Chiều cao mặc định
  int? _expandedIndex; // Chỉ số của item đang mở rộng

  void _toggleExpand(int index) {
    setState(() {
      if (_expandedIndex == index) {
        _expandedIndex = null; // Đóng item nếu đã mở
      } else {
        _expandedIndex = index; // Mở item mới
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = [Colors.red, Colors.green, Colors.blue, Colors.orange, Colors.purple];

    return Scaffold(
      appBar: AppBar(title: Text('Grid View Animation')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _toggleExpand(index),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: _expandedIndex == index ? 300 : _expandedHeight,
              color: colors[index],
              margin: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Item $index',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}



class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return ExpandedView(
                  expand: const MenuVocabularyScreen(),
                  child: Container(
                    child: Text("ahihi"
                    ),
                  )
              );
            }
        ),
      )
    );
  }
}

void main() {
  String input = "hello <Linda>, how are you.";
  Map<String, bool> resultMap = parseStringToMap(input);

  print(resultMap);
}

Map<String, bool> parseStringToMap(String input) {
  Map<String, bool> result = {};

  // Tách chuỗi bằng cách sử dụng biểu thức chính quy
  final regex = RegExp(r'<(.*?)>|(\S+)');
  Iterable<Match> matches = regex.allMatches(input);

  for (var match in matches) {
    // Kiểm tra xem match có nằm trong dấu < >
    String? matchedString = match.group(0);
    if (matchedString != null) {
      // Nếu có dấu < >, thì true
      if (matchedString.startsWith('<') && matchedString.endsWith('>')) {
        result[matchedString.substring(1, matchedString.length - 1)] = true;
      } else {
        // Nếu không, thì false
        result[matchedString] = false;
      }
    }
  }

  return result;
}

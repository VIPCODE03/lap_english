import 'package:flutter/material.dart';

class HorizontalReorderableList extends StatefulWidget {
  @override
  _HorizontalReorderableListState createState() =>
      _HorizontalReorderableListState();
}

class _HorizontalReorderableListState extends State<HorizontalReorderableList> {
  final List<String> items = ["A", "B", "C", "D", "E", "X", "F", "H", "Ư"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reorderable Horizontal List"),
      ),
      body: Container(
        height: 66,
        child: ReorderableListView.builder(
          scrollDirection: Axis.horizontal, // Kéo theo chiều ngang
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ReorderableDragStartListener(
              key: ValueKey(items[index]), // Key bắt buộc
              index: index,
              child: Container(
                width: 66, // Tăng kích thước toàn bộ widget
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: Text(
                  items[index],
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            );
          },
          onReorder: (int oldIndex, int newIndex) {
            setState(() {
              if (newIndex > oldIndex) {
                newIndex -= 1;
              }
              final item = items.removeAt(oldIndex);
              items.insert(newIndex, item);
            });
          },
        ),
      )
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HorizontalReorderableList(),
    );
  }
}

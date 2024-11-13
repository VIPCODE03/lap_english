import 'package:flutter/material.dart';
import 'package:lap_english/ui/widgets/other/button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Item Builder App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ItemBuilderScreen(),
    );
  }
}

class ItemBuilderScreen extends StatefulWidget {
  const ItemBuilderScreen({super.key});

  @override
  _ItemBuilderScreenState createState() => _ItemBuilderScreenState();
}

class _ItemBuilderScreenState extends State<ItemBuilderScreen> {
  final List<String> _items = ["Item 1", "Item 2", "Item 3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: WdgButton(
            onTap: () {},
            buttonFit: ButtonFit.scaleDown,
            color: Colors.grey,
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              height: 150,
              width: 150,
              child: Column(
                children: [
                  Image.network(
                      'https://cdn2.fptshop.com.vn/unsafe/1920x0/filters:quality(100)/2024_2_14_638435298339893729_bakground-hoat-hinh.jpg',
                      fit: BoxFit.cover, // Điều chỉnh BoxFit theo nhu cầu (e.g., cover, contain)
                  ),

                  const Text('ahihi')
                ],
              ),
            )
        )
      ),
    );
  }
}

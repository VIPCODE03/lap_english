import 'package:flutter/material.dart';
import 'package:lap_english/ui/screens/learn_screen/vocabulary/menu_screen.dart';

class ExpandableView extends StatefulWidget {
  const ExpandableView({super.key});

  @override
  _ExpandableViewState createState() => _ExpandableViewState();
}

class _ExpandableViewState extends State<ExpandableView> {
  bool _isExpanded = false;

  _ExpandableViewState();

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
          onTap: _toggleExpand,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastEaseInToSlowEaseOut,
            height: _isExpanded ? MediaQuery.of(context).size.height : 200,
            decoration: BoxDecoration(
              color: _isExpanded ? Colors.blue : Colors.green,
              borderRadius: BorderRadius.circular(_isExpanded ? 0 : 20),
            ),
            child: _isExpanded ? MenuVocabularyScreen() : Center(child: Text("Click vào đây"))
          ),
        ),
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
      title: 'Slide Transition Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Di chuyển đến màn hình thứ hai với hiệu ứng
            Navigator.of(context).pushReplacement(_createRoute());
          },
          child: Text('Go to Second Screen'),
        ),
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SecondScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // Bắt đầu từ bên phải
        const end = Offset.zero; // Kết thúc tại vị trí ban đầu
        const curve = Curves.fastLinearToSlowEaseIn; // Hiệu ứng chuyển động

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
      transitionDuration: Duration(milliseconds: 500), // Thời gian chuyển tiếp
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Quay lại màn hình trước với hiệu ứng
            Navigator.of(context).pop();
          },
          child: Text('Back to First Screen'),
        ),
      ),
    );
  }
}


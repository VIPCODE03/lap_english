import 'package:flutter/material.dart';
import 'package:lap_english/ui/screens/learn_screen/learn_vocabulay_screen.dart';

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
            child: _isExpanded ? LearnVocabularyScreen() : Center(child: Text("Click vào đây"))
          ),
        ),
    );
  }
}

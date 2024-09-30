import 'package:flutter/material.dart';

class MainTopic extends StatefulWidget {
  final Widget child;
  final Widget expand;

  const MainTopic(
      {super.key, required this.child, required this.expand});

  @override
  ExpandableViewState createState() => ExpandableViewState();
}

class ExpandableViewState extends State<MainTopic> {
  bool _isExpanded = false;

  ExpandableViewState();

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
            width: MediaQuery.of(context).size.width,
            height: _isExpanded ? MediaQuery.of(context).size.height : 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(_isExpanded ? 0 : 20),
            ),
            child: _isExpanded ? widget.expand : widget.child
        ),
      ),
    );
  }
}

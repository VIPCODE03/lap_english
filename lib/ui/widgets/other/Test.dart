import 'package:flutter/material.dart';

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
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: _toggleExpand,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastEaseInToSlowEaseOut,
            width: _isExpanded ? MediaQuery.of(context).size.width : 200,
            height: _isExpanded ? MediaQuery.of(context).size.height : 200,
            decoration: BoxDecoration(
              color: _isExpanded ? Colors.blue : Colors.green,
              borderRadius: BorderRadius.circular(_isExpanded ? 0 : 20),
            ),
            child: Center(
              child: Text(
                _isExpanded ? 'Close' : 'Open',
                style: const TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

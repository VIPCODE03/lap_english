import 'package:flutter/material.dart';

class ExpandableView extends StatefulWidget {
  final double maxHeight;
  final double maxWight;

  const ExpandableView({
    super.key,
    required this.maxHeight,
    required this.maxWight
  });

  @override
  _ExpandableViewState createState() => _ExpandableViewState(maxHeight, maxWight);
}

class _ExpandableViewState extends State<ExpandableView> {
  bool _isExpanded = false;
  final double maxHeight;
  final double maxWight;

  _ExpandableViewState(this.maxHeight, this.maxWight);

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
            width: _isExpanded ? maxWight : 200,
            height: _isExpanded ? maxHeight : 200,
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

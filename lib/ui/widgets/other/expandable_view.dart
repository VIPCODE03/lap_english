import 'package:flutter/material.dart';

class ExpandedView extends StatefulWidget {
  final Widget child;
  final Widget expand;

  const ExpandedView({super.key, required this.child, required this.expand});

  @override
  ExpandableViewState createState() => ExpandableViewState();
}

class ExpandableViewState extends State<ExpandedView> with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 300), vsync: this);
  }

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
      _isExpanded ? _controller.forward() : _controller.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: _toggleExpand,
        child: Column(
          children: [
            _isExpanded ? SizeTransition(
              sizeFactor: CurvedAnimation(
                parent: _controller,
                curve: Curves.elasticOut,
              ),
              child: widget.expand, //->  Hiển thị nội dung mở rộng
            )
                : widget.child, //->  Hiển thị nội dung chính
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget Kéo Từ Trên Xuống'),
      ),
      body: PullDownHeader(
        header: Container(
          height: 100,
          color: Colors.red,
          child: Center(
            child: Text(
              'Widget Header',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        child: ListView.builder(
          itemCount: 50,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Item $index'),
            );
          },
        ),
      ),
    );
  }
}

class PullDownHeader extends StatefulWidget {
  final Widget header; // Widget phía trên có thể kéo xuống
  final Widget child; // Widget con có thể cuộn (ListView, SingleChildScrollView, v.v.)

  const PullDownHeader({
    Key? key,
    required this.header,
    required this.child,
  }) : super(key: key);

  @override
  _PullDownHeaderState createState() => _PullDownHeaderState();
}

class _PullDownHeaderState extends State<PullDownHeader> with SingleTickerProviderStateMixin {
  double headerOffset = -100; // Vị trí của widget header (ra ngoài màn hình) ban đầu
  double dragDistance = 0.0; // Khoảng cách người dùng đã vuốt
  double maxDragDistance = 150; // Khoảng cách tối đa để widget header xuất hiện
  late AnimationController _animationController;
  bool isDragging = false; // Xác định trạng thái vuốt
  bool isAtTop = true; // Biến kiểm tra widget con (ListView, v.v.) có đang ở đầu hay không
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    // Tạo ScrollController để theo dõi vị trí của widget con (child)
    _scrollController = ScrollController();

    // Lắng nghe sự kiện cuộn của widget con
    _scrollController.addListener(() {
      // Kiểm tra xem cuộn có đang ở đầu (offset == 0)
      if (_scrollController.offset <= 0) {
        setState(() {
          isAtTop = true;
        });
      } else {
        setState(() {
          isAtTop = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _resetHeaderPosition() {
    // Tự động đưa widget header về vị trí ban đầu
    _animationController.forward(from: 0.0).then((_) {
      setState(() {
        headerOffset = -100; // Đưa widget header trở lại vị trí ban đầu
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerMove: (PointerMoveEvent event) {
        // Chỉ cho phép kéo khi cuộn ở đầu (isAtTop == true)
        if (event.delta.dy > 0 && isAtTop) {
          setState(() {
            isDragging = true;
            dragDistance += event.delta.dy;
            if (dragDistance > maxDragDistance) {
              dragDistance = maxDragDistance;
            }
            headerOffset = dragDistance - 100;
          });
        }
      },
      onPointerUp: (PointerUpEvent event) {
        if (isDragging) {
          setState(() {
            isDragging = false;
            dragDistance = 0.0;
          });
          _resetHeaderPosition();
        }
      },
      child: Stack(
        children: [
          // Widget con (ListView, SingleChildScrollView, v.v.)
          Positioned.fill(
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: widget.child,
                )
              ],
            ),
          ),

          // Widget header di chuyển từ trên xuống
          Positioned(
            left: 0,
            right: 0,
            top: headerOffset,
            child: widget.header,
          ),
        ],
      ),
    );
  }
}

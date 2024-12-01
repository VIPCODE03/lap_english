import 'package:flutter/material.dart';

class ResponsiveContainerInRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.blue,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    double containerWidth = constraints.maxWidth;
                    double containerHeight = constraints.maxHeight;

                    return Center(
                      child: Text(
                        'Width: ${containerWidth.toStringAsFixed(1)}\nHeight: ${containerHeight.toStringAsFixed(1)}',
                        style: TextStyle(
                          fontSize: containerWidth * 0.05, // Điều chỉnh kích thước text dựa vào chiều rộng
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.red,
                child: Center(
                  child: Text(
                    'Another Expanded',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ResponsiveContainerInRow(),
  ));
}

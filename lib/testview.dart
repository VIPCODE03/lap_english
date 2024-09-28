import 'package:flutter/material.dart';
import 'package:lap_english/constant/AssetsConstant.dart';

class aaaa extends StatelessWidget {
  final List<_MenuItem> menuItems = [
    _MenuItem(imagePath: "${AssetsConstant.directoryImageMenu}grammar.gif", label: "Home"),
    _MenuItem(imagePath: "${AssetsConstant.directoryImageMenu}grammar.gif", label: "Settings"),
    _MenuItem(imagePath: "${AssetsConstant.directoryImageMenu}grammar.gif", label: "Profile"),
    _MenuItem(imagePath: "${AssetsConstant.directoryImageMenu}grammar.gif", label: "Notifications"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu with 2 Rows'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          scrollDirection: Axis.horizontal,
          crossAxisCount: 1, // 2 items per row
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: menuItems.map((item) => buildMenuItem(item)).toList(),
        ),
      ),
    );
  }

  // Hàm xây dựng từng mục menu
  Widget buildMenuItem(_MenuItem item) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Ảnh bên trong hình tròn
          CircleAvatar(
            radius: 40, // Kích thước hình tròn
            backgroundColor: Colors.blue.shade100, // Màu nền cho hình tròn
            child: ClipOval( // Dùng ClipOval để bo tròn ảnh
              child: Image.asset(
                item.imagePath, // Đường dẫn ảnh truyền vào
                fit: BoxFit.cover,
                width: 60, // Chiều rộng của ảnh
                height: 60, // Chiều cao của ảnh
              ),
            ),
          ),
          const SizedBox(height: 10), // Khoảng cách giữa ảnh và văn bản
          // Văn bản nhãn
          Text(
            item.label,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class _MenuItem {
  final String imagePath;
  final String label;

  _MenuItem({required this.imagePath, required this.label});
}

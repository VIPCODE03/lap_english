
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class ImageFile {
  Future<String> saveImageToInternalStorage(File imageFile) async {
    try {
      // Lấy thư mục nội bộ của ứng dụng
      final directory = await getApplicationDocumentsDirectory();

      // Tạo đường dẫn đầy đủ cho tệp ảnh mới
      String imagePath = '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.png';

      // Tạo một tệp mới
      final File newImage = await imageFile.copy(imagePath);

      // Trả về đường dẫn của tệp ảnh mới
      return newImage.path;
    } catch (e) {
      // Nếu có lỗi, trả về chuỗi lỗi
      return 'Error: $e';
    }
  }

}
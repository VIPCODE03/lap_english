
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class ImageFile {

  /*  Lưu ảnh vào tệp hệ thống  */
  static Future<String> saveImage(File imageFile, String directoryName) async {
    try {
      //--- Lấy đường dẫn thư mục ứng dụng  ---
      final directory = await getApplicationDocumentsDirectory();

      //--- Tạo đường dẫn đầy đủ cho thư mục mới  ---
      final Directory newDirectory = Directory('${directory.path}/$directoryName');

      //--- Tạo thư mục nếu chưa tồn tại  ---
      if (!await newDirectory.exists()) {
        await newDirectory.create(recursive: true);
      }

      //--- Tạo đường dẫn đầy đủ cho tệp ảnh mới  ---
      String imagePath = '${newDirectory.path}/${DateTime.now().millisecondsSinceEpoch}.png';

      //--- Lưu ảnh vào thư mục ---
      final File newImage = await imageFile.copy(imagePath);

      //--- Trả về đường dẫn của tệp ảnh đã lưu ---
      return newImage.path;

    } catch (e) {
      return 'Error: $e';
    }
  }

}

import 'package:lap_english/constant/assets_constant.dart';

class AssetsUtil {
  static String getLogoImage(String fileName) {
    return "${AssetsConstant.directoryImageLogo}$fileName";
  }

  static String getCoverImage(String fileName) {
    return "${AssetsConstant.directoryImageCover}$fileName";
  }

  static String getItemImage(String fileName) {
    return "${AssetsConstant.directoryImageItem}$fileName";
  }

  static String getMenuImage(String fileName) {
    return "${AssetsConstant.directoryImageMenu}$fileName";
  }
}
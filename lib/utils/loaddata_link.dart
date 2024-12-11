
import 'package:lap_english/data/database/remote/api/api.dart';

class LoadDataUtil {
  static String loadImage(String nameUrl) {
    return '${ApiBase.dataOther}$nameUrl';
  }

  static String loadSound(String soundUrl) {
    return '${ApiBase.dataOther}$soundUrl';
  }
}
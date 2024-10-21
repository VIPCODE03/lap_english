import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  // Phương thức để lấy dữ liệu từ API
  Future<List<dynamic>> fetchData(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'));

    if (response.statusCode == 200) {
      // Chuyển đổi JSON response thành List
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}

import 'package:lap_english/services/bot.dart';

void main() async {
  GeminiAI AI = GeminiAI(model: GeminiAI.flash);
  String suggest = await AI.ask(
      'Đây là ứng dụng học tiếng Anh. Model sẽ có nhiệm vụ phân tích chủ đề từ backend và '
          'trả về frontend các chủ đề phù hợp với từng user. Cụ thể như sau: Model sẽ nhận được danh sách chủ đề với 2 cột id - name: Ví dụ 1-Động vật, 2-Công nghệ, 5-Mua sắm, 9-Trái cây v.v... Lúc này model sẽ phân tích và trả '
          'về 1 loại danh sách id của các chủ đề và trả về các id liên quan đến các thuộc tính của user.'
          'Hãy trả về dạng String danh sách id với dấu phẩy phân cách. Ví dụ: 1, 2, 9 '
          'Và không giải thích gì thêm. '
          'Danh sách chủ đề: '
          '1-Giao tiếp cơ bản, 2-Chào hỏi và tạm biệt, 3-Tự giới thiệu bản thân, 4-Hỏi thăm sức khỏe, '
          '5-Mô tả ngoại hình, 6-Mô tả tính cách, 7-Cảm xúc và tâm trạng, 8-Thành viên gia đình, '
          '9-Bạn bè và mối quan hệ, 10-Lịch và thời gian, 11-Thời tiết và các mùa, 12-Địa điểm và phương hướng, '
          '13-Phương tiện giao thông, 14-Mua sắm hàng hóa, 15-Đi chợ và nấu ăn, 16-Nhà hàng và quán cà phê, '
          '17-Chỗ ở, 18-Văn phòng và công việc, 19-Phỏng vấn xin việc, 20-Họp và thuyết trình, '
          '21-Email và giao tiếp trực tuyến, 22-Học tập và trường học, 23-Các môn học phổ biến, 24-Thi cử và bài tập, '
          '25-Hoạt động ngoại khóa, 26-Thể thao và thể dục, 27-Âm nhạc và nhạc cụ, 28-Phim ảnh và truyền hình, '
          '29-Sách và văn học, 30-Nghệ thuật và tranh ảnh, 31-Du lịch trong nước, 32-Du lịch nước ngoài, '
          '33-Sân bay và hành lý, 34-Lịch trình du lịch, 35-Địa danh nổi tiếng, 36-Văn hóa địa phương, '
          '37-Tình huống khẩn cấp, 38-Sức khỏe và bệnh tật, 39-Bộ phận cơ thể, 40-Chế độ ăn uống lành mạnh, '
          '41-Các loại đồ uống, 42-Lễ hội và sự kiện quốc tế, 43-Lễ hội truyền thống Việt Nam, '
          '44-Lịch sử và nhân vật nổi tiếng, 45-Môi trường và bảo vệ thiên nhiên, 46-Công nghệ và Internet, '
          '47-Mạng xã hội và giao tiếp trực tuyến, 48-Game và giải trí điện tử, 49-Ngân hàng và tài chính cá nhân, '
          '50-Các dịch vụ công cộng '
          'Thuộc tính user: '
          '- Tuổi: 20 '
          '- Sở thích: Đọc sách '
          '- Nghề nghiệp: Lập trình viên '
          '- Chủ đề quan tâm: Sức khỏe, Công nghệ, Giao tiếp') ?? '';

  List<int> result = suggest.split(',') // Tách chuỗi bằng dấu ','
      .map((e) => int.parse(e.trim())) // Loại bỏ khoảng trắng và chuyển thành số nguyên
      .toList(); // Chuyển thành danh sách

  print(result); // Kết quả: [1, 2, 3]
}

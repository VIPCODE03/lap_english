import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lap_english/ui/colors/vip_colors.dart';
import 'package:lap_english/ui/themes/size.dart';
import 'package:lap_english/ui/widgets/other/group.dart';

class WdgRowTip extends StatefulWidget {
  const WdgRowTip({super.key});

  @override
  State<StatefulWidget> createState() => _WdgRowTip();
}

class _WdgRowTip extends State<WdgRowTip> {
  String tip = 'Loading...';
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startRepeatingTip();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startRepeatingTip() {
    _timer = Timer.periodic(
      const Duration(seconds: 15),
          (timer) => _newTip(),
    );
  }

  void _newTip() {
    setState(() {
      tip = _englishTips(Random().nextInt(58));
    });
  }

  @override
  Widget build(BuildContext context) {
    return WdgGroup(
      child: Container(
        height: 120,
        width: maxWidth,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: VipColors.onPrimary(context).withOpacity(0.06)
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 666),
          transitionBuilder: (child, animation) => FadeTransition(opacity: animation, child: child),
          child: Text(
            tip,
            key: ValueKey<String>(tip),
            style: TextStyle(
              fontSize: textSize.normal,
              fontWeight: FontWeight.bold,
              color: VipColors.getRandomColor(context, 6),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

String _englishTips(int index) => [
  "Có thể viết 'that is' thành 'that's' nhưng không thể viết 'this is' thành 'this's'.",
  "Danh từ không đếm được như 'water' hay 'information' không dùng với 'a' hoặc 'an'.",
  "'Fewer' dùng cho danh từ đếm được, còn 'less' dùng cho danh từ không đếm được.",
  "Không bao giờ dùng 'an' trước từ bắt đầu bằng phụ âm, ví dụ: 'an apple' nhưng 'a banana'.",
  "Trong câu điều kiện loại 2, dùng 'were' thay vì 'was' cho tất cả các chủ ngữ.",
  "Đừng nhầm lẫn 'your' (của bạn) với 'you're' (bạn là).",
  "'Its' (của nó) khác với 'it's' (nó là hoặc nó đã).",
  "Không dùng 'very' với từ đã mang tính cực đoan, ví dụ: 'very perfect' là sai.",
  "Dùng 'whom' thay vì 'who' khi nó là tân ngữ trong câu.",
  "Không dùng 'the' trước danh từ chỉ tên riêng trừ một số ngoại lệ như 'the Nile', 'the USA'.",
  "'I' luôn viết hoa, bất kể vị trí trong câu.",
  "'Me' không dùng làm chủ ngữ trong câu, thay vào đó dùng 'I'.",
  "'Will' dùng cho tương lai đơn, còn 'would' dùng cho điều kiện hoặc lịch sự.",
  "Khi nói về thời gian trong quá khứ dùng 'used to', không dùng 'use to'.",
  "'Advice' (lời khuyên) là danh từ không đếm được, còn 'advices' là sai.",
  "'Practice' (luyện tập) là danh từ và 'practise' là động từ trong Anh-Anh, nhưng cả hai đều là 'practice' trong Anh-Mỹ.",
  "'Effect' là danh từ, còn 'affect' là động từ.",
  "'Who' dùng để chỉ người làm chủ ngữ, còn 'whom' dùng khi người đó là tân ngữ.",
  "Thêm 's' hoặc 'es' để tạo danh từ số nhiều, nhưng không phải lúc nào cũng áp dụng (ví dụ: 'children', không phải 'childs').",
  "'Stationery' là văn phòng phẩm, còn 'stationary' nghĩa là đứng yên.",
  "Dùng 'on time' khi muốn nói đúng giờ, và 'in time' khi muốn nói kịp lúc.",
  "'Few' mang ý nghĩa tiêu cực (ít), còn 'a few' mang ý nghĩa tích cực (một vài).",
  "Không sử dụng 'double negative', ví dụ: 'I don’t have nothing' là sai.",
  "'Compliment' nghĩa là lời khen, còn 'complement' nghĩa là bổ sung.",
  "'Lie' nghĩa là nằm, còn 'lay' nghĩa là đặt nằm xuống.",
  "Động từ sau 'to' thường ở dạng nguyên thể, ngoại trừ một số từ như 'look forward to'.",
  "'Good' là tính từ, còn 'well' là trạng từ.",
  "Đừng nhầm lẫn 'loose' (lỏng lẻo) với 'lose' (mất).",
  "Khi viết email, đừng quên các từ chào hỏi như 'Dear' hoặc 'Hello'.",
  "Động từ ở thì hiện tại đơn thêm 's' khi chủ ngữ là ngôi thứ ba số ít.",
  "'Principle' nghĩa là nguyên tắc, còn 'principal' nghĩa là chính yếu hoặc hiệu trưởng.",
  "Không dùng 'too much' với danh từ đếm được, dùng 'too many' thay thế.",
  "'Accept' nghĩa là chấp nhận, còn 'except' nghĩa là ngoại trừ.",
  "'Weather' là thời tiết, còn 'whether' nghĩa là liệu rằng.",
  "'Affect' là động từ, còn 'effect' thường là danh từ.",
  "Không dùng 'do' hoặc 'does' trong câu khẳng định ở hiện tại đơn.",
  "Sử dụng dấu phẩy sau trạng từ dẫn đầu câu, ví dụ: 'However, ...'.",
  "'Can' nói về khả năng, còn 'may' nói về sự cho phép.",
  "Động từ sau 'let' luôn ở dạng nguyên thể, không thêm 'to'.",
  "Dùng 'much' với danh từ không đếm được, và 'many' với danh từ đếm được.",
  "'Each' được theo sau bởi động từ số ít.",
  "'Than' dùng trong so sánh, còn 'then' chỉ thời gian.",
  "Danh từ số ít đi với 'is', còn danh từ số nhiều đi với 'are'.",
  "'Between' dùng cho hai đối tượng, còn 'among' dùng cho ba hoặc nhiều hơn.",
  "'Rise' là tự động từ (tự tăng), còn 'raise' là ngoại động từ (tăng cái gì đó).",
  "Không dùng 'very unique', vì 'unique' đã mang tính tuyệt đối.",
  "'Do' dùng cho hành động chung, còn 'make' thường là tạo ra thứ gì đó.",
  "Thêm 'ly' để tạo trạng từ từ tính từ, nhưng không phải lúc nào cũng đúng ('friendly' là tính từ).",
  "'Farther' nói về khoảng cách vật lý, còn 'further' nói về khoảng cách trừu tượng.",
  "'Historic' là mang tính lịch sử quan trọng, còn 'historical' liên quan đến quá khứ.",
  "Không bao giờ dùng 'ain't' trong văn viết trang trọng.",
  "Khi nói về tương lai gần, có thể dùng 'be going to' thay cho 'will'.",
  "'Hear' là nghe, còn 'here' là ở đây.",
  "Không sử dụng 'more better', chỉ cần 'better'.",
  "'Bare' là trần trụi, còn 'bear' có nghĩa là chịu đựng hoặc con gấu.",
  "'Borrow' là mượn, còn 'lend' là cho mượn.",
  "Sử dụng 'because of' + danh từ/cụm danh từ, và 'because' + mệnh đề.",
  "Đừng nhầm lẫn 'elicit' (gợi ra) với 'illicit' (bất hợp pháp)."
].elementAt(index);

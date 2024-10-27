import 'package:flutter/material.dart';

class ResultDialog extends StatelessWidget {
  final String? answerCorrect;
  final bool isCorrect;
  final Function onContinue;

  const ResultDialog({
    super.key,
    required this.answerCorrect,
    required this.isCorrect,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          // Icon trạng thái (đúng/sai)
          Icon(
            isCorrect ? Icons.check_circle_outline : Icons.cancel_outlined,
            color: isCorrect ? Colors.green : Colors.red,
            size: 50,
          ),
          const SizedBox(height: 16),

          // Text hiển thị kết quả (đúng/sai)
          Text(
            isCorrect ? 'Chính xác!' : 'Chưa chính xác!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: isCorrect ? Colors.green : Colors.red,
            ),
          ),
          const SizedBox(height: 10),

          // Text hiển thị đáp án đúng
          Text(
            answerCorrect != null ? 'Đáp án đúng: $answerCorrect' : '',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),

          // Button tiếp tục
          Container(
            height: 50,
            width: 400,
            margin: const EdgeInsets.only(top: 20),
            child: ElevatedButton(
              onPressed: () {
                onContinue();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isCorrect ? Colors.green : Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text('Tiếp tục'),
            ),
          ),
        ],
      ),
    );
  }
}

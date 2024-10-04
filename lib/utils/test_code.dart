
import 'dart:math';

List<T> getRandomItems<T>(List<T> list, T existingItem, int count) {
  // Loại bỏ phần tử đã có để tránh trùng lặp
  List<T> availableItems = List.from(list)..remove(existingItem);

  // Shuffle danh sách và lấy 3 phần tử ngẫu nhiên
  availableItems.shuffle();
  return availableItems.take(count).toList();
}

void main() {
  List<String> fruits = ['Apple', 'Banana', 'Orange', 'Grapes', 'Pineapple'];
  String existingItem = 'Banana'; // Phần tử đã có

  // Lấy ngẫu nhiên 3 phần tử không trùng với existingItem
  List<String> randomFruits = getRandomItems(fruits, existingItem, 2);

  print(randomFruits);
}

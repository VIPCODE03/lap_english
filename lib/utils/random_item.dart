
List<T> take<T>(List<T> list, T existingItem, int count) {
  List<T> availableItems =
  List.from(list)..remove(existingItem);
  availableItems.shuffle();
  return availableItems.take(count).toList();
}

class User {
  late final int id;
  late final String name;
  final String email;
  final String password;
  late final int age;
  late final List<int> vocabularyTopicsLearned;
  late final List<int> sentenceTopicsLearned;
  late final List<int> grammarsLearned;

  User(
      this.id,
      this.name,
      this.email,
      this.password,
      this.age,
      this.vocabularyTopicsLearned,
      this.sentenceTopicsLearned,
      this.grammarsLearned);

  User.local(this.email, this.password);
}
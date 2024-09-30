
/*  Loại ngữ pháp   */
class TypeGrammar {
  int id;
  String name;
  List<Grammar> grammars;

  TypeGrammar(this.id, this.name, this.grammars);
}

/*  Ngữ pháp  */
class Grammar {
  int id;
  String name;
  String grammaticalStructure;
  String description;
  List<String> examples;

  Grammar(this.id, this.name, this.grammaticalStructure, this.description, this.examples);
}


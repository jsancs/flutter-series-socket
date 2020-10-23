class Serie {
  String id;
  String name;
  int votes;

  Serie({this.id, this.name, this.votes});

  factory Serie.fromMap(Map<String, dynamic> obj) => Serie(
        id: obj['id'],
        name: obj['name'],
        votes: obj['votes'],
      );
}

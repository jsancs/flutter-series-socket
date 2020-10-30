class Serie {
  String id;
  String name;
  int votes;

  Serie({this.id, this.name, this.votes});

  factory Serie.fromMap(Map<String, dynamic> obj) => Serie(
        id: obj.containsKey('id') ? obj['id'] : 'no-id',
        name: obj.containsKey('name') ? obj['name'] : 'no-name',
        votes: obj.containsKey('votes') ? obj['votes'] : 'no-votes',
      );
}

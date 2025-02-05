class CategoryT {
  int? id;
  String name;

  CategoryT({this.id, required this.name});

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name};
  }

  factory CategoryT.fromMap(Map<String, dynamic> map) {
    return CategoryT(id: map['id'], name: map['name']);
  }
}

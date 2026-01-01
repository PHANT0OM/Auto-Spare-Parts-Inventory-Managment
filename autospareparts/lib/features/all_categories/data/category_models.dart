class CategoryModels {
  int id;
  String name;

  CategoryModels({required this.id, required this.name});

  factory CategoryModels.fromJson(Map<String, dynamic> json) {
    return CategoryModels(id: json['id'], name: json['name']);
  }
}

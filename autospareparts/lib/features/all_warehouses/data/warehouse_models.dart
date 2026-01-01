class WarehouseModels {
  int id;
  String name;

  WarehouseModels({required this.id, required this.name});

  factory WarehouseModels.fromJson(Map<String, dynamic> json) {
    return WarehouseModels(id: json['id'], name: json['name']);
  }
}

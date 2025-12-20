class SupplierModels {
  int id;
  String name;
  String phone;

  SupplierModels({required this.id, required this.name, required this.phone});

  factory SupplierModels.fromJson(Map<String, dynamic> json) {
    return SupplierModels(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
    );
  }
}

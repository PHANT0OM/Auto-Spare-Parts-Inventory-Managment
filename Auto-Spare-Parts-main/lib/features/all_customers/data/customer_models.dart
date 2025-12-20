class CustomerModels {
  int id;
  String name;
  String phone;

  CustomerModels({required this.id, required this.name, required this.phone});

  factory CustomerModels.fromJson(Map<String, dynamic> json) {
    return CustomerModels(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
    );
  }
}

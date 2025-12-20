class Product {
  final int id;
  final String name;
  final String origin;
  final double cost;
  final double price;
  final int? categoryId;
  final int? supplierId;

  Product({
    required this.id,
    required this.name,
    required this.origin,
    required this.cost,
    required this.price,
    this.categoryId,
    this.supplierId,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      origin: json['origin'],
      cost: double.tryParse(json['cost'].toString()) ?? 0.0,
      price: double.tryParse(json['price'].toString()) ?? 0.0,
      categoryId: json['category_id'],
      supplierId: json['supplier_id'],
    );
  }
}

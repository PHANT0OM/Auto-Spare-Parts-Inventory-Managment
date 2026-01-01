class StockModels {
  int productid;
  int warehouseid;
  int quantity;
  String productName;
  String warehouseName;

  StockModels({
    required this.productid,
    required this.warehouseid,
    required this.quantity,
    required this.productName,
    required this.warehouseName,
  });

  factory StockModels.fromJson(Map<String, dynamic> json) {
    return StockModels(
      productid: json['productid'] ?? 0,
      warehouseid: json['name'] ?? 0,
      quantity: json['quantity'] ?? 0,
      productName: json['product_name'] ?? 'unknown product',
      warehouseName: json['warehouse_name'] ?? 'unknown warehouse',
    );
  }
}

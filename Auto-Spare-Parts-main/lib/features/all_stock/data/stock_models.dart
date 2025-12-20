class StockModels {
  int productid;
  int warehouseid;
  int quantity;

  StockModels({
    required this.productid,
    required this.warehouseid,
    required this.quantity,
  });

  factory StockModels.fromJson(Map<String, dynamic> json) {
    return StockModels(
      productid: json['productid'],
      warehouseid: json['name'],
      quantity: json['quantity'],
    );
  }
}

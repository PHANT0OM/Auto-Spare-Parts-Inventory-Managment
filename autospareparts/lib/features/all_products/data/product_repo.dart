import 'package:auto_space/features/all_products/data/product_models.dart';
import 'package:auto_space/core/network/api_services.dart';

abstract class ProductRepository {
  Future<List<Product>> fetchProducts();
}

class ProductRepositoryImpl implements ProductRepository {
  final ProductApiService apiServices;

  ProductRepositoryImpl({required this.apiServices});

  @override
  Future<List<Product>> fetchProducts() async {
    try {
      final products = await apiServices.getProducts();

      return products;
    } catch (e) {
      rethrow;
    }
  }
}

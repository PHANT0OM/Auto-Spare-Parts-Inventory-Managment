import 'package:auto_space/core/network/api_exceptions.dart';
import 'package:auto_space/core/network/dio_client.dart';
import 'package:auto_space/features/all_categories/data/category_models.dart';
import 'package:auto_space/features/all_customers/data/customer_models.dart';
import 'package:auto_space/features/all_products/data/product_models.dart';
import 'package:auto_space/features/all_stock/data/stock_models.dart';
import 'package:auto_space/features/all_suppliers/data/supplier_models.dart';
import 'package:auto_space/features/all_warehouses/data/warehouse_models.dart';
import 'package:dio/dio.dart';

class ProductApiService {
  final DioClient dioClient = DioClient();

  Future<List<Product>> getProducts() async {
    try {
      final response = await dioClient.dio.get("/apiV4/Products/ReadProducts");
      final List data = response.data;
      return data.map((e) => Product.fromJson(e)).toList();
    } on DioException catch (e) {
      throw ApiExceptions.getApiException(e);
    } catch (e) {
      throw ApiExceptions.getApiException("Unknown error occurred: $e");
    }
  }

  Future<void> createProduct(Map<String, dynamic> productData) async {
    try {
      await dioClient.dio.post(
        "http://127.0.0.1:8000/apiV4/Products/CreateProducts",
        data: productData,
      );
    } on DioException catch (e) {
      throw ApiExceptions.getApiException(e);
    } catch (e) {
      throw ApiExceptions.getApiException("Unknown error: $e");
    }
  }
}

class CategoryApiService {
  final DioClient dioClient = DioClient();

  Future<List<CategoryModels>> getcategories() async {
    try {
      final response = await dioClient.dio.get(
        "/apiV4/Categories/ReadCategories",
      );

      final List data = response.data;

      return data.map((e) => CategoryModels.fromJson(e)).toList();
    } on DioException catch (e) {
      throw ApiExceptions.getApiException(e);
    } catch (e) {
      throw ApiExceptions.getApiException("Unknown error occurred: $e");
    }
  }
}

class SupplierApiService {
  final DioClient dioClient = DioClient();
  Future<List<SupplierModels>> getsuppliers() async {
    try {
      final response = await dioClient.dio.get(
        "/apiV4/Suppliers/ReadSuppliers",
      );

      final List data = response.data;

      return data.map((e) => SupplierModels.fromJson(e)).toList();
    } on DioException catch (e) {
      throw ApiExceptions.getApiException(e);
    } catch (e) {
      throw ApiExceptions.getApiException("Unknown error occurred: $e");
    }
  }

  Future<void> createsupplier(Map<String, dynamic> supplierData) async {
    try {
      await dioClient.dio.post(
        "/apiV4/Suppliers/CreateSupplier",
        data: supplierData,
      );
    } on DioException catch (e) {
      throw ApiExceptions.getApiException(e);
    } catch (e) {
      throw ApiExceptions.getApiException("Unknown error: $e");
    }
  }
}

class WarehouseApiService {
  final DioClient dioClient = DioClient();
  Future<List<WarehouseModels>> getwarehouses() async {
    try {
      final response = await dioClient.dio.get(
        "/apiV4/Warehouses/ReadWarehouses",
      );

      final List data = response.data;

      return data.map((e) => WarehouseModels.fromJson(e)).toList();
    } on DioException catch (e) {
      throw ApiExceptions.getApiException(e);
    } catch (e) {
      throw ApiExceptions.getApiException("Unknown error occurred: $e");
    }
  }

  Future<void> createwarehouse(Map<String, dynamic> warehouseData) async {
    try {
      await dioClient.dio.post(
        "/apiV4/Warehouses/CreateWarehouse",
        data: warehouseData,
      );
    } on DioException catch (e) {
      throw ApiExceptions.getApiException(e);
    } catch (e) {
      throw ApiExceptions.getApiException("Unknown error: $e");
    }
  }
}

class StockApiService {
  final DioClient dioClient = DioClient();
  Future<void> createstock(Map<String, dynamic> stockData) async {
    try {
      await dioClient.dio.post("/apiV4/Stock/CreateStock", data: stockData);
    } on DioException catch (e) {
      throw ApiExceptions.getApiException(e);
    } catch (e) {
      throw ApiExceptions.getApiException("Unknown error: $e");
    }
  }

  Future<List<StockModels>> getstock() async {
    try {
      final response = await dioClient.dio.get("/apiV4/Stock/ReadStock");

      final List data = response.data;

      return data.map((e) => StockModels.fromJson(e)).toList();
    } on DioException catch (e) {
      throw ApiExceptions.getApiException(e);
    } catch (e) {
      throw ApiExceptions.getApiException("Unknown error occurred: $e");
    }
  }

  Future<void> updateStock(int id, int newQuantity) async {
    try {
      final Map<String, dynamic> data = {"quantity": newQuantity};

      await dioClient.dio.put("/apiV4/Stock/UpdateStock/$id", data: data);
    } on DioException catch (e) {
      throw ApiExceptions.getApiException(e);
    } catch (e) {
      throw ApiExceptions.getApiException("Unknown error: $e");
    }
  }
}

class CustomerApiService {
  final DioClient dioClient = DioClient();
  Future<List<CustomerModels>> getCustomers() async {
    try {
      final response = await dioClient.dio.get("/apiV4/Customers/CustomerRead");

      final List data = response.data;

      return data.map((e) => CustomerModels.fromJson(e)).toList();
    } on DioException catch (e) {
      throw ApiExceptions.getApiException(e);
    } catch (e) {
      throw ApiExceptions.getApiException("Unknown error occurred: $e");
    }
  }

  Future<void> createcustomer(Map<String, dynamic> customerData) async {
    try {
      await dioClient.dio.post(
        "/apiV4/Customers/CreateCustomer",
        data: customerData,
      );
    } on DioException catch (e) {
      throw ApiExceptions.getApiException(e);
    } catch (e) {
      throw ApiExceptions.getApiException("Unknown error: $e");
    }
  }
}

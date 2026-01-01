import 'package:auto_space/features/all_suppliers/data/supplier_models.dart';

import 'package:auto_space/core/network/api_services.dart';

abstract class SupplierRepository {
  Future<List<SupplierModels>> fetchSuppliers();
}

class SupplierRepositoryImpl implements SupplierRepository {
  final SupplierApiService apiService;

  SupplierRepositoryImpl({required this.apiService});

  @override
  Future<List<SupplierModels>> fetchSuppliers() async {
    try {
      return await apiService.getsuppliers();
    } catch (e) {
      rethrow;
    }
  }
}

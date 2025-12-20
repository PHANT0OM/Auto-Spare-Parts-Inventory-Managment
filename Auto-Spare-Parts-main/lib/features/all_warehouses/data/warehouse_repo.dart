import 'package:auto_space/features/all_warehouses/data/warehouse_models.dart';

import 'package:auto_space/core/network/api_services.dart';

abstract class WarehouseRepository {
  Future<List<WarehouseModels>> fetchwarehouses();
}

class WarehouseRepositoryImpl implements WarehouseRepository {
  final WarehouseApiService apiService;

  WarehouseRepositoryImpl({required this.apiService});

  @override
  Future<List<WarehouseModels>> fetchwarehouses() async {
    try {
      return await apiService.getwarehouses();
    } catch (e) {
      rethrow;
    }
  }
}

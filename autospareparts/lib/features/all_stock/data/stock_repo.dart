import 'package:auto_space/features/all_stock/data/stock_models.dart';
import 'package:auto_space/core/network/api_services.dart';

abstract class StockRepository {
  Future<List<StockModels>> fetchstock();
}

class StockRepositoryImpl implements StockRepository {
  final StockApiService apiService;

  StockRepositoryImpl({required this.apiService});

  @override
  Future<List<StockModels>> fetchstock() async {
    try {
      return await apiService.getstock();
    } catch (e) {
      rethrow;
    }
  }
}

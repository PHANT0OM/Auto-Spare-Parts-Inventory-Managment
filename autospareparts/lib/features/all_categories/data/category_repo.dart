import 'package:auto_space/features/all_categories/data/category_models.dart';

import 'package:auto_space/core/network/api_services.dart';

abstract class CategoryRepository {
  Future<List<CategoryModels>> fetchCategories();
}

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryApiService apiService;

  CategoryRepositoryImpl({required this.apiService});

  @override
  Future<List<CategoryModels>> fetchCategories() async {
    try {
      return await apiService.getcategories();
    } catch (e) {
      rethrow;
    }
  }
}

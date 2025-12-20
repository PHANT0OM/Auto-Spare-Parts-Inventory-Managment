import 'package:auto_space/features/all_customers/data/customer_models.dart';
import 'package:auto_space/core/network/api_services.dart';

abstract class CustomerRepository {
  Future<List<CustomerModels>> fetchCustomers();
}

class CustomerRepositoryImpl implements CustomerRepository {
  final CustomerApiService apiService;

  CustomerRepositoryImpl({required this.apiService});

  @override
  Future<List<CustomerModels>> fetchCustomers() async {
    try {
      return await apiService.getCustomers();
    } catch (e) {
      rethrow;
    }
  }
}

import '../../common/http_client.dart';
import '../../data/meal_food.dart';
import '../source/transfer_food_data_source.dart';

final transferFoodRepository = TransferFoodRepository(TransferFoodRemoteDataSource(httpClient) as ITransferFoodDataSource);

abstract class ITransferFoodRepository {
  Future<List<SelfServiceEntity>> get_list_available_self_service(Map body);
  Future<Map> request(Map body);
  Future<Map> pre_create_request(Map body);
  Future<Map> delete_request(Map body);

// Future<List<ProductEntity>> search(String searchTerm);
}

class TransferFoodRepository implements ITransferFoodRepository {
  final ITransferFoodDataSource dataSource;

  TransferFoodRepository(this.dataSource);

  @override
  Future<List<SelfServiceEntity>> get_list_available_self_service(Map body) => dataSource.get_list_available_self_service(body);

  @override
  Future<Map> request(Map body) => dataSource.request(body);

  @override
  Future<Map> pre_create_request(Map body) => dataSource.pre_create_request(body);

  @override
  Future<Map> delete_request(Map body) => dataSource.delete_request(body);


}

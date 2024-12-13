import '../../common/http_client.dart';
import '../../data/activity_report.dart';
import '../meal_food.dart';
import '../source/activity_report_data_source.dart';
import '../source/meal_food_data_source.dart';

final userActivityRepository = UserActivityRepository(UserActivityRemoteDataSource(httpClient) as IUserActivityDataSource);

abstract class IUserActivityRepository {
  Future<List<FoodSystemUserActivityEntity>> get_user_food_activities(Map body);
  Future<List<BusSystemUserActivityEntity>> get_user_bus_activities(Map body);
  Future<List<FinancialUserActivityEntity>> get_user_financial_activities(Map body);
  Future<List<DormitorySystemUserActivityEntity>> get_user_dormitory_activities(Map body);
  Future<List<SystemUserActivityEntity>> get_user_system_activities(Map body);
// Future<List<ProductEntity>> search(String searchTerm);
}

class UserActivityRepository implements IUserActivityRepository {
  final IUserActivityDataSource dataSource;

  UserActivityRepository(this.dataSource);

  @override
  Future<List<FoodSystemUserActivityEntity>> get_user_food_activities(Map body) => dataSource.get_user_food_activities(body);

  @override
  Future<List<BusSystemUserActivityEntity>> get_user_bus_activities(Map body) => dataSource.get_user_bus_activities(body);

  @override
  Future<List<FinancialUserActivityEntity>> get_user_financial_activities(Map body) => dataSource.get_user_financial_activities(body);

  @override
  Future<List<DormitorySystemUserActivityEntity>> get_user_dormitory_activities(Map body) => dataSource.get_user_dormitory_activities(body);

  @override
  Future<List<SystemUserActivityEntity>> get_user_system_activities(Map body) => dataSource.get_user_system_activities(body);


// @override
// Future<List<ProductEntity>> search(String searchTerm) =>
//     dataSource.search(searchTerm);
}

import '../../common/http_client.dart';
import '../meal_food.dart';
import '../source/meal_food_data_source.dart';

final mealFoodRepository = MealFoodRepository(MealFoodRemoteDataSource(httpClient) as IMealFoodDataSource);

abstract class IMealFoodRepository {
  Future<List<MealFoodEntity>> meal_foods(Map body);
  Future<List<SelfServiceEntity>> get_self_service_list();
  Future<Map> get_weekly_reserve_food_status(Map body);
  Future<Map> reserve_meal_food(Map body);
  Future<Map> buy_meal_food(Map body);


// Future<List<ProductEntity>> search(String searchTerm);
}

class MealFoodRepository implements IMealFoodRepository {
  final IMealFoodDataSource dataSource;

  MealFoodRepository(this.dataSource);

  @override
  Future<List<MealFoodEntity>> meal_foods(Map body) => dataSource.meal_foods(body);
  Future<List<SelfServiceEntity>> get_self_service_list() => dataSource.get_self_service_list();
  Future<Map> get_weekly_reserve_food_status(Map body)=> dataSource.get_weekly_reserve_food_status(body);
  Future<Map> buy_meal_food(Map body)=> dataSource.buy_meal_food(body);
  Future<Map> reserve_meal_food(Map body)=> dataSource.reserve_meal_food(body);


// @override
  // Future<List<ProductEntity>> search(String searchTerm) =>
  //     dataSource.search(searchTerm);
}

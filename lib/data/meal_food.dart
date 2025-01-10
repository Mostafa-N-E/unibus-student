class MealFood_APIbody {
  static const Map none = {};
  static const Map latest = {};
  static const Map popular = {};
  static const Map priceHighToLow = {};
  static const Map priceLowToHigh = {};
}

class SelfServiceEntity{
  final int id;
  final String name;
  final bool status;
  final List meals;

  SelfServiceEntity({
    required this.id,
    required this.name,
    this.status = true,
    this.meals = const [],
  });
}

class MealEntity{
  final int id;
  final int type;
  final String start_time;
  final String end_time;

  MealEntity({
    required this.id,
    required this.type,
    this.start_time = "",
    this.end_time = "",
  });
}

class BaseMealFoodEntity{
  final int id;
  final String name;
  final String weekday;
  final MealEntity meal;

  BaseMealFoodEntity({
    required this.id,
    required this.name,
    required this.weekday,
    required this.meal,
  });
}
class FoodstuffsEntity{
  final int id;
  final String name;
  final String image;
  final int weight;

  FoodstuffsEntity({
    required this.id,
    required this.name,
    required this.image,
    this.weight = 40,
  });
}
class FoodEntity{
  final int id;
  final String name;
  final String image;
  final int cost_main_reserved;
  final int cost_additional_sell;
  final String type;
  final bool status;
  final int calories;
  final double score;
  final String about;
  List like;
  List<FoodstuffsEntity> ingredienta;

  FoodEntity({
    required this.id,
    required this.name,
    this.image = "",
    this.cost_main_reserved = 0,
    this.cost_additional_sell = 0,
    this.type = "",
    this.score = 5,
    this.about = "",
    this.status = true,
    this.calories = 0,
    this.like = const [],
    this.ingredienta = const [],
  });
}


class MealFoodEntity {
  final int id;
  final SelfServiceEntity self_service;
  final BaseMealFoodEntity base;
  final FoodEntity food;
  List reserved;
  List users_ate;
  List additional_sell;
  final bool status;
  final bool enable_main_reserve;
  final bool enable_additional_sell;
  List like;
  List refused;
  List dislike;
  String date;

  int user_vote;
  int transfer_request_status;

  // MealFood.fromJson(Map<String, dynamic> json)
  //     :
  //       id= json['id'],
  // self_service= SelfService(json['self_service']),
  // base= BaseMealFood(json['base']),
  // food= Food(json['food']),
  // date= json['date'],
  // reserved= json['reserved'],
  // users_ate= json['users_ate'],
  // additional_sell= json['additional_sell'],
  // like= json['like'],
  // refused= json['refused'],
  // dislike= json['dislike'],
  // status= json['status'],
  // enable_main_reserve= json['enable_main_reserve'],
  // enable_additional_sell= json['enable_additional_sell']
  // ;
  MealFoodEntity(
      {
        required this.id,
        required this.self_service,
        required this.base,
        required this.food,

        this.date = "",
        this.users_ate = const [],
        this.reserved = const [],
        this.additional_sell = const [],
        this.status = true,
        this.enable_main_reserve = true,
        this.enable_additional_sell = true,
        this.like = const [],
        this.refused = const [],
        this.dislike = const [],
        this.user_vote = -1,
        this.transfer_request_status = 0
      }
      );

  @override
  String toString() {
    return food.name;//'Place $name (closed : $isClosed)';
  }

  // @override
  // LatLng get get_location => location.latLng;
  bool has_reserve(int id){
    print("has_reserve method ???????????????????????????????????????????????????");
    print(id);
    print(this.reserved);

    for(var i in this.reserved){
      if(id.toInt() == i.toInt()){
        print("reserved  ???????????????????????????????????????????????????");
        return true;
      }
    }
    return false;
  }

  bool has_additional_sell(int id){
    print("has_additional_sell method ???????????????????????????????????????????????????");
    print(id);
    print(this.additional_sell);

    for(var i in this.additional_sell){
      if(id.toInt() == i.toInt()){
        print("additional_sell  ???????????????????????????????????????????????????");
        return true;
      }
    }
    return false;
  }

  int get_reaction(int id){
    for(var i in this.refused){
      if(id.toInt() == i.toInt()){
        print("user_vote  refused ???????????????????????????????????????????????????");
        this.user_vote = 1;
        return 1;
      }
    }
    for(var i in this.like){
      if(id.toInt() == i.toInt()){
        this.user_vote = 0;
        print("user_vote   like ???????????????????????????????????????????????????");
        return 0;
      }
    }
    for(var i in this.dislike){
      if(id.toInt() == i.toInt()){
        this.user_vote = 2;
        print("user_vote  dislike ???????????????????????????????????????????????????");
        return 2;
      }
    }
    this.user_vote = -1;
    return -1;
  }

  static Map<String, List<MealFoodEntity>> get_meal_foods_dased_on_meal_type(List<MealFoodEntity> meal_foods){
    List<MealFoodEntity> breakfast_foods = [];
    List<MealFoodEntity> lunch_foods = [];
    List<MealFoodEntity> dinner_foods = [];
    for(var meal_food in meal_foods){
      switch(meal_food.base.meal.type){
        case 1:
          print("meal_food.base.meal.type == 1 !!!!!!!!!!!!!!!!!!!!!!!!!!");
          breakfast_foods.add(meal_food);
          break;
        case 2:
          print("meal_food.base.meal.type == 2 !!!!!!!!!!!!!!!!!!!!!!!!!!");
          lunch_foods.add(meal_food);
          break;
        case 3:
          print("meal_food.base.meal.type == 3 !!!!!!!!!!!!!!!!!!!!!!!!!!");
          dinner_foods.add(meal_food);
          break;
      }
      // if(meal_food.base.meal.type == 1){
      //   print("meal_food.base.meal.type == 1 !!!!!!!!!!!!!!!!!!!!!!!!!!");
      //   breakfast_foods.add(meal_food);
      // }
      // else if(meal_food.base.meal.type == 2){
      //   print("meal_food.base.meal.type == 2 !!!!!!!!!!!!!!!!!!!!!!!!!!");
      //   lunch_foods.add(meal_food);
      // }
      // else if(meal_food.base.meal.type == 3){
      //   print("meal_food.base.meal.type == 3 !!!!!!!!!!!!!!!!!!!!!!!!!!");
      //   dinner_foods.add(meal_food);
      // }
    }
    return {
      "breakfast_foods": breakfast_foods,
      "lunch_foods": lunch_foods,
      "dinner_foods": dinner_foods,
    };
    // for(var i in this.like){
    //
    // }
    // for(var i in this.dislike){
    //   if(id.toInt() == i.toInt()){
    //     this.user_vote = 2;
    //     print("user_vote  dislike ???????????????????????????????????????????????????");
    //     return 2;
    //   }
    // }
    // this.user_vote = -1;
    // return -1;
  }
}


MealFoodEntity meal_food_builder(Map data){
  return MealFoodEntity(
    id: data['id'],
    self_service: SelfServiceEntity(
      id: data['self_service']['id'],
      name: data['self_service']['name'],
      meals: data['self_service']['meals'],
      status: data['self_service']['status'],
    ),
    base: BaseMealFoodEntity(
        id: data['base']['id'],
        name: data['base']['name'],
        weekday: data['base']['weekday'],
        meal: MealEntity(
          id: data['base']['meal']['id'],
          type: data['base']['meal']['type'],
          end_time: data['base']['meal']['end_time'],
          start_time: data['base']['meal']['start_time'],
        )
    ),
    food: FoodEntity(
        id: data['food']['id'],
        name: data['food']['name'],
        type: data['food']['type'],
        image: data['food']['image'],
        cost_additional_sell: data['food']['cost_additional_sell'],
        cost_main_reserved: data['food']['cost_main_reserved'],
        status: data['food']['status'],
        calories: data['food']['calories'],
        like: data['food']['like'],
        ingredienta: list_foodstuffs_builder(data['food']['ingredienta']),
        about: data['food']['about'] ?? "",
        score: data['food']['score']

    ),
    date: data['date'],
    reserved: data['reserved'],
    users_ate: data['users_ate'],
    additional_sell: data['additional_sell'],
    like: data['like'],
    refused: data['refused'],
    dislike: data['dislike'],
    status: data['status'],
    enable_main_reserve: data['enable_main_reserve'],
    enable_additional_sell: data['enable_additional_sell'],
  );
}

MealFoodEntity meal_food__less_data_builder(Map data){
  return MealFoodEntity(
    id: data['id'],
    self_service: SelfServiceEntity(
      id: data['self_service']['id'],
      name: data['self_service']['name'],
      meals: data['self_service']['meals'],
      status: data['self_service']['status'],
    ),
    base: BaseMealFoodEntity(
        id: data['base']['id'],
        name: data['base']['name'],
        weekday: data['base']['weekday'],
        meal: MealEntity(
          id: data['base']['meal']['id'],
          type: data['base']['meal']['type'],
          end_time: data['base']['meal']['end_time'],
          start_time: data['base']['meal']['start_time'],
        )
    ),
    food: FoodEntity(
        id: data['food']['id'],
        name: data['food']['name'],
        type: data['food']['type'],
        image: data['food']['image'],
        cost_additional_sell: data['food']['cost_additional_sell'],
        cost_main_reserved: data['food']['cost_main_reserved'],
        status: data['food']['status'],
        calories: data['food']['calories'],
        like: data['food']['like'],
        ingredienta: list_foodstuffs_builder(data['food']['ingredienta']),
        about: data['food']['about'] ?? "",
        score: data['food']['score']

    ),
    // date: data['date'],
    // reserved: data['reserved'],
    // users_ate: data['users_ate'],
    // additional_sell: data['additional_sell'],
    // like: data['like'],
    // refused: data['refused'],
    // dislike: data['dislike'],
    // status: data['status'],
    // enable_main_reserve: data['enable_main_reserve'],
    // enable_additional_sell: data['enable_additional_sell'],
  );
}

SelfServiceEntity self_service_builder(Map data){
  return SelfServiceEntity(
    id: data['id'],
    name: data['name'],
    meals: data['meals'],
    status: data['status'],
  );
}

List<FoodstuffsEntity> list_foodstuffs_builder(List list_data){
  List<FoodstuffsEntity> res_list = [];
  for(var data in list_data){
    res_list.add(FoodstuffsEntity(
        id: data['id'],
        name: data['name'],
        image: data['image'],
        weight: data['weight']
    )
    );
  }
  return res_list;
}

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import '../../common/http_client.dart';
import '../../data/common/http_response_validator.dart';
import '../activity_report.dart';
import 'package:http/http.dart' as http;

abstract class IUserActivityDataSource {
  Future<List<FoodSystemUserActivityEntity>> get_user_food_activities(Map body);
  Future<List<BusSystemUserActivityEntity>> get_user_bus_activities(Map body);
  Future<List<FinancialUserActivityEntity>> get_user_financial_activities(Map body);
  Future<List<DormitorySystemUserActivityEntity>> get_user_dormitory_activities(Map body);
  Future<List<SystemUserActivityEntity>> get_user_system_activities(Map body);
}

class UserActivityRemoteDataSource with HttpResponseValidator implements IUserActivityDataSource {
  // final Dio httpClient;
  static const Map paths = {
    'get_user_food_activities': 'activity/food-activities/',
    'get_user_bus_activities': 'activity/bus-activities/',
    'get_user_financial_activities': 'activity/financial-activities/',
    'get_user_dormitory_activities': 'activity/dormitory-activities/',
    'get_user_system_activities': 'activity/system-activities/',
  };
  // String token = Hive.box('settings').get('TOKEN', defaultValue: "").toString();

  UserActivityRemoteDataSource(httpClient);

  // MealFoodRemoteDataSource(this.httpClient);
  @override
  Future<List<FoodSystemUserActivityEntity>> get_user_food_activities(Map body) async {
    // final response = await httpClient.get('product/list?sort=$sort');
    // var client = http.Client();
    var uri = Uri.parse(
      base_api_service_url+paths['get_user_food_activities'].toString(),
    );
    var request_body = jsonEncode(
        body
    );
    var response = await http.Client().post(
      uri,
      body: request_body,
      headers: {
        'Authorization': 'Bearer $token',
        "content-type": "application/json"
      },
    );
    print("===================================================))))))))))))))))))");
    print(response);
    // debugPrint(response.body);
    // debugPrint("===================================================))))))))))))))))))");

    validateResponse(response);

    var json = jsonDecode(utf8.decode(response.bodyBytes));

    // ------
    // Map json = {
    //   "message": "",
    //   "data": {
    //     "totalcount": 2,
    //     "activities": [
    //       {
    //         "id": 2,
    //         "meal_food": {
    //           "id": 2,
    //           "self_service": {
    //             "id": 1,
    //             "name": "مرکزی",
    //             "status": true,
    //             "dormitory": null,
    //             "meals": [
    //               1
    //             ]
    //           },
    //           "base": {
    //             "id": 2,
    //             "meal": {
    //               "id": 2,
    //               "type": 3,
    //               "start_time": "18:05:21",
    //               "end_time": "23:00:00"
    //             },
    //             "weekday": "چهار شنبه",
    //             "name": "شام"
    //           },
    //           "food": {
    //             "id": 1,
    //             "type": "پر هزینه",
    //             "image": "/images/post.jpeg",
    //             "ingredienta": [],
    //             "name": "چلو کباب",
    //             "cost_main_reserved": 10000,
    //             "cost_additional_sell": 20000,
    //             "status": true,
    //             "calories": 499,
    //             "about": "",
    //             "score": 5.0,
    //             "like": []
    //           },
    //           "date": "1401-11-18",
    //           "count_of_additional_sell": 0,
    //           "count_of_additional_sell_per_user": 1,
    //           "status": true,
    //           "enable_main_reserve": true,
    //           "enable_additional_sell": false,
    //           "enable_reaction": true,
    //           "enable_get_result_reaction": true,
    //           "enable_report": true,
    //           "enable_get_forgotten_code": true,
    //           "enable_get_meal_food": true,
    //           "is_penalty_applied": false,
    //           "penalty_amount": 3000,
    //           "reserved": [],
    //           "users_ate": [
    //             3991231137
    //           ],
    //           "additional_sell": [],
    //           "like": [],
    //           "refused": [],
    //           "dislike": []
    //         },
    //         "activity_type": "get",
    //         "date": "1401-11-01",
    //         "time": "12:31:00",
    //         "status": true,
    //         "created": "2023-02-10T14:43:28.129537+03:30",
    //         "user": 3991231137
    //       },
    //       {
    //         "id": 2,
    //         "meal_food": {
    //           "id": 2,
    //           "self_service": {
    //             "id": 1,
    //             "name": "مرکزی",
    //             "status": true,
    //             "dormitory": null,
    //             "meals": [
    //               1
    //             ]
    //           },
    //           "base": {
    //             "id": 2,
    //             "meal": {
    //               "id": 2,
    //               "type": 3,
    //               "start_time": "18:05:21",
    //               "end_time": "23:00:00"
    //             },
    //             "weekday": "چهار شنبه",
    //             "name": "شام"
    //           },
    //           "food": {
    //             "id": 1,
    //             "type": "پر هزینه",
    //             "image": "/images/post.jpeg",
    //             "ingredienta": [],
    //             "name": "چلو کباب",
    //             "cost_main_reserved": 10000,
    //             "cost_additional_sell": 20000,
    //             "status": true,
    //             "calories": 499,
    //             "about": "",
    //             "score": 5.0,
    //             "like": []
    //           },
    //           "date": "1401-11-18",
    //           "count_of_additional_sell": 0,
    //           "count_of_additional_sell_per_user": 1,
    //           "status": true,
    //           "enable_main_reserve": true,
    //           "enable_additional_sell": false,
    //           "enable_reaction": true,
    //           "enable_get_result_reaction": true,
    //           "enable_report": true,
    //           "enable_get_forgotten_code": true,
    //           "enable_get_meal_food": true,
    //           "is_penalty_applied": false,
    //           "penalty_amount": 3000,
    //           "reserved": [],
    //           "users_ate": [
    //             3991231137
    //           ],
    //           "additional_sell": [],
    //           "like": [],
    //           "refused": [],
    //           "dislike": []
    //         },
    //         "activity_type": "get",
    //         "date": "1401-11-01",
    //         "time": "12:31:00",
    //         "status": true,
    //         "created": "2023-02-10T14:43:28.129537+03:30",
    //         "user": 3991231137
    //       },
    //       {
    //         "id": 2,
    //         "meal_food": {
    //           "id": 2,
    //           "self_service": {
    //             "id": 1,
    //             "name": "مرکزی",
    //             "status": true,
    //             "dormitory": null,
    //             "meals": [
    //               1
    //             ]
    //           },
    //           "base": {
    //             "id": 2,
    //             "meal": {
    //               "id": 2,
    //               "type": 3,
    //               "start_time": "18:05:21",
    //               "end_time": "23:00:00"
    //             },
    //             "weekday": "چهار شنبه",
    //             "name": "شام"
    //           },
    //           "food": {
    //             "id": 1,
    //             "type": "پر هزینه",
    //             "image": "/images/post.jpeg",
    //             "ingredienta": [],
    //             "name": "چلو کباب",
    //             "cost_main_reserved": 10000,
    //             "cost_additional_sell": 20000,
    //             "status": true,
    //             "calories": 499,
    //             "about": "",
    //             "score": 5.0,
    //             "like": []
    //           },
    //           "date": "1401-11-18",
    //           "count_of_additional_sell": 0,
    //           "count_of_additional_sell_per_user": 1,
    //           "status": true,
    //           "enable_main_reserve": true,
    //           "enable_additional_sell": false,
    //           "enable_reaction": true,
    //           "enable_get_result_reaction": true,
    //           "enable_report": true,
    //           "enable_get_forgotten_code": true,
    //           "enable_get_meal_food": true,
    //           "is_penalty_applied": false,
    //           "penalty_amount": 3000,
    //           "reserved": [],
    //           "users_ate": [
    //             3991231137
    //           ],
    //           "additional_sell": [],
    //           "like": [],
    //           "refused": [],
    //           "dislike": []
    //         },
    //         "activity_type": "get",
    //         "date": "1401-11-01",
    //         "time": "12:31:00",
    //         "status": true,
    //         "created": "2023-02-10T14:43:28.129537+03:30",
    //         "user": 3991231137
    //       },
    //       {
    //         "id": 2,
    //         "meal_food": {
    //           "id": 2,
    //           "self_service": {
    //             "id": 1,
    //             "name": "مرکزی",
    //             "status": true,
    //             "dormitory": null,
    //             "meals": [
    //               1
    //             ]
    //           },
    //           "base": {
    //             "id": 2,
    //             "meal": {
    //               "id": 2,
    //               "type": 3,
    //               "start_time": "18:05:21",
    //               "end_time": "23:00:00"
    //             },
    //             "weekday": "چهار شنبه",
    //             "name": "شام"
    //           },
    //           "food": {
    //             "id": 1,
    //             "type": "پر هزینه",
    //             "image": "/images/post.jpeg",
    //             "ingredienta": [],
    //             "name": "چلو کباب",
    //             "cost_main_reserved": 10000,
    //             "cost_additional_sell": 20000,
    //             "status": true,
    //             "calories": 499,
    //             "about": "",
    //             "score": 5.0,
    //             "like": []
    //           },
    //           "date": "1401-11-18",
    //           "count_of_additional_sell": 0,
    //           "count_of_additional_sell_per_user": 1,
    //           "status": true,
    //           "enable_main_reserve": true,
    //           "enable_additional_sell": false,
    //           "enable_reaction": true,
    //           "enable_get_result_reaction": true,
    //           "enable_report": true,
    //           "enable_get_forgotten_code": true,
    //           "enable_get_meal_food": true,
    //           "is_penalty_applied": false,
    //           "penalty_amount": 3000,
    //           "reserved": [],
    //           "users_ate": [
    //             3991231137
    //           ],
    //           "additional_sell": [],
    //           "like": [],
    //           "refused": [],
    //           "dislike": []
    //         },
    //         "activity_type": "get",
    //         "date": "1401-11-01",
    //         "time": "12:31:00",
    //         "status": true,
    //         "created": "2023-02-10T14:43:28.129537+03:30",
    //         "user": 3991231137
    //       },
    //     ]
    //   },
    //   "code": 200,
    //   "status": true
    // };
    // ------
    final user_acivities = <FoodSystemUserActivityEntity>[];
    (json['data']['activities'] as List).forEach((element) {
      // meal_foods.add(MealFoodEntity.fromJson(element));
          user_acivities.add(food_system_user_activity_builder(element));
    });
    return user_acivities;
  }

  @override
  Future<List<BusSystemUserActivityEntity>> get_user_bus_activities(Map body) async {
    // final response = await httpClient.get('product/list?sort=$sort');
    // var client = http.Client();
    var uri = Uri.parse(
      base_api_service_url+paths['get_user_bus_activities'].toString(),
    );
    var request_body = jsonEncode(
        body
    );
    var response = await http.Client().post(
      uri,
      body: request_body,
      headers: {
        'Authorization': 'Bearer $token',
        "content-type": "application/json"
      },
    );
    print("===================================================))))))))))))))))))");
    print(response);
    debugPrint(response.body);
    debugPrint("===================================================))))))))))))))))))");

    validateResponse(response);

    var json = jsonDecode(utf8.decode(response.bodyBytes));

    // ------
    // Map json = {
    //   "message": "",
    //   "data": {
    //     "totalcount": 1,
    //     "activities": [
    //       {
    //         "id": 1,
    //         "turn": {
    //           "id": 1,
    //           "base": {
    //             "id": 1,
    //             "dormitory": {
    //               "id": 1,
    //               "name": "حافظ",
    //               "capacity": 1,
    //               "status": true,
    //               "management": 1111231137
    //             },
    //             "name": "حافظ",
    //             "weekday": 2,
    //             "type": 1,
    //             "start_time": "15:22:14",
    //             "end_time": "15:22:15",
    //             "cost_main_traveler": 1,
    //             "cost_additional_traveler": 2,
    //             "description": ""
    //           },
    //           "buses": [],
    //           "date": "1401-11-18",
    //           "status": true,
    //           "enable_main_reserve": true,
    //           "enable_additional_sell": true,
    //           "enable_reaction": true,
    //           "enable_get_result_reaction": true,
    //           "enable_get_forgotten_code": true,
    //           "enable_getting_bus": true,
    //           "is_penalty_applied": false,
    //           "penalty_amount": 3000,
    //           "reserved": [],
    //           "waiting": [],
    //           "main_travelers": [],
    //           "additional_travelers": [],
    //           "like": [],
    //           "refused": [],
    //           "dislike": []
    //         },
    //         "activity_type": "لیست رزرو",
    //         "date": "2023-03-24",
    //         "time": "15:21:59",
    //         "status": true,
    //         "created": "2023-03-24T15:22:56.786458+03:30",
    //         "user": 3991231137
    //       }
    //     ]
    //   },
    //   "code": 200,
    //   "status": true
    // };
    // ------
    final user_acivities = <BusSystemUserActivityEntity>[];
    (json['data']['activities'] as List).forEach((element) {
      // meal_foods.add(MealFoodEntity.fromJson(element));
      user_acivities.add(bus_system_user_activity_builder(element));
    });
    return user_acivities;
  }

  @override
  Future<List<FinancialUserActivityEntity>> get_user_financial_activities(Map body) async {
    // final response = await httpClient.get('product/list?sort=$sort');
    // var client = http.Client();
    var uri = Uri.parse(
      base_api_service_url+paths['get_user_financial_activities'].toString(),
    );
    var request_body = jsonEncode(
        body
    );
    var response = await http.Client().post(
      uri,
      body: request_body,
      headers: {
        'Authorization': 'Bearer $token',
        "content-type": "application/json"
      },
    );
    print("===================================================))))))))))))))))))");
    print(response);
    debugPrint(response.body);
    debugPrint("===================================================))))))))))))))))))");

    validateResponse(response);

    var json = jsonDecode(utf8.decode(response.bodyBytes));

    // ------
    // Map json = {
    //   "message": "",
    //   "data": {
    //     "totalcount": 1,
    //     "activities": [
    //       {
    //         "id": 1,
    //         "activity_type": "شارز کردن",
    //         "date": "2023-03-25",
    //         "time": "09:54:37",
    //         "status": true,
    //         "created": "2023-03-25T09:54:51.306045+03:30",
    //         "payment_tracking_code": 1233344567,
    //         "user": 3991231137,
    //         "bank": null
    //       }
    //     ]
    //   },
    //   "code": 200,
    //   "status": true
    // };
    // ------
    final user_acivities = <FinancialUserActivityEntity>[];
    (json['data']['activities'] as List).forEach((element) {
      // meal_foods.add(MealFoodEntity.fromJson(element));
      user_acivities.add(financial_user_activity_builder(element));
    });
    return user_acivities;
  }

  @override
  Future<List<DormitorySystemUserActivityEntity>> get_user_dormitory_activities(Map body) async {
    // final response = await httpClient.get('product/list?sort=$sort');
    // var client = http.Client();
    var uri = Uri.parse(
      base_api_service_url+paths['get_user_bus_activities'].toString(),
    );
    var request_body = jsonEncode(
        body
    );
    var response = await http.Client().post(
      uri,
      body: request_body,
      headers: {
        'Authorization': 'Bearer $token',
        "content-type": "application/json"
      },
    );
    print("===================================================))))))))))))))))))");
    print(response);
    debugPrint(response.body);
    debugPrint("===================================================))))))))))))))))))");

    validateResponse(response);

    var json = jsonDecode(utf8.decode(response.bodyBytes));

    // ------
    // Map json = {
    //   "message": "",
    //   "data": {
    //     "totalcount": 1,
    //     "activities": [
    //       {
    //         "id": 1,
    //         "turn": {
    //           "id": 1,
    //           "base": {
    //             "id": 1,
    //             "dormitory": {
    //               "id": 1,
    //               "name": "حافظ",
    //               "capacity": 1,
    //               "status": true,
    //               "management": 1111231137
    //             },
    //             "name": "حافظ",
    //             "weekday": 2,
    //             "type": 1,
    //             "start_time": "15:22:14",
    //             "end_time": "15:22:15",
    //             "cost_main_traveler": 1,
    //             "cost_additional_traveler": 2,
    //             "description": ""
    //           },
    //           "buses": [],
    //           "date": "1401-11-18",
    //           "status": true,
    //           "enable_main_reserve": true,
    //           "enable_additional_sell": true,
    //           "enable_reaction": true,
    //           "enable_get_result_reaction": true,
    //           "enable_get_forgotten_code": true,
    //           "enable_getting_bus": true,
    //           "is_penalty_applied": false,
    //           "penalty_amount": 3000,
    //           "reserved": [],
    //           "waiting": [],
    //           "main_travelers": [],
    //           "additional_travelers": [],
    //           "like": [],
    //           "refused": [],
    //           "dislike": []
    //         },
    //         "activity_type": "لیست رزرو",
    //         "date": "2023-03-24",
    //         "time": "15:21:59",
    //         "status": true,
    //         "created": "2023-03-24T15:22:56.786458+03:30",
    //         "user": 3991231137
    //       }
    //     ]
    //   },
    //   "code": 200,
    //   "status": true
    // };
    // ------
    final user_acivities = <DormitorySystemUserActivityEntity>[];
    (json['data']['activities'] as List).forEach((element) {
      // meal_foods.add(MealFoodEntity.fromJson(element));
      user_acivities.add(dormitory_system_user_activity_builder(element));
    });
    return user_acivities;
  }

  @override
  Future<List<SystemUserActivityEntity>> get_user_system_activities(Map body) async {
    // final response = await httpClient.get('product/list?sort=$sort');
    // var client = http.Client();
    var uri = Uri.parse(
      base_api_service_url+paths['get_user_system_activities'].toString(),
    );
    var request_body = jsonEncode(
        body
    );
    var response = await http.Client().post(
      uri,
      body: request_body,
      headers: {
        'Authorization': 'Bearer $token',
        "content-type": "application/json"
      },
    );
    print("===================================================))))))))))))))))))");
    print(response);
    debugPrint(response.body);
    debugPrint("===================================================))))))))))))))))))");

    validateResponse(response);

    var json = jsonDecode(utf8.decode(response.bodyBytes));

    // ------
    // Map json = {
    //   "message": "",
    //   "data": {
    //     "totalcount": 1,
    //     "activities": [
    //       {
    //         "id": 1,
    //         "turn": {
    //           "id": 1,
    //           "base": {
    //             "id": 1,
    //             "dormitory": {
    //               "id": 1,
    //               "name": "حافظ",
    //               "capacity": 1,
    //               "status": true,
    //               "management": 1111231137
    //             },
    //             "name": "حافظ",
    //             "weekday": 2,
    //             "type": 1,
    //             "start_time": "15:22:14",
    //             "end_time": "15:22:15",
    //             "cost_main_traveler": 1,
    //             "cost_additional_traveler": 2,
    //             "description": ""
    //           },
    //           "buses": [],
    //           "date": "1401-11-18",
    //           "status": true,
    //           "enable_main_reserve": true,
    //           "enable_additional_sell": true,
    //           "enable_reaction": true,
    //           "enable_get_result_reaction": true,
    //           "enable_get_forgotten_code": true,
    //           "enable_getting_bus": true,
    //           "is_penalty_applied": false,
    //           "penalty_amount": 3000,
    //           "reserved": [],
    //           "waiting": [],
    //           "main_travelers": [],
    //           "additional_travelers": [],
    //           "like": [],
    //           "refused": [],
    //           "dislike": []
    //         },
    //         "activity_type": "لیست رزرو",
    //         "date": "2023-03-24",
    //         "time": "15:21:59",
    //         "status": true,
    //         "created": "2023-03-24T15:22:56.786458+03:30",
    //         "user": 3991231137
    //       }
    //     ]
    //   },
    //   "code": 200,
    //   "status": true
    // };
    // ------
    final user_acivities = <SystemUserActivityEntity>[];
    (json['data']['activities'] as List).forEach((element) {
      // meal_foods.add(MealFoodEntity.fromJson(element));
      user_acivities.add(system_user_activity_builder(element));
    });
    return user_acivities;
  }
}





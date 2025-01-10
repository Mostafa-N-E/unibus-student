import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../common/http_client.dart';
import '../../data/common/http_response_validator.dart';
import '../meal_food.dart';

abstract class IMealFoodDataSource {
  Future<List<MealFoodEntity>> meal_foods(Map body);
  Future<List<SelfServiceEntity>> get_self_service_list();
  Future<Map> get_weekly_reserve_food_status(Map body);
  Future<Map> reserve_meal_food(Map body);
  Future<Map> buy_meal_food(Map body);


}

class MealFoodRemoteDataSource with HttpResponseValidator implements IMealFoodDataSource {
  // final Dio httpClient;
  static const Map paths = {
    // 'get_meal_foods_weekly': 'meal/get-meal-foods/',
    'meal_foods': 'meal/get-meal-foods/',
    'get_self_service_list':"self/service/",
    "get_weekly_reserve_food_status": "meal/reserve-status/",
    "reserve_meal_food": "meal/reserve-meal-food/",
    "buy_meal_food": "meal/buy-meal-food/",


  };
  // String token = Hive.box('settings').get('TOKEN', defaultValue: "").toString();

  MealFoodRemoteDataSource(httpClient);

  // MealFoodRemoteDataSource(this.httpClient);
  @override
  Future<List<MealFoodEntity>> meal_foods(Map body) async {
    // final response = await httpClient.get('product/list?sort=$sort');
    // var client = http.Client();
    var uri = Uri.parse(
      base_api_service_url+paths['meal_foods'].toString(),
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
    print("===================================================))))))))))))))))))===================================================))))))))))))))))))");
    print(request_body);
    debugPrint(response.body);
    debugPrint("===================================================))))))))))))))))))===================================================))))))))))))))))))");

    validateResponse(response);

    var json = jsonDecode(utf8.decode(response.bodyBytes));
    // Map json = {
    //   "message": "",
    //   "data": {
    //     "totalcount": 2,
    //     "meals": [
    //       {
    //         "id": 9,
    //         "self_service": {
    //           "id": 2,
    //           "name": "حافظ",
    //           "status": true,
    //           "meals": [
    //             1,
    //             2
    //           ]
    //         },
    //         "base": {
    //           "id": 2,
    //           "meal": {
    //             "id": 2,
    //             "type": 3,
    //             "start_time": "20:00:00",
    //             "end_time": "22:00:00"
    //           },
    //           "weekday": "یکشنبه",
    //           "name": "شام"
    //         },
    //         "food": {
    //           "id": 2,
    //           "type": "usual",
    //           "image": "https://rajaeebusservice.pythonanywhere.com/media/images/Food/New_Project_6.png",
    //           "ingredienta": [
    //             {
    //               "id": 1,
    //               "image": "https://rajaeebusservice.pythonanywhere.com/media/images/Foodstuffs/mushroom.jpeg",
    //               "name": "قارچ",
    //               "weight": 0
    //             },
    //             {
    //               "id": 3,
    //               "image": "https://rajaeebusservice.pythonanywhere.com/media/images/Foodstuffs/tomato.jpeg",
    //               "name": "گوجه",
    //               "weight": 0
    //             }
    //           ],
    //           "name": "خوراک قارچ و مرغ",
    //           "cost_main_reserved": 0,
    //           "cost_additional_sell": 10000,
    //           "status": true,
    //           "calories": 300,
    //           "about": "",
    //           "score": 5.0,
    //           "like": []
    //         },
    //         "date": "1402-01-08",
    //         "count_of_additional_sell": 0,
    //         "count_of_additional_sell_per_user": 1,
    //         "status": true,
    //         "enable_main_reserve": true,
    //         "enable_additional_sell": false,
    //         "enable_reaction": true,
    //         "enable_get_result_reaction": true,
    //         "enable_report": true,
    //         "enable_get_forgotten_code": true,
    //         "enable_get_meal_food": true,
    //         "is_penalty_applied": false,
    //         "penalty_amount": 3000,
    //         "reserved": [
    //           3991231137,
    //           3991231139
    //         ],
    //         "users_ate": [
    //           3991231137
    //         ],
    //         "additional_sell": [],
    //         "like": [],
    //         "refused": [],
    //         "dislike": []
    //       },
    //       {
    //         "id": 15,
    //         "self_service": {
    //           "id": 2,
    //           "name": "حافظ",
    //           "status": true,
    //           "meals": [
    //             1,
    //             2
    //           ]
    //         },
    //         "base": {
    //           "id": 2,
    //           "meal": {
    //             "id": 2,
    //             "type": 3,
    //             "start_time": "20:00:00",
    //             "end_time": "22:00:00"
    //           },
    //           "weekday": "یکشنبه",
    //           "name": "شام"
    //         },
    //         "food": {
    //           "id": 2,
    //           "type": "usual",
    //           "image": "https://rajaeebusservice.pythonanywhere.com/media/images/Food/New_Project_6.png",
    //           "ingredienta": [
    //             {
    //               "id": 1,
    //               "image": "https://rajaeebusservice.pythonanywhere.com/media/images/Foodstuffs/mushroom.jpeg",
    //               "name": "قارچ",
    //               "weight": 0
    //             },
    //             {
    //               "id": 3,
    //               "image": "https://rajaeebusservice.pythonanywhere.com/media/images/Foodstuffs/tomato.jpeg",
    //               "name": "گوجه",
    //               "weight": 0
    //             }
    //           ],
    //           "name": "خوراک قارچ و مرغ",
    //           "cost_main_reserved": 0,
    //           "cost_additional_sell": 10000,
    //           "status": true,
    //           "calories": 300,
    //           "about": "",
    //           "score": 5.0,
    //           "like": []
    //         },
    //         "date": "1402-01-08",
    //         "count_of_additional_sell": 0,
    //         "count_of_additional_sell_per_user": 1,
    //         "status": true,
    //         "enable_main_reserve": true,
    //         "enable_additional_sell": false,
    //         "enable_reaction": true,
    //         "enable_get_result_reaction": true,
    //         "enable_report": true,
    //         "enable_get_forgotten_code": true,
    //         "enable_get_meal_food": true,
    //         "is_penalty_applied": false,
    //         "penalty_amount": 3000,
    //         "reserved": [
    //           3991231137
    //         ],
    //         "users_ate": [],
    //         "additional_sell": [],
    //         "like": [],
    //         "refused": [],
    //         "dislike": []
    //       }
    //     ]
    //   },
    //   "code": 200,
    //   "status": true
    // };
    final meal_foods = <MealFoodEntity>[];
    (json['data']['meals'] as List).forEach((element) {
      // meal_foods.add(MealFoodEntity.fromJson(element));
      meal_foods.add(meal_food_builder(element));
    });
    return meal_foods;
  }

  @override
  Future<List<SelfServiceEntity>> get_self_service_list() async {
    // final response = await httpClient.get('product/list?sort=$sort');
    // var client = http.Client();
    var uri = Uri.parse(
      base_api_service_url+paths['get_self_service_list'].toString(),
    );
    // var request_body = jsonEncode(
    //     body
    // );
    // print("Bearer "+Hive.box('settings').get('TOKEN').toString());
    var response = await http.Client().get(
      uri,
      // body: request_body,
      // headers: {
      //   'Authorization': 'Bearer $token',
      //   "content-type": "application/json"
      // },
    );
    print("===================================================))))))))))))))))))");
    print(response);
    debugPrint(response.body);
    debugPrint("===================================================))))))))))))))))))");

    validateResponse(response);

    var json = jsonDecode(utf8.decode(response.bodyBytes));
    final self_services = <SelfServiceEntity>[];
    (json['data'] as List).forEach((element) {
      // meal_foods.add(MealFoodEntity.fromJson(element));
      self_services.add(self_service_builder(element));
    });
    return self_services;


  }

  @override
  Future<Map> get_weekly_reserve_food_status(Map body) async {
    // final response = await httpClient.get('product/list?sort=$sort');
    // var client = http.Client();
    var uri = Uri.parse(
      base_api_service_url+paths['get_weekly_reserve_food_status'].toString(),
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
    // Map json = {
    //   "message": "با موفقیت ارسال شد",
    //   "data": {
    //     "totalcount": 4,
    //     "start_week": "2023-03-25",
    //     "end_week": "2023-03-31",
    //     "meals": {
    //       "0": {
    //         "1": [],
    //         "2": [],
    //         "3": []
    //       },
    //       "1": {
    //         "1": [],
    //         "2": [],
    //         "3": []
    //       },
    //       "2": {
    //         "1": [],
    //         "2": [],
    //         "3": []
    //       },
    //       "3": {
    //         "1": [
    //           {
    //             "food": "خوراک قارچ و مرغ",
    //             "image": "https://rajaeebusservice.pythonanywhere.com/media/images/Food/New_Project_6.png",
    //             "type": 3,
    //             "self_service": "حافظ",
    //             "meal": "شام"
    //           },
    //         ],
    //         "2": [
    //           {
    //             "food": "خوراک جوجه",
    //             "image": "https://rajaeebusservice.pythonanywhere.com/media/images/Food/New_Project_5.png",
    //             "type": 2,
    //             "self_service": "مرکزی",
    //             "meal": "ناهار"
    //           }
    //         ],
    //         "3": [
    //           {
    //             "food": "خوراک قارچ و مرغ",
    //             "image": "https://rajaeebusservice.pythonanywhere.com/media/images/Food/New_Project_6.png",
    //             "type": 3,
    //             "self_service": "حافظ",
    //             "meal": "شام"
    //           }
    //         ]
    //       },
    //       "4": {
    //         "1": [],
    //         "2": [],
    //         "3": []
    //       },
    //       "5": {
    //         "1": [],
    //         "2": [],
    //         "3": []
    //       },
    //       "6": {
    //         "1": [],
    //         "2": [],
    //         "3": []
    //       }
    //     }
    //   },
    //   "code": 200,
    //   "status": true
    // };

    return json['data'];

  }

  @override
  Future<Map> reserve_meal_food(Map body) async {
    var client = http.Client();
    var uri = Uri.parse(
      base_api_service_url+paths['reserve_meal_food'].toString(),
    );
    var request_body = jsonEncode(
        body
    );
    var response = await client.post(
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

    return {"message": json['message'], "status": json['status']};
  }

  @override
  Future<Map> buy_meal_food(Map body) async {
    var client = http.Client();
    var uri = Uri.parse(
      base_api_service_url+paths['buy_meal_food'].toString(),
    );
    var request_body = jsonEncode(
        body
    );
    var response = await client.post(
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

    return {"message": json['message'], "status": json['status']};
}

}

class MealFood_API {
  static const String base_url = base_api_service_url;
  static const Map paths = {
    // 'get_meal_foods_weekly': 'meal/get-meal-foods/',
    'meal_foods': 'meal/get-meal-foods/',
    'reserve_meal_food':"meal/reserve-meal-food/",
    "delete_reserve_meal_food":"meal/delete-reserve-meal-food/",
    "reserve_status": "meal/reserve-status/",
    "record_feedback": "meal/record-feedback/",
    "get_forgotten_code": "meal/get-forgotten-code/",
    "result_feedback": "meal/result-feedback/",
    "list_result_feedback": "meal/list-result-feedback/"

  };
  // String token = Hive.box('settings').get('TOKEN').toString();



  Future<Map> meal_foods(Map body) async {
    var client = http.Client();
    var uri = Uri.parse(
      base_url+paths['meal_foods'].toString(),
    );
    var request_body = jsonEncode(
        body
    );
    // print("Bearer "+Hive.box('settings').get('TOKEN').toString());
    var response = await client.post(
      uri,
      body: request_body,
      headers: {
        'Authorization': 'Bearer $token',
        "content-type": "application/json"
      },
    );
    // print("===================================================))))))))))))))))))");
    // var json = jsonDecode(utf8.decode(response.bodyBytes));
    // print(json);
    print("||||||||===================================================))))))))))))))))))");
    print(request_body);
    print("||||||||===================================================))))))))))))))))))");
    // print(response);
    // print(response.statusCode);
    // // print(response.body);
    // // print(response.body);
    // // print(response.toString());
    // print("===================================================))))))))))))))))))");
    if(response.statusCode == 200){
      var json = jsonDecode(utf8.decode(response.bodyBytes));
      // if(body['isWeekly'] == false){
      //   Hive.box('cache').put('meeting_items_in_region__notWeekly', json['data']['meetings']);
      // } else{
      //   Hive.box('cache').put('meeting_items_in_region', json['data']['meetings']);
      // }

      print("%%%%%%%%%%%%%%%%%===================================================))))))))))))))))))");
      // print(json);
      print(json['data']);
      print("%%%%%%%%%%%%%%%%%===================================================))))))))))))))))))");
      return json['data'];
    }
    return {};
    // return response.statusCode ?? 404;
  }

  Future<Map> reserve_meal_food(Map body) async {
    var client = http.Client();
    var uri = Uri.parse(
      base_url+paths['reserve_meal_food'].toString(),
    );
    var request_body = jsonEncode(
        body
    );
    var response = await client.post(
      uri,
      body: request_body,
      headers: {
        'Authorization': 'Bearer $token',
        "content-type": "application/json"
      },
    );
    // var json = jsonDecode(utf8.decode(response.bodyBytes));
    if(response.statusCode == 200){
      var json = jsonDecode(utf8.decode(response.bodyBytes));
      print("%%%%%%%%%%%%%%%%%===================================================))))))))))))))))))");
      print(json);
      print("%%%%%%%%%%%%%%%%%===================================================))))))))))))))))))");
      return {"message": json['message'], "status": json['status']};
    }
    print("04||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||");
    print(response.body);
    print(response.statusCode);

    print("04||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||");
    return {};
    // return response.statusCode ?? 404;
  }

  Future<Map> delete_reserve_meal_food(Map body) async {
    var client = http.Client();
    var uri = Uri.parse(
      base_url+paths['delete_reserve_meal_food'].toString(),
    );
    var request_body = jsonEncode(
        body
    );
    var response = await client.post(
      uri,
      body: request_body,
      headers: {
        'Authorization': 'Bearer $token',
        "content-type": "application/json"
      },
    );
    // var json = jsonDecode(utf8.decode(response.bodyBytes));
    if(response.statusCode == 200){
      var json = jsonDecode(utf8.decode(response.bodyBytes));
      print("%%%%%%%%%%%%%%%%%===================================================))))))))))))))))))");
      print(json['data']);
      print("%%%%%%%%%%%%%%%%%===================================================))))))))))))))))))");
      return {"message": json['message'], "status": json['status']};//json['data'];
    }
    print("04||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||");
    print(response.toString());
    print(response.statusCode);

    print("04||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||");
    return {};
    // return response.statusCode ?? 404;
  }

  Future<Map> get_forgotten_code(Map body) async {
    var client = http.Client();
    var uri = Uri.parse(
      base_url+paths['get_forgotten_code'].toString(),
    );
    var request_body = jsonEncode(
        body
    );
    var response = await client.post(
      uri,
      body: request_body,
      headers: {
        'Authorization': 'Bearer $token',
        "content-type": "application/json"
      },
    );
    // var json = jsonDecode(utf8.decode(response.bodyBytes));
    if(response.statusCode == 200){
      var json = jsonDecode(utf8.decode(response.bodyBytes));
      print("%%%%%%%%%%%%%%%%%===================================================))))))))))))))))))");
      print(json['data']);
      print("%%%%%%%%%%%%%%%%%===================================================))))))))))))))))))");
      return json['data'];
    }
    print("04||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||");
    print(response.body);
    print(response.statusCode);

    print("04||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||");
    return {};
    // return response.statusCode ?? 404;
  }

  Future<Map> record_feedback(Map body) async {
    var client = http.Client();
    var uri = Uri.parse(
      base_url+paths['record_feedback'].toString(),
    );
    var request_body = jsonEncode(
        body
    );
    var response = await client.post(
      uri,
      body: request_body,
      headers: {
        'Authorization': 'Bearer $token',
        "content-type": "application/json"
      },
    );
    // var json = jsonDecode(utf8.decode(response.bodyBytes));
    if(response.statusCode == 200){
      var json = jsonDecode(utf8.decode(response.bodyBytes));
      print("%%%%%%%%%%%%%%%%%===================================================))))))))))))))))))");
      print(json);
      print(request_body);
      print("%%%%%%%%%%%%%%%%%===================================================))))))))))))))))))");
      return {"status": json['status'], "message": json['message']};
    }
    print("04||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||");
    print(response.body);
    print(response.statusCode);

    print("04||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||");
    return {"status": false, "message": ""};
    // return response.statusCode ?? 404;
  }

  Future<Map> reserve_status(Map body) async {
    var client = http.Client();
    var uri = Uri.parse(
      base_url+paths['reserve_status'].toString(),
    );
    var request_body = jsonEncode(
        body
    );
    // print("Bearer "+Hive.box('settings').get('TOKEN').toString());
    var response = await client.post(
      uri,
      body: request_body,
      headers: {
        'Authorization': 'Bearer $token',
        "content-type": "application/json"
      },
    );
    print("===================================================))))))))))))))))))");
    var json = jsonDecode(utf8.decode(response.bodyBytes));
    print(json);
    print("===================================================))))))))))))))))))");
    print(response.body);
    print("===================================================))))))))))))))))))");
    // print(response);
    // print(response.statusCode);
    // // print(response.body);
    // // print(response.body);
    // // print(response.toString());
    // print("===================================================))))))))))))))))))");
    if(response.statusCode == 200){
      var json = jsonDecode(utf8.decode(response.bodyBytes));
      // if(body['isWeekly'] == false){
      //   Hive.box('cache').put('meeting_items_in_region__notWeekly', json['data']['meetings']);
      // } else{
      //   Hive.box('cache').put('meeting_items_in_region', json['data']['meetings']);
      // }

      print("%%%%%%%%%%%%%%%%%===================================================))))))))))))))))))");
      // print(json);
      print(json['data']);
      print("%%%%%%%%%%%%%%%%%===================================================))))))))))))))))))");
      return json['data'];
    }
    return {};
    // return response.statusCode ?? 404;
  }

  Future<Map> result_feedback(Map body) async {
    var client = http.Client();
    var uri = Uri.parse(
      base_url+paths['result_feedback'].toString(),
    );
    var request_body = jsonEncode(
        body
    );
    var response = await client.post(
      uri,
      body: request_body,
      headers: {
        'Authorization': 'Bearer $token',
        "content-type": "application/json"
      },
    );
    // var json = jsonDecode(utf8.decode(response.bodyBytes));
    if(response.statusCode == 200){
      var json = jsonDecode(utf8.decode(response.bodyBytes));
      print("%%%%%%%%%%%%%%%%%===================================================))))))))))))))))))");
      print(json);
      print(request_body);
      print("%%%%%%%%%%%%%%%%%===================================================))))))))))))))))))");
      return json;
    }
    print("04||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||");
    print(response.body);
    print(response.statusCode);

    print("04||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||");
    return {"status": false, "message": "", };
    // return response.statusCode ?? 404;
  }

  Future<List> list_result_feedback(Map body) async {
    var client = http.Client();
    var uri = Uri.parse(
      base_url+paths['list_result_feedback'].toString(),
    );
    var request_body = jsonEncode(
        body
    );
    // print("Bearer "+Hive.box('settings').get('TOKEN').toString());
    var response = await client.post(
      uri,
      body: request_body,
      headers: {
        'Authorization': 'Bearer $token',
        "content-type": "application/json"
      },
    );
    // print("===================================================))))))))))))))))))");
    var json = jsonDecode(utf8.decode(response.bodyBytes));
    // print(json);
    print("===================================================))))))))))))))))))");
    print(request_body);
    print("===================================================))))))))))))))))))");
    // print(response);
    // print(response.statusCode);
    // // print(response.body);
    // // print(response.body);
    // // print(response.toString());
    // print("===================================================))))))))))))))))))");
    if(response.statusCode == 200){
      var json = jsonDecode(utf8.decode(response.bodyBytes));
      // if(body['isWeekly'] == false){
      //   Hive.box('cache').put('meeting_items_in_region__notWeekly', json['data']['meetings']);
      // } else{
      //   Hive.box('cache').put('meeting_items_in_region', json['data']['meetings']);
      // }

      print("%%%%%%%%%%%%%%%%%===================================================))))))))))))))))))");
      // print(json);
      print(json['data']);
      print("%%%%%%%%%%%%%%%%%===================================================))))))))))))))))))");
      return json['data'];
    }
    return [];
    // return response.statusCode ?? 404;
  }


  Future<Map> get_meal_foods_weekly(int date_code) async {
    var client = http.Client();
    var uri = Uri.parse(
      base_url+paths['get_turns_weekly'].toString(),
    );
    var request_body = jsonEncode(
        {
          "date_code":date_code,
        }
    );
    // print("Bearer "+Hive.box('settings').get('TOKEN').toString());
    var response = await client.post(
      uri,
      body: request_body,
      headers: {
        'Authorization': 'Bearer $token',
        "content-type": "application/json"
      },
    );
    // print("===================================================))))))))))))))))))");
    var json = jsonDecode(utf8.decode(response.bodyBytes));
    // print(json);
    // print("===================================================))))))))))))))))))");
    // print(response.body);
    // print("===================================================))))))))))))))))))");
    // // print(response);
    // print(response.statusCode);
    // // print(response.body);
    // // print(response.body);
    // // print(response.toString());
    // print("===================================================))))))))))))))))))");
    if(response.statusCode == 200){
      var json = jsonDecode(utf8.decode(response.bodyBytes));
      // if(body['isWeekly'] == false){
      //   Hive.box('cache').put('meeting_items_in_region__notWeekly', json['data']['meetings']);
      // } else{
      //   Hive.box('cache').put('meeting_items_in_region', json['data']['meetings']);
      // }
      //
      // print("%%%%%%%%%%%%%%%%%===================================================))))))))))))))))))");
      // // print(json);
      // print(json['data']);
      // print("%%%%%%%%%%%%%%%%%===================================================))))))))))))))))))");
      return json['data'];
    }
    return {};
    // return response.statusCode ?? 404;
  }

}




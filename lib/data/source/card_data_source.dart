import 'dart:convert';
import '../../common/http_client.dart';
import '../../data/common/http_response_validator.dart';
import '../card.dart';
import 'package:http/http.dart' as http;


abstract class ICardDataSource {
  Future<List<CardEntity>> get_user_cards();
  Future<Map> card_registration(Map body);
  Future<Map> change_cart_activation(Map body);


}

class CardRemoteDataSource with HttpResponseValidator implements ICardDataSource {
  // final Dio httpClient;
  static const Map paths = {
    'get_user_cards': 'user/cards/',
    'card_registration': "user/user-forgotten-cart/",
    'change_cart_activation': "user/change-cart-activation/"
  };
  // String token = Hive.box('settings').get('TOKEN', defaultValue: "").toString();

  CardRemoteDataSource(httpClient);

  // MealFoodRemoteDataSource(this.httpClient);
  @override
  Future<List<CardEntity>> get_user_cards() async {
    // final response = await httpClient.get('product/list?sort=$sort');
    // var client = http.Client();
    var uri = Uri.parse(
      base_api_service_url+paths['get_user_cards'].toString(),
    );

    var response = await http.Client().get(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        "content-type": "application/json"
      },
    );

    validateResponse(response);

    var json = jsonDecode(utf8.decode(response.bodyBytes));

    final user_cards = <CardEntity>[];
    (json['data']as List).forEach((element) {
      // meal_foods.add(MealFoodEntity.fromJson(element));
      user_cards.add(card_builder(element));
    });
    return user_cards;
  }

  Future<Map> card_registration(Map body) async {
    var uri = Uri.parse(
      base_api_service_url+paths['card_registration'].toString(),
    );
    var request_body = jsonEncode(body);
    var response = await http.Client().post(
      uri,
      body: request_body,
      headers: {
        'Authorization': 'Bearer $token',
        "content-type": "application/json"
      },
    );
    print("===================================================))))))))))))))))))");
    print(body);
    print("===================================================))))))))))))))))))");
    print(response);
    print("===================================================))))))))))))))))))");
    print(response.body);
    print("===================================================))))))))))))))))))");
    print(response.statusCode);
    print("===================================================))))))))))))))))))");
    validateResponse(response);

    var json = jsonDecode(utf8.decode(response.bodyBytes));
    // if(response.statusCode == 200){
    //   var json = jsonDecode(utf8.decode(response.bodyBytes));
    //   // if(body['isWeekly'] == false){
    //   //   Hive.box('cache').put('meeting_items_in_region__notWeekly', json['data']['meetings']);
    //   // } else{
    //   //   Hive.box('cache').put('meeting_items_in_region', json['data']['meetings']);
    //   // }
    //
    //   print("%%%%%%%%%%%%%%%%%===================================================))))))))))))))))))");
    //   print(json);
    //   // print(json['access']);
    //   print("%%%%%%%%%%%%%%%%%===================================================))))))))))))))))))");
    //   // return {"status_code":response.statusCode, "token": json['access'] as String};
    //
    //
    // }
    // else{
    //   var json = jsonDecode(utf8.decode(response.bodyBytes));
    //   return{"status_code":response.statusCode, "message": json['datail']};
    // }
    // return response.statusCode ?? 404;
    if(json['data']['status'] == false){
      return {"status":false, "message": json['data']['message']};
    }else{
      return {"status":true, "message": json['data']['message']};
    }
  }

  Future<Map> change_cart_activation(Map body) async {
    var uri = Uri.parse(
      base_api_service_url+paths['change_cart_activation'].toString(),
    );
    var request_body = jsonEncode(body);
    var response = await http.Client().put(
      uri,
      body: request_body,
      headers: {
        'Authorization': 'Bearer $token',
        "content-type": "application/json"
      },
    );
    print("===================================================))))))))))))))))))");
    print(body);
    print("===================================================))))))))))))))))))");
    print(response);
    print("===================================================))))))))))))))))))");
    print(response.body);
    print("===================================================))))))))))))))))))");
    print(response.statusCode);
    print("===================================================))))))))))))))))))");
    validateResponse(response);

    var json = jsonDecode(utf8.decode(response.bodyBytes));
    if(json['status'] == false){
      return {"status":false, "message": json['message']};
    }else{
      return {"status":true, "message": json['message']};
    }
  }
}





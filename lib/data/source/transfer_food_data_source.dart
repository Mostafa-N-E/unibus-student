import 'dart:convert';
import 'package:flutter/cupertino.dart';
import '../../common/http_client.dart';
import '../../data/common/http_response_validator.dart';
import '../../data/meal_food.dart';
import 'package:http/http.dart' as http;


abstract class ITransferFoodDataSource {
  Future<List<SelfServiceEntity>> get_list_available_self_service(Map body);
  Future<Map> request(Map body);
  Future<Map> pre_create_request(Map body);
  Future<Map> delete_request(Map body);


}

class TransferFoodRemoteDataSource with HttpResponseValidator implements ITransferFoodDataSource {
  // final Dio httpClient;
  static const Map paths = {
    'get_list_available_self_service': 'transfer/available-self-service/',
    'request': 'transfer/request/',
    'pre_create_request': 'transfer/pre-request/',
    'delete_request': 'transfer/delete/',

  };
  // String token = Hive.box('settings').get('TOKEN', defaultValue: "").toString();

  TransferFoodRemoteDataSource(httpClient);

  // MealFoodRemoteDataSource(this.httpClient);
  @override
  Future<List<SelfServiceEntity>> get_list_available_self_service(Map body) async {
    // final response = await httpClient.get('product/list?sort=$sort');
    // var client = http.Client();
    var uri = Uri.parse(
      base_api_service_url+paths['get_list_available_self_service'].toString(),
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
    print(request_body);
    debugPrint(response.body);
    debugPrint("===================================================))))))))))))))))))");

    validateResponse(response);

    var json = jsonDecode(utf8.decode(response.bodyBytes));

    final available_self_service = <SelfServiceEntity>[];
    (json['data'] as List).forEach((element) {
      available_self_service.add(self_service_builder(element));
    });
    return available_self_service;
  }

  @override
  Future<Map> request(Map body) async {
    var client = http.Client();
    var uri = Uri.parse(
      base_api_service_url+paths['request'].toString(),
    );
    print("===================================================))))))))))))))))))===================================================))))))))))))))))))");
    print(body);
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
    print(request_body);
    debugPrint(response.body);
    debugPrint("===================================================))))))))))))))))))");

    validateResponse(response);

    var json = jsonDecode(utf8.decode(response.bodyBytes));

    if(json['status']){
      return {"message": json['data']['message'], "status": json['data']['status']};
    }else{
      return {"message": json['message'], "status": json['status']};
    }
  }

  @override
  Future<Map> pre_create_request(Map body) async {
    var client = http.Client();
    var uri = Uri.parse(
      base_api_service_url+paths['pre_create_request'].toString(),
    );
    print("===================================================))))))))))))))))))===================================================))))))))))))))))))");
    print(body);
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
    print(request_body);
    debugPrint(response.body);
    debugPrint("===================================================))))))))))))))))))");

    validateResponse(response);

    var json = jsonDecode(utf8.decode(response.bodyBytes));

    if(json['status']){
      return {"message": json['message'], "status": true};
    }else{
      print("}}}}}}}}}}}}}}}}}}}{{{{{{{{{{{{{{{{{{{{{{{{{{{{__________");
      print(json);
      return {"state": json['data']['state'], "message": json['message'], "status": false, "transferMealFoodRequest_id": json['data']['transferMealFoodRequest_id']};
    }
  }

  @override
  Future<Map> delete_request(Map body) async {
    var client = http.Client();
    var uri = Uri.parse(
      base_api_service_url+paths['delete_request'].toString(),
    );
    print("||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||");
    print(body);
    var request_body = jsonEncode(
        body
    );
    var response = await client.delete(
      uri,
      body: request_body,
      headers: {
        'Authorization': 'Bearer $token',
        "content-type": "application/json"
      },
    );
    print("||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||");
    print(request_body);
    debugPrint(response.body);
    debugPrint("||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||");

    validateResponse(response);

    var json = jsonDecode(utf8.decode(response.bodyBytes));
    print("||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||");
    print(json);
    debugPrint("||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||");
    return {"message": json['message'], "status": json['status']};
  }
}





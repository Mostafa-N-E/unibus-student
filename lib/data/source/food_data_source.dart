

import 'dart:convert';
// import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import '../../common/http_client.dart';


class Food_API {
  // static const String base_url = 'http://rajaeebusservice.pythonanywhere.com/api/';
  static const Map paths = {
    'add_favorite': 'food/add-favorite/',
    'remove_favorite': 'food/remove-favorite/',

  };
  // String token = Hive.box('settings').get('TOKEN').toString();

  Future<Map> add_favorite(Map body) async {
    var client = http.Client();
    var uri = Uri.parse(
      base_api_service_url+paths['add_favorite'].toString(),
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
      print(json);
      print("%%%%%%%%%%%%%%%%%===================================================))))))))))))))))))");
      return json;
    }
    return {};
    // return response.statusCode ?? 404;
  }

  Future<Map> remove_favorite(Map body) async {
    var client = http.Client();
    var uri = Uri.parse(
      base_api_service_url+paths['remove_favorite'].toString(),
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
      print(json);
      print("%%%%%%%%%%%%%%%%%===================================================))))))))))))))))))");
      return json;
    }
    return {};
    // return response.statusCode ?? 404;
  }
}

import 'dart:convert';

// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';
// import 'package:malakut/Screens/Map/services/map_api.dart';
// import 'package:malakut/Screens/Map/utils/place.dart';
// import 'package:malakut/Screens/Meeting/Widgets/meeting_widgets.dart';
import 'package:http/http.dart' as http;

import '../../common/http_client.dart';
import '../common/http_response_validator.dart';
import '../turn.dart';


abstract class ITurnDataSource {
  Future<List<TurnEntity>> turns(Map body);
  Future<Map> get_turns_weekly(int date_code);
  Future<Map> reserve(Map body);
  Future<Map> delete_reserve(Map body);
  Future<Map> result_feedback(Map body);
  Future<Map> record_feedback(Map body);


}

class TurnRemoteDataSource with HttpResponseValidator implements ITurnDataSource {
  static const Map paths = {
    'get_turns_weekly': 'bus/turn/week-turn/',
    'turns': 'bus/turn/get-turns/',
    'getting_on_bus__main_travelers':"bus/turn/getting-on-bus-main/",
    'getting_on_bus__additional_travelers':"bus/turn/getting-on-bus-additional/",

    "reserve": "bus/turn/reserve-turn/",
    "delete_reserve": "bus/turn/delete-reserve-turn/",
    "record_feedback": "bus/turn/record-feedback/",
    "result_feedback": "bus/turn/record-feedback/"

  };
  TurnRemoteDataSource(httpClient);

  Future<Map> get_turns_weekly(int date_code) async {
    var client = http.Client();
    var uri = Uri.parse(
      base_api_service_url+paths['get_turns_weekly'].toString(),
    );
    var request_body = jsonEncode(
        {
          "date_code":date_code,
        }
    );
    print("Bearer "+Hive.box('settings').get('TOKEN').toString());
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

  Future<List<TurnEntity>> turns(Map body) async {
    var client = http.Client();
    var uri = Uri.parse(
      base_api_service_url+paths['turns'].toString(),
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
    print("TTTTTTTTTTTTTTTTTTT===================================================))))))))))))))))))");
    // var json = jsonDecode(utf8.decode(response.bodyBytes));
    // print(json);
    print("TTTTTTTTTTTTTTTTTTT===================================================))))))))))))))))))");
    print(response.body);
    print("TTTTTTTTTTTTTTTTTTT===================================================))))))))))))))))))");
    // print(response);
    print(response.statusCode);
    // // print(response.body);
    // // print(response.body);
    // // print(response.toString());
    print("TTTTTTTTTTTTTTTTTTT===================================================))))))))))))))))))");
    if(response.statusCode == 200){
      var json = jsonDecode(utf8.decode(response.bodyBytes));
      List<TurnEntity> turn_items = [];
      for (var item in json['data']['turns'])
        turn_items.add(turn_builder(item));
      return turn_items;
    }
    return [];
    // return response.statusCode ?? 404;
  }

  Future<Map> reserve(Map body) async {
    var client = http.Client();
    var uri = Uri.parse(
      base_api_service_url+paths['reserve'].toString(),
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

  Future<Map> delete_reserve(Map body) async {
    var client = http.Client();
    var uri = Uri.parse(
      base_api_service_url+paths['delete_reserve'].toString(),
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

  Future<Map> record_feedback(Map body) async {
    var client = http.Client();
    var uri = Uri.parse(
      base_api_service_url+paths['record_feedback'].toString(),
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

  Future<Map> result_feedback(Map body) async {
    var client = http.Client();
    var uri = Uri.parse(
      base_api_service_url+paths['result_feedback'].toString(),
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



}

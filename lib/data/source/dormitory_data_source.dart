import 'dart:convert';

// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';
// import 'package:malakut/Screens/Map/services/map_api.dart';
// import 'package:malakut/Screens/Map/utils/place.dart';
// import 'package:malakut/Screens/Meeting/Widgets/meeting_widgets.dart';
import 'package:http/http.dart' as http;

import '../../common/http_client.dart';
import '../common/http_response_validator.dart';
import '../dormitory.dart';
import '../turn.dart';


abstract class IDormitoryDataSource {
  Future<List<Dormitory>> list();



}

class DormitoryRemoteDataSource with HttpResponseValidator implements IDormitoryDataSource {
  DormitoryRemoteDataSource(httpClient);
  static const Map paths = {
    // 'get_meal_foods_weekly': 'meal/get-meal-foods/',
    'list': 'dormitory/get-dormitories/',

  };

  Future<List<Dormitory>> list() async {
    var client = http.Client();
    var uri = Uri.parse(
      base_api_service_url+paths['list'].toString(),
    );
    var response = await client.post(
      uri,
      headers: {
        // 'Authorization': 'Bearer $token',
        "content-type": "application/json"
      },
    );
    if(response.statusCode == 200){
      var json = jsonDecode(utf8.decode(response.bodyBytes));
      List<Dormitory> dormitory_items = [];
      for (var item in json['data'])
        dormitory_items.add(dormitory_builder(item));

      print("%%%%%%%%%%%%%%%%%===================================================))))))))))))))))))");
      print(uri);
      print("%%%%%%%%%%%%%%%%%===================================================))))))))))))))))))");
      print(json);
      print("%%%%%%%%%%%%%%%%%===================================================))))))))))))))))))");
      print(dormitory_items);
      print("%%%%%%%%%%%%%%%%%===================================================))))))))))))))))))");
      print("%%%%%%%%%%%%%%%%%===================================================))))))))))))))))))");
      print("%%%%%%%%%%%%%%%%%===================================================))))))))))))))))))");


      return dormitory_items;
    }
    return [];
    // return response.statusCode ?? 404;
  }



}

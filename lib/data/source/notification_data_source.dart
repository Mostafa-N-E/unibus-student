import 'dart:convert';
import 'package:flutter/cupertino.dart';
import '../../common/http_client.dart';
import '../../data/common/http_response_validator.dart';
import 'package:http/http.dart' as http;

import '../notification.dart';


abstract class INotificationDataSource {
  Future<List<NotificationEntity>> get_public_notifications(Map body);


}

class NotificationRemoteDataSource with HttpResponseValidator implements INotificationDataSource {
  // final Dio httpClient;
  static const Map paths = {
    'get_public_notifications': 'public-notifications/list/',

  };
  // String token = Hive.box('settings').get('TOKEN', defaultValue: "").toString();

  NotificationRemoteDataSource(httpClient);

  // MealFoodRemoteDataSource(this.httpClient);
  @override
  Future<List<NotificationEntity>> get_public_notifications(Map body) async {
    // final response = await httpClient.get('product/list?sort=$sort');
    // var client = http.Client();
    var uri = Uri.parse(
      base_api_service_url+paths['get_public_notifications'].toString(),
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
    //     "totalcount": 2,
    //     "notifications": [
    //       {
    //         "id": 1,
    //         "title": "تغییر زمانبندی وعده های غذایی",
    //         "message": "dcawdcwd",
    //         "publish": "2023-04-04",
    //         "image": null,
    //         "created": "2023-04-04T11:20:42.204152+03:30",
    //         "status": 1,
    //         "type": 2,
    //         "related_system": 0
    //       },
    //       {
    //         "id": 1,
    //         "title": "جابجایی برخی غذا ها در برنامه",
    //         "message": "dcawdcwd",
    //         "publish": "2023-04-04",
    //         "image": null,
    //         "created": "2023-04-04T11:20:42.204152+03:30",
    //         "status": 1,
    //         "type": 2,
    //         "related_system": 0
    //       }
    //     ]
    //   },
    //   "code": 200,
    //   "status": true
    // };
    // ------
    final public_notifications = <NotificationEntity>[];
    (json['data']['notifications']as List).forEach((element) {
      // meal_foods.add(MealFoodEntity.fromJson(element));
      public_notifications.add(notification_builder(element));
    });
    return public_notifications;
  }

}





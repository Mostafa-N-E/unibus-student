import 'dart:convert';
import 'package:flutter/cupertino.dart';
import '../../common/exceptions.dart';
import '../../data/auth_info.dart';
import '../../data/common/http_response_validator.dart';
import 'package:http/http.dart' as http;

import '../../common/http_client.dart';

abstract class IAuthDataSource {
  Future<AuthInfo> login(String username, String password);
  Future<UserInfo> user_info();
  Future<AuthInfo> refreshToken(String token);
  Future<Map> password_reset(Map body);
  Future<Map> logout();
}

class AuthRemoteDataSource
    with HttpResponseValidator
    implements IAuthDataSource {
  // final Dio httpClient;

  AuthRemoteDataSource(httpClient);

  static const Map paths = {
    'login': 'token/',
    'refreshToken':"token/refresh/",
    "user_info": "user/user-info/",
    "change_password": "user/change_password/",
    "logout": "logout/"

  };
  // String token = Hive.box('settings').get('TOKEN', defaultValue: "").toString();

  @override
  Future<AuthInfo> login(String username, String password) async {
    var uri = Uri.parse(
      base_api_service_url+paths['login'].toString(),
    );
    var request_body = jsonEncode({
      "id": username,
      "password": password
    });
    var response = await http.Client().post(
      uri,
      body: request_body,
      headers: {
        // 'Authorization': 'Bearer $token',
        // "Access-Control-Allow-Origin": "http://localhost:8000",
        // 'Access-Control-Allow-Credentials': 'true',
        "content-type": "application/json"
      },
    );
    // print("===================================================))))))))))))))))))");
    // print(response);
    // debugPrint(response.body);
    // debugPrint("===================================================))))))))))))))))))");

    validateResponse(response);

    var json = jsonDecode(utf8.decode(response.bodyBytes));

    validateResponse(response);
    if(json['status'] == true){
      return AuthInfo(json['data']["access"], json['data']["refresh"]);
    }else{
      throw AppException(message: json['message']);
    }
  }

  @override
  Future<AuthInfo> refreshToken(String refresh_token) async {

    var uri = Uri.parse(
      base_api_service_url+paths['refreshToken'].toString(),
    );
    var request_body = jsonEncode({
      "refresh": refresh_token
    });
    var response = await http.Client().post(
      uri,
      body: request_body,
      headers: {
        // 'Authorization': 'Bearer $token',
        "content-type": "application/json"
      },
    );
    // print("===================================================))))))))))))))))))");
    // print(response);
    // debugPrint(response.body);
    // debugPrint("===================================================))))))))))))))))))");

    validateResponse(response);

    var json = jsonDecode(utf8.decode(response.bodyBytes));

    validateResponse(response);

    return AuthInfo(
        json["access"], refresh_token);
  }

  @override
  Future<UserInfo> user_info() async {
    var uri = Uri.parse(
      base_api_service_url+paths['user_info'].toString(),
    );
    print("(((((((((((((((((((===================================================))))))))))))))))))");
    print(token);
    debugPrint("(((((((((((((((((((===================================================))))))))))))))))))");
    var response = await http.Client().get(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        "content-type": "application/json"
      },
    );


    validateResponse(response);

    var json = jsonDecode(utf8.decode(response.bodyBytes));

    // Map json = {
    //   "message": "",
    //   "data": {
    //     "id": 1111231137,
    //     "password": "",
    //     "last_login": null,
    //     "is_superuser": false,
    //     "email": "",
    //     "active": true,
    //     "staff": true,
    //     "admin": false,
    //     "time_stamp": "13:47:57.505082",
    //     "first_name": "",
    //     "last_name": "",
    //     "major": null,
    //     "dormitory": 1,
    //     "credit_amount": 0,
    //     "phone_number": null,
    //     "gender": null,
    //     "city": null,
    //     "main_card": null,
    //     "forgotten_card": null,
    //     "groups": [],
    //     "user_permissions": []
    //   },
    //   "code": 200,
    //   "status": true
    // };

    return user_info_builder(json['data']);
  }

  @override
  Future<Map> password_reset(Map body) async {
    //change_password

    var uri = Uri.parse(
      base_api_service_url+paths['change_password'].toString(),
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
    // print("===================================================))))))))))))))))))");
    // print(response);
    // debugPrint(response.body);
    // debugPrint("===================================================))))))))))))))))))");

    validateResponse(response);

    var json = jsonDecode(utf8.decode(response.bodyBytes));

    validateResponse(response);

    if(json['status'] == false){
      return {"status":false, "message": json['message']};
    }else{
      return {"status":true, "message": json['message']};
    }
  }

  @override
  Future<Map> logout() async {
    var uri = Uri.parse(
      base_api_service_url+paths['logout'].toString(),
    );
    print("(((((((((((((((((((===================================================))))))))))))))))))");
    print(token);
    debugPrint("(((((((((((((((((((===================================================))))))))))))))))))");
    var response = await http.Client().get(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        "content-type": "application/json"
      },
    );


    validateResponse(response);

    var json = jsonDecode(utf8.decode(response.bodyBytes));

    return json;
  }
}

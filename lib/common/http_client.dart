// import 'package:dio/dio.dart';

// final httpClient =
//     Dio(BaseOptions(baseUrl: 'http://expertdevelopers.ir/api/v1/'));
import 'package:http/http.dart' as http;
import '../data/auth_info.dart';

const String base_api_service_url = 'https://unimi.ir/api/'; //'http://127.0.0.1:8000/api/'; //
late final String token ;
final httpClient = http.Client();
// Map profile_data = {"id": 3991231137};
UserInfo global_userInfo = UserInfo(id:-1);
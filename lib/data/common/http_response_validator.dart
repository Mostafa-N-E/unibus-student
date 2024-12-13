// import 'package:dio/dio.dart';
import 'package:http/http.dart';
import '../../common/exceptions.dart';

mixin HttpResponseValidator{
  validateResponse(Response response) {
    print("HttpResponseValidator ===================================================))))))))))))))))))");
    // print(response);
    print(response.body);
    // print(response);
    print("HttpResponseValidator ===================================================))))))))))))))))))");
    if (response.statusCode != 200) {
      throw AppException(message: "خطا");
    }
  }
}
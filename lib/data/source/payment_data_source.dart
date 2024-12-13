import 'dart:convert';
import '../../common/http_client.dart';
import '../../data/common/http_response_validator.dart';
import '../card.dart';
import 'package:http/http.dart' as http;


abstract class IPaymentDataSource {
  Future<Map> go_to_gateway(Map body);


}

class PaymentRemoteDataSource with HttpResponseValidator implements IPaymentDataSource {
  // final Dio httpClient;
  static const Map paths = {
    'go_to_gateway': 'go-to-gateway/',
  };
  // String token = Hive.box('settings').get('TOKEN', defaultValue: "").toString();

  PaymentRemoteDataSource(httpClient);


  Future<Map> go_to_gateway(Map body) async {
    var uri = Uri.parse(
      base_api_service_url+paths['go_to_gateway'].toString(),
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
    if(json['status'] == false){
      return {"status":false, "message": json['message']};
    }else{
      return json;
    }
  }
}





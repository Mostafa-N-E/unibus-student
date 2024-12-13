import '../../common/http_client.dart';
import '../source/payment_data_source.dart';

final paymentRepository = PaymentRepository(PaymentRemoteDataSource(httpClient) as IPaymentDataSource);

abstract class IPaymentRepository {
  Future<Map> go_to_gateway(Map body);

}

class PaymentRepository implements IPaymentRepository {
  final IPaymentDataSource dataSource;

  PaymentRepository(this.dataSource);

  @override
  Future<Map> go_to_gateway(Map body) => dataSource.go_to_gateway(body);


}

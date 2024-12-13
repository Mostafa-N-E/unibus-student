import '../../common/http_client.dart';
import '../../data/activity_report.dart';
import '../card.dart';
import '../source/activity_report_data_source.dart';
import '../source/card_data_source.dart';

final cardRepository = CardRepository(CardRemoteDataSource(httpClient) as ICardDataSource);

abstract class ICardRepository {
  Future<List<CardEntity>> get_user_cards();
  Future<Map> card_registration(Map body);
  Future<Map> change_cart_activation(Map body);

// Future<List<ProductEntity>> search(String searchTerm);
}

class CardRepository implements ICardRepository {
  final ICardDataSource dataSource;

  CardRepository(this.dataSource);

  @override
  Future<List<CardEntity>> get_user_cards() => dataSource.get_user_cards();
  Future<Map> card_registration(Map body) => dataSource.card_registration(body);
  Future<Map> change_cart_activation(Map body) => dataSource.change_cart_activation(body);


}

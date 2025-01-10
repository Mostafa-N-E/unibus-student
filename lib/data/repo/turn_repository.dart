import '../../common/http_client.dart';
import '../source/turn_data_source.dart';
import '../turn.dart';
import '../../common/http_client.dart';

final turnRepository = TurnRepository(TurnRemoteDataSource(httpClient) as ITurnDataSource);

abstract class ITurnRepository {
  Future<List<TurnEntity>> turns(Map body);
  Future<Map> get_turns_weekly(int date_code);
  Future<Map> reserve(Map body);
  Future<Map> delete_reserve(Map body);
  Future<Map> result_feedback(Map body);
  Future<Map> record_feedback(Map body);

// Future<List<ProductEntity>> search(String searchTerm);
}

class TurnRepository implements ITurnRepository {
  final ITurnDataSource dataSource;

  TurnRepository(this.dataSource);

  @override
  Future<List<TurnEntity>> turns(Map body) => dataSource.turns(body);
  @override
  Future<Map> get_turns_weekly(int date_code) => dataSource.get_turns_weekly(date_code);
  @override
  Future<Map> reserve(Map body) => dataSource.reserve(body);
  @override
  Future<Map> delete_reserve(Map body) => dataSource.delete_reserve(body);
  @override
  Future<Map> result_feedback(Map body) => dataSource.result_feedback(body);
  @override
  Future<Map> record_feedback(Map body) => dataSource.record_feedback(body);


}

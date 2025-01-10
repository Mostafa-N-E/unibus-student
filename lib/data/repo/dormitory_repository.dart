import '../../common/http_client.dart';
import '../dormitory.dart';
import '../source/dormitory_data_source.dart';
import '../source/turn_data_source.dart';
import '../turn.dart';
import '../../common/http_client.dart';

final dormitoryRepository = DormitoryRepository(DormitoryRemoteDataSource(httpClient) as IDormitoryDataSource);

abstract class IDormitoryRepository {
  Future<List<Dormitory>> list();
}

class DormitoryRepository implements IDormitoryRepository {
  final IDormitoryDataSource dataSource;

  DormitoryRepository(this.dataSource);

  @override
  Future<List<Dormitory>> list() => dataSource.list();

}

import '../../common/http_client.dart';
import '../notification.dart';
import '../source/notification_data_source.dart';

final notificationRepository = NotificationRepository(NotificationRemoteDataSource(httpClient) as INotificationDataSource);

abstract class INotificationRepository {
  Future<List<NotificationEntity>> get_public_notifications(Map body);


// Future<List<ProductEntity>> search(String searchTerm);
}

class NotificationRepository implements INotificationRepository {
  final INotificationDataSource dataSource;

  NotificationRepository(this.dataSource);

  @override
  Future<List<NotificationEntity>> get_public_notifications(Map body) => dataSource.get_public_notifications(body);



}

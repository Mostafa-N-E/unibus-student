


class NotificationEntity{
  final int id;
  final String title;
  final String message;
  final String image;
  final String publish;
  final int status;
  final int type;
  final int related_system;

  NotificationEntity({
    required this.id,
    this.title = "",
    this.message = "",
    this.image = "",
    this.publish = "",
    this.status = 0,
    this.type = 2,
    this.related_system = 0,

  });

  static Map<String, List<NotificationEntity>> get_notifications_dased_on_type(List<NotificationEntity> notifications){
    List<NotificationEntity> food_system = [];
    List<NotificationEntity> bus_system = [];
    List<NotificationEntity> dormitory_system = [];
    for(var notification in notifications){
      switch(notification.related_system){
        case 1:
          food_system.add(notification);
          break;
        case 2:
          bus_system.add(notification);
          break;
        case 3:
          dormitory_system.add(notification);
          break;
      }
    }
    return {
      "food_system": food_system,
      "bus_system": bus_system,
      "dormitory_system": dormitory_system,
    };
    // for(var i in this.like){
    //
    // }
    // for(var i in this.dislike){
    //   if(id.toInt() == i.toInt()){
    //     this.user_vote = 2;
    //     print("user_vote  dislike ???????????????????????????????????????????????????");
    //     return 2;
    //   }
    // }
    // this.user_vote = -1;
    // return -1;
  }


}

NotificationEntity notification_builder(Map data){
  return NotificationEntity(
    id: data['id'],
    title: data['title'] ?? "",
    message: data['message'] ?? "",
    image: data['image'] ?? "",
    publish: data['publish'] ?? "",
    status: data['status'] ?? 0,
    type: data['type'] ?? 2,
    related_system: data['related_system'] ?? 0,

  );
}




class UserNotificationEntity{
  final int id;
  final int user;
  final String title;
  final String message;
  final String image;
  final String created;
  final bool seen;
  final int type;

  UserNotificationEntity({
    required this.id,
    required this.user,
    this.title = "",
    this.message = "",
    this.image = "",
    this.created = "",
    this.seen = false,
    this.type = 2,

  });

}

UserNotificationEntity user_notification_builder(Map data){
  return UserNotificationEntity(
    id: data['id'],
    user: data['user'],
    title: data['title'] ?? "",
    message: data['message'] ?? "",
    image: data['image'] ?? "",
    created: data['created'] ?? "",
    seen: data['seen'] ?? 0,
    type: data['type'] ?? 2,

  );
}
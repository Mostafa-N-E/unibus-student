import 'meal_food.dart';

abstract class UserActivityEntity{
  final int user;
  final String date;
  final String time;
  final String created;
  final bool status;
  final int activity_type_int;

  UserActivityEntity({
    required this.user,
    required this.activity_type_int,
    this.date = "",
    this.time = "",
    this.created = "",
    this.status = true,
  });

}



class FoodSystemUserActivityEntity extends UserActivityEntity {
  final MealFoodEntity meal_food;
  final String activity_type;

  FoodSystemUserActivityEntity({
    required int user,
    String date = "",
    String time = "",
    String created = "",
    bool status = true,
    required int activity_type_int,


    required this.meal_food,
    this.activity_type = "",

  }) : super(user: user, activity_type_int: activity_type_int, date: date, time: time, created: created, status: status);

}

class BusSystemUserActivityEntity extends UserActivityEntity {
  // final TurnEntity turn;
  final String activity_type;

  BusSystemUserActivityEntity({
    required int user,
    required int activity_type_int,
    String date = "",
    String time = "",
    String created = "",
    bool status = true,

    // required this.turn,
    this.activity_type = "",

  }) : super(user: user, activity_type_int: activity_type_int, date: date, time: time, created: created, status: status);

}

class DormitorySystemUserActivityEntity extends UserActivityEntity {
  // final TurnEntity turn;
  final String activity_type;

  DormitorySystemUserActivityEntity({
    required int user,
    required int activity_type_int,
    String date = "",
    String time = "",
    String created = "",
    bool status = true,

    // required this.dormitory,
    this.activity_type = "",

  }) : super(user: user, activity_type_int: activity_type_int, date: date, time: time, created: created, status: status);

}

class FinancialUserActivityEntity extends UserActivityEntity {
  // final BankEntity bank;
  final String activity_type;
  // final int payment_tracking_code;

  FinancialUserActivityEntity({
    required int user,
    required int activity_type_int,
    String date = "",
    String time = "",
    String created = "",
    bool status = true,

    // required this.bank,
    this.activity_type = "",
    // this.payment_tracking_code = 0,
  }) : super(user: user, activity_type_int: activity_type_int, date: date, time: time, created: created, status: status);

}

class SystemUserActivityEntity extends UserActivityEntity {
  // final TurnEntity turn;
  final String activity_type;

  SystemUserActivityEntity({
    required int user,
    required int activity_type_int,
    String date = "",
    String time = "",
    String created = "",
    bool status = true,

    this.activity_type = "",


  }) : super(user: user, activity_type_int: activity_type_int, date: date, time: time, created: created, status: status);

}

FoodSystemUserActivityEntity food_system_user_activity_builder(Map data){
  return FoodSystemUserActivityEntity(
    user: data['user'],
    date: data['date'],
    time: data['time'],
    created: data['created'],
    status: data['status'],
    activity_type_int: data['activity_type_int'] ?? 0,

    activity_type: data['activity_type'],
    meal_food: meal_food__less_data_builder(data['meal_food']),

  );
}
BusSystemUserActivityEntity bus_system_user_activity_builder(Map data){
  return BusSystemUserActivityEntity(
    user: data['user'],
    date: data['date'] ?? "",
    time: data['time'] ?? "",
    created: data['created'] ?? "",
    status: data['status'],
    activity_type_int: data['activity_type_int'] ?? 0,

    activity_type: data['activity_type'],

  );
}
DormitorySystemUserActivityEntity dormitory_system_user_activity_builder(Map data){
  return DormitorySystemUserActivityEntity(
    user: data['user'],
    date: data['date'] ?? "",
    time: data['time'] ?? "",
    created: data['created'] ?? "",
    status: data['status'],
    activity_type_int: data['activity_type_int'] ?? 0,

    activity_type: data['activity_type'] ?? "",

  );
}

FinancialUserActivityEntity financial_user_activity_builder(Map data){
  return FinancialUserActivityEntity(
    user: data['user'],
    date: data['date'] ?? "",
    time: data['time'] ?? "",
    created: data['created'] ?? "",
    status: data['status'],
    activity_type_int: data['activity_type_int'],

    activity_type: data['activity_type'] ?? "",
    // payment_tracking_code: data['payment_tracking_code'],

  );
}
SystemUserActivityEntity system_user_activity_builder(Map data){
  return SystemUserActivityEntity(
    user: data['user'],
    date: data['date'] ?? "",
    time: data['time'] ?? "",
    created: data['created'] ?? "",
    status: data['status'],
    activity_type_int: data['activity_type_int'] ?? 0,

    activity_type: data['activity_type'] ?? "",

  );
}
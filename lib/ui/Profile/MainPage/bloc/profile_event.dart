part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}



class ProfileStarted extends ProfileEvent{
  const ProfileStarted();
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class ProfileRefresh extends ProfileEvent{
  const ProfileRefresh();
  @override
  // TODO: implement props
  List<Object?> get props => [];


}

class ProfileRefreshUserInfo extends ProfileEvent{
  final List<FoodSystemUserActivityEntity> user_food_system_activities;
  final List<BusSystemUserActivityEntity> user_bus_system_activities;
  final List<FinancialUserActivityEntity> user_financial_activities;
  final List<DormitorySystemUserActivityEntity> user_dormitory_system_activities;
  final List<SystemUserActivityEntity> user_system_activities;

  const ProfileRefreshUserInfo({required this.user_dormitory_system_activities, required this.user_bus_system_activities,required this.user_system_activities, required this.user_food_system_activities,required this.user_financial_activities,});
  @override
  // TODO: implement props
  List<Object?> get props => [];


}
class ProfileRefreshUserActivity extends ProfileEvent{
  final UserInfo user_info;

  const ProfileRefreshUserActivity({required this.user_info});
  @override
  // TODO: implement props
  List<Object?> get props => [];


}
// class ReserveFoodChangeDate extends ReserveFoodEvent{
//   final Jalali picked_date;
//
//   const ReserveFoodChangeDate(this.picked_date);
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => throw UnimplementedError();
// }
//
//
class ProfileFoodActivity extends ProfileEvent{
  final UserInfo user_info;
  const ProfileFoodActivity({required this.user_info});
  @override
  // TODO: implement props
  List<Object?> get props => [];


}
class ProfileBusActivity extends ProfileEvent{
  final List<FoodSystemUserActivityEntity> food_activities;
  final UserInfo user_info;
  const ProfileBusActivity({required this.food_activities, required this.user_info});
  @override
  // TODO: implement props
  List<Object?> get props => [];


}
class ProfileFinancialActivity extends ProfileEvent{
  final List<FoodSystemUserActivityEntity> food_activities;
  final UserInfo user_info;
  const ProfileFinancialActivity({required this.food_activities, required this.user_info});
  @override
  // TODO: implement props
  List<Object?> get props => [];


}



class UpdateProfileFoodActivity extends ProfileEvent{
  final int perPage;
  final UserInfo user_info;
  final List<FoodSystemUserActivityEntity> user_food_system_activities;
  final List<BusSystemUserActivityEntity> user_bus_system_activities;
  final List<FinancialUserActivityEntity> user_financial_activities;
  final List<DormitorySystemUserActivityEntity> user_dormitory_system_activities;
  final List<SystemUserActivityEntity> user_system_activities;

  const UpdateProfileFoodActivity({required this.perPage, required this.user_info, required this.user_dormitory_system_activities, required this.user_bus_system_activities,required this.user_system_activities, required this.user_food_system_activities,required this.user_financial_activities,});
  @override
  // TODO: implement props
  List<Object?> get props => [];


}
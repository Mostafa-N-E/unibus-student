part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

// class ProfileStarted extends ProfileState {
//   const ProfileStarted();
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [];
// }

class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}



class ProfileFirstLoading extends ProfileState {
  const ProfileFirstLoading();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProfileLoading extends ProfileState {
  final UserInfo user_info;


  const ProfileLoading({required this.user_info});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProfileError extends ProfileState {
  final AppException exception;
  const ProfileError({required this.exception});

  @override
  List<Object> get props => [exception];
}

class ProfileSuccess extends ProfileState{
  final List<FinancialUserActivityEntity> user_financial_activities;
  final List<SystemUserActivityEntity> user_system_activities;
  final List<FoodSystemUserActivityEntity> user_food_system_activities;
  final List<BusSystemUserActivityEntity> user_bus_system_activities;
  final List<DormitorySystemUserActivityEntity> user_dormitory_system_activities;

  final UserInfo user_info;
  // final int activity_type;

  const ProfileSuccess({required this.user_info, required this.user_system_activities, required this.user_financial_activities, required this.user_dormitory_system_activities, required this.user_food_system_activities, required this.user_bus_system_activities, });

  @override
  // TODO: implement props
  List<Object?> get props => [];


}

class ProfileFirstSuccess extends ProfileState {
  final UserInfo user_info;

  const ProfileFirstSuccess({required this.user_info});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProfileRefreshUserInfoLoading extends ProfileState{
  final List<FinancialUserActivityEntity> user_financial_activities;
  final List<FoodSystemUserActivityEntity> user_food_system_activities;
  final List<BusSystemUserActivityEntity> user_bus_system_activities;
  final List<DormitorySystemUserActivityEntity> user_dormitory_system_activities;
  final List<SystemUserActivityEntity> user_system_activities;

  const ProfileRefreshUserInfoLoading({required this.user_system_activities, required this.user_dormitory_system_activities, required this.user_financial_activities, required this.user_food_system_activities, required this.user_bus_system_activities, });

  @override
  // TODO: implement props
  List<Object?> get props => [];


}


class ProfileGetFoodSystemActivitiesSuccess extends ProfileState {
  final UserInfo user_info;
  final List<FoodSystemUserActivityEntity> user_food_system_activities;

  const ProfileGetFoodSystemActivitiesSuccess({required this.user_info, required this.user_food_system_activities});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProfileGetFoodAndBusSystemActivitiesSuccess extends ProfileState {
  final UserInfo user_info;
  final List<FoodSystemUserActivityEntity> user_food_system_activities;
  final List<BusSystemUserActivityEntity> user_bus_system_activities;


  const ProfileGetFoodAndBusSystemActivitiesSuccess({required this.user_info, required this.user_food_system_activities, required this.user_bus_system_activities});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProfileGetFinancialAndBusSystemActivitiesSuccess extends ProfileState {
  final UserInfo user_info;
  final List<FoodSystemUserActivityEntity> user_food_system_activities;
  final List<FinancialUserActivityEntity> user_financial_activities;


  const ProfileGetFinancialAndBusSystemActivitiesSuccess({required this.user_info, required this.user_food_system_activities, required this.user_financial_activities});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
part of 'reserve_food_bloc.dart';

abstract class ReserveFoodState extends Equatable {
  const ReserveFoodState();
}

class ReserveFoodInitial extends ReserveFoodState {
  @override
  List<Object> get props => [];
}

class ReserveFoodFirstLoading extends ReserveFoodState {
  final Jalali picked_date;
  const ReserveFoodFirstLoading({required this.picked_date, });

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ReserveFoodLoading extends ReserveFoodState {
  final int SelfServiceId;
  final Jalali picked_date;
  final List<SelfServiceEntity> self_services;


  const ReserveFoodLoading({required this.SelfServiceId, required this.picked_date, required this.self_services, });

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ReserveFoodError extends ReserveFoodState {
  final AppException exception;
  const ReserveFoodError({required this.exception});

  @override
  List<Object> get props => [exception];
}

class ReserveFoodSuccess extends ReserveFoodState{
  final List<MealFoodEntity> meal_foods;
  final List<SelfServiceEntity> self_services;
  final int SelfServiceId;
  final Jalali picked_date;

  const ReserveFoodSuccess({required this.meal_foods, required this.SelfServiceId, required this.picked_date, required this.self_services, });

  @override
  // TODO: implement props
  List<Object?> get props => [];


}

class ReserveFoodFirstSuccess extends ReserveFoodState {
  final List<SelfServiceEntity> self_services;
  final int SelfServiceId;
  final Jalali picked_date;
  const ReserveFoodFirstSuccess({required this.self_services, required this.SelfServiceId, required this.picked_date, });

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
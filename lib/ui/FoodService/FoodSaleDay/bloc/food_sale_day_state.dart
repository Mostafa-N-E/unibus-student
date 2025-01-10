part of 'food_sale_day_bloc.dart';

abstract class FoodSaleDayState extends Equatable {
  const FoodSaleDayState();
}

class FoodSaleDayInitial extends FoodSaleDayState {
  @override
  List<Object> get props => [];
}


class FoodSaleDayFirstLoading extends FoodSaleDayState {
  // final Jalali picked_date;
  const FoodSaleDayFirstLoading();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FoodSaleDayLoading extends FoodSaleDayState {
  final int SelfServiceId;
  // final Jalali picked_date;
  final List<SelfServiceEntity> self_services;


  const FoodSaleDayLoading({required this.SelfServiceId, required this.self_services, });

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FoodSaleDayError extends FoodSaleDayState {
  final AppException exception;
  const FoodSaleDayError({required this.exception});

  @override
  List<Object> get props => [exception];
}

class FoodSaleDaySuccess extends FoodSaleDayState{
  final List<MealFoodEntity> meal_foods;
  final List<SelfServiceEntity> self_services;
  final int SelfServiceId;
  // final Jalali picked_date;

  const FoodSaleDaySuccess({required this.meal_foods, required this.SelfServiceId, required this.self_services, });

  @override
  // TODO: implement props
  List<Object?> get props => [];


}

class FoodSaleDayFirstSuccess extends FoodSaleDayState {
  final List<SelfServiceEntity> self_services;
  final int SelfServiceId;
  // final Jalali picked_date;
  const FoodSaleDayFirstSuccess({required this.self_services, required this.SelfServiceId, });

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
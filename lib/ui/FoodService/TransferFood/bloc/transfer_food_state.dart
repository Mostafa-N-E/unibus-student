part of 'transfer_food_bloc.dart';

abstract class TransferFoodState extends Equatable {
  const TransferFoodState();
}

class TransferFoodInitial extends TransferFoodState {
  @override
  List<Object> get props => [];
}



class TransferFoodLoading extends TransferFoodState {
  final MealFoodEntity meal_food;

  const TransferFoodLoading({required this.meal_food, });

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class TransferFoodError extends TransferFoodState {
  final AppException exception;
  const TransferFoodError({required this.exception});

  @override
  List<Object> get props => [exception];
}

class TransferFoodSuccess extends TransferFoodState{
  final List<SelfServiceEntity> self_services;
  final int SelfServiceId;
  final MealFoodEntity meal_food;
  const TransferFoodSuccess({required this.SelfServiceId, required this.self_services, required this.meal_food, });

  @override
  // TODO: implement props
  List<Object?> get props => [];


}
class TransferFoodSuccessSubmitRequest extends TransferFoodState{
  final List<SelfServiceEntity> self_services;
  final int SelfServiceId;
  final MealFoodEntity meal_food;
  final Map response;

  const TransferFoodSuccessSubmitRequest({required this.SelfServiceId, required this.self_services, required this.meal_food, required this.response, });

  @override
  // TODO: implement props
  List<Object?> get props => [];


}
class TransferFoodNotAvailable extends TransferFoodState {
  final MealFoodEntity meal_food;

  const TransferFoodNotAvailable({required this.meal_food, });

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
//
// class TransferFoodFirstSuccess extends TransferFoodState {
//   final List<SelfServiceEntity> self_services;
//   final int SelfServiceId;
//   // final Jalali picked_date;
//   const FoodSaleDayFirstSuccess({required this.self_services, required this.SelfServiceId, });
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [];
// }
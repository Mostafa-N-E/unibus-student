part of 'detail_food_bloc.dart';

@immutable
abstract class DetailFoodState {
const  DetailFoodState();

@override
List<Object> get props => [];
}
class DetailFoodInitial extends DetailFoodState {}

class  DetailFoodLoading extends  DetailFoodState {}

class  DetailFoodError extends  DetailFoodState {
  final AppException exception;
  const  DetailFoodError({required this.exception});

  @override
  List<Object> get props => [exception];
}

class  DetailFoodSuccess extends  DetailFoodState{
  final MealFoodEntity meal_food;
  const  DetailFoodSuccess({required this.meal_food});

}

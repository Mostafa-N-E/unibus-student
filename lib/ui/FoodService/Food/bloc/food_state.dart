part of 'food_bloc.dart';

@immutable
abstract class FoodState {
  const FoodState();

  @override
  List<Object> get props => [];
}

class FoodInitial extends FoodState {}

class FoodLoading extends FoodState {}

class FoodError extends FoodState {
  final AppException exception;
  const FoodError({required this.exception});

  @override
  List<Object> get props => [exception];
}

class FoodSuccess extends FoodState{
  // final List<BannerEntity> banners;
  // final List<ProductEntity> latestProducts;
  // final List<ProductEntity> popularProducts;
  final UserInfo user_info;
  final List<MealFoodEntity> meal_foods;
  final List<NotificationEntity> notifications;
  // const HomeSuccess({required this.banners,required this.latestProducts,required this.popularProducts});
  const FoodSuccess({required this.user_info, required this.meal_foods, required this.notifications});


}


import '../../data/meal_food.dart';

class DayEntity{
  final List<MealFoodEntity> b;
  final List<MealFoodEntity> l;
  final List<MealFoodEntity> d;


  DayEntity({
    required this.b,
    required this.l,
    required this.d,
  });
}

class WeekMealFoodReserveStatusEntity{
  final DayEntity Sat;
  final DayEntity Sun;
  final DayEntity Mon;
  final DayEntity Tus;
  final DayEntity Wen;
  final DayEntity Tur;
  final DayEntity Fri;

  WeekMealFoodReserveStatusEntity({
    required this.Sat,
    required this.Sun,
    required this.Mon,
    required this.Tus,
    required this.Wen,
    required this.Tur,
    required this.Fri,
  });
}
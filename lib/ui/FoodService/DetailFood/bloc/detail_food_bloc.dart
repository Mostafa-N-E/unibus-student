import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../../../../common/exceptions.dart';
import '../../../../data/meal_food.dart';

part 'detail_food_event.dart';

part 'detail_food_state.dart';

class DetailFoodBloc extends Bloc<DetailFoodEvent, DetailFoodState> {
  DetailFoodBloc() : super(DetailFoodInitial()) {
    on<DetailFoodEvent>((event, emit) async {
      if (event is DetailFoodStarted || event is DetailFoodRefresh) {
        try {
          // emit(DetailFoodLoading());
          // // final meal_foods = await mealFoodRepository.meal_foods(MealFood_APIbody.none);
          // emit(DetailFoodSuccess(meal_food: meal_food));
        } catch (e) {
          debugPrint(
              "start catch in HomeBloc - HomeError   ===================================================");
          debugPrint(e.toString());
          emit(DetailFoodError(
              exception: e is AppException
                  ? e
                  : AppException(more_info: {"toString": e.toString()})));
          debugPrint(
              "end catch in HomeBloc - HomeError   ===================================================");
        }
      }
    });
  }
}

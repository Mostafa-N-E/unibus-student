import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import '../../../../common/http_client.dart';
import '../../../../data/auth_info.dart';

import '../../../../common/exceptions.dart';
import '../../../../data/meal_food.dart';
import '../../../../data/notification.dart';
import '../../../../data/repo/auth_repository.dart';
import '../../../../data/repo/meal_food_repository.dart';
import '../../../../data/repo/notification_repository.dart';

part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  FoodBloc({required MealFoodRepository mealFoodRepository, required NotificationRepository notificationRepository}) : super(FoodLoading()) {
    on<FoodEvent>((event, emit) async {
      Jalali today = Jalali.now();
      if (event is FoodStarted) {
        // try {
          emit(FoodLoading());
          final user_info = await authRepository.get_user_info();
          final meal_foods = await mealFoodRepository.meal_foods({
            "date": '${today.year}-${today.month}-${today.day}',
            "reserved_user_id": global_userInfo.id
          });
          final notifications = await notificationRepository.get_public_notifications({"related_system": 1});
          emit(FoodSuccess(
              user_info: user_info,
              meal_foods: meal_foods,
              notifications: notifications
          ));
        // } catch (e) {
        //   debugPrint("start catch in HomeBloc - HomeError   ===================================================");
        //   debugPrint(e.toString());
        //   emit(FoodError(exception: e is AppException ? e : AppException(more_info: {"toString":e.toString()})));
        //   debugPrint("end catch in HomeBloc - HomeError   ===================================================");
        // }
      }
      else if(event is FoodRefresh){
        try {
          debugPrint("start in FoodRefresh - FoodRefresh   ===================================================");

          emit(FoodLoading());
          final user_info = await authRepository.get_user_info();
          final meal_foods = await mealFoodRepository.meal_foods({
            "date": '${today.year}-${today.month}-${today.day}',
            "reserved_user_id": global_userInfo.id
          });
          final notifications = await notificationRepository.get_public_notifications({"related_system": 1});
          emit(FoodSuccess(
              user_info: user_info,
              meal_foods: meal_foods,
              notifications: notifications
          ));
        } catch (e) {
          debugPrint("start catch in HomeBloc - HomeError   ===================================================");
          debugPrint(e.toString());
          emit(FoodError(exception: e is AppException ? e : AppException(more_info: {"toString":e.toString()})));
          debugPrint("end catch in HomeBloc - HomeError   ===================================================");
        }
      }
    });
  }


  //     : super(FoodInitial()) {
  //   on<FoodEvent>((event, emit) {
  //     // TODO: implement event handler
  //   });
  // }
}

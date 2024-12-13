import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/exceptions.dart';
import '../../../../data/meal_food.dart';
import '../../../../data/repo/meal_food_repository.dart';

part 'food_sale_day_event.dart';
part 'food_sale_day_state.dart';

class FoodSaleDayBloc extends Bloc<FoodSaleDayEvent, FoodSaleDayState> {
  FoodSaleDayBloc({required MealFoodRepository mealFoodRepository}) : super(FoodSaleDayFirstLoading()) {
    on<FoodSaleDayEvent>((event, emit) async {
      Jalali today = Jalali.now();
      if (event is FoodSaleDayStarted ) {
        try {
          emit(FoodSaleDayFirstLoading());
          final self_services = await mealFoodRepository.get_self_service_list();
          // emit(ReserveFoodLoading(SelfServiceId: event.get_SelfServiceId, picked_date: event.get_picked_date, self_services: self_services));
          // debugPrint("1 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");
          // debugPrint(event.get_picked_date.toString());
          // debugPrint(event.get_SelfServiceId.toString());
          // debugPrint("2 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");
          // final meal_foods = await mealFoodRepository.meal_foods(MealFood_APIbody.none);
          // // debugPrint("3 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");
          //
          emit(FoodSaleDayFirstSuccess(
            SelfServiceId: event.get_SelfServiceId,
            self_services: self_services,
          ));
          // debugPrint("4 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");

        } catch (e) {
          debugPrint("start catch in ReserveFoodBloc - ReserveFoodFirstLoading   ===================================================");
          debugPrint(e.toString());
          emit(FoodSaleDayError(exception: e is AppException ? e : AppException(more_info: {"toString":e.toString()})));
          debugPrint("end catch in ReserveFoodBloc - ReserveFoodFirstLoading   ===================================================");
        }
      }else if(event is FoodSaleDayChangeSelfService){
        // try {
        int selected_self_service_id = -1;
        SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
        int? selected_self_service_id_temp = sharedPreferences.getInt("selected_self_service_id");
        if(selected_self_service_id_temp == null){
          selected_self_service_id = -1;
        }else{
          selected_self_service_id = selected_self_service_id_temp;
        }
        emit(FoodSaleDayLoading(SelfServiceId: selected_self_service_id, self_services: event.selfservices));
        final meal_foods = await mealFoodRepository.meal_foods({
          "date": '${today.year}-${today.month}-${today.day}',
          "self_service_id": selected_self_service_id
        });
        emit(FoodSaleDaySuccess(
          SelfServiceId: selected_self_service_id,
          self_services: event.selfservices,
          meal_foods: meal_foods,
        ));
        // debugPrint("4 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");

        // } catch (e) {
        //   debugPrint("start catch in ReserveFoodBloc - ReserveFoodChangeSelfService   ===================================================");
        //   debugPrint(e.toString());
        //   emit(ReserveFoodError(exception: e is AppException ? e : AppException(more_info: {"toString":e.toString()})));
        //   debugPrint("end catch in ReserveFoodBloc - ReserveFoodChangeSelfService   ===================================================");
        // }
      } else if(event is FoodSaleDayRefresh){
        try {
          emit(FoodSaleDayLoading(SelfServiceId: event.get_SelfServiceId, self_services: event.selfservices));
          // debugPrint("1 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");
          // debugPrint(event.get_picked_date.toString());
          // debugPrint(event.get_SelfServiceId.toString());
          // debugPrint("2 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");
          final self_servics = await mealFoodRepository.get_self_service_list();
          final meal_foods = await mealFoodRepository.meal_foods({
            "date": '${today.year}-${today.month}-${today.day}',
            "self_service_id": event.get_SelfServiceId
          });
          // debugPrint("3 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");

          emit(FoodSaleDaySuccess(
            SelfServiceId: event.get_SelfServiceId,
            self_services: self_servics,
            meal_foods: meal_foods,
          ));
          // debugPrint("4 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");

        } catch (e) {
          debugPrint("start catch in ReserveFoodBloc - ReserveFoodRefresh   ===================================================");
          debugPrint(e.toString());
          emit(FoodSaleDayError(exception: e is AppException ? e : AppException(more_info: {"toString":e.toString()})));
          debugPrint("end catch in ReserveFoodBloc - ReserveFoodRefresh   ===================================================");
        }
      }
    });
  }
}

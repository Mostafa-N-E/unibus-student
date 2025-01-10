import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../common/exceptions.dart';
import '../../../../data/meal_food.dart';
import '../../../../data/repo/meal_food_repository.dart';

part 'reserve_status_event.dart';
part 'reserve_status_state.dart';

class ReserveStatusBloc extends Bloc<ReserveStatusEvent, ReserveStatusState> {
  ReserveStatusBloc({required MealFoodRepository mealFoodRepository}) : super(ReserveStatusLoading()) {
    on<ReserveStatusEvent>((event, emit) async {
      if (event is ReserveStatusStarted ) {
        try {
          emit(ReserveStatusLoading());
          final weekly_reserve_food_status = await mealFoodRepository.get_weekly_reserve_food_status({
            "date_code": 0,
          });
          final DateTime start_week_dateTime = DateTime.parse(weekly_reserve_food_status['start_week']);

          emit(ReserveStatusSuccess(
              date_code: 0,
              weekly_reserve_food_status: weekly_reserve_food_status['meals'],
              start_week_dateTime: start_week_dateTime,
          ));
          // debugPrint("4 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");

        } catch (e) {
          debugPrint("start catch in ReserveFoodBloc - ReserveFoodFirstLoading   ===================================================");
          debugPrint(e.toString());
          emit(ReserveStatusError(exception: e is AppException ? e : AppException(more_info: {"toString":e.toString()})));
          debugPrint("end catch in ReserveFoodBloc - ReserveFoodFirstLoading   ===================================================");
        }
      } else if(event is ReserveStatusRefresh){
        try {
          emit(ReserveStatusLoading());
          // debugPrint("1 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");
          // debugPrint(event.get_picked_date.toString());
          // debugPrint(event.get_SelfServiceId.toString());
          // debugPrint("2 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");
          // final self_servics = await mealFoodRepository.get_self_service_list();
          final weekly_reserve_food_status = await mealFoodRepository.get_weekly_reserve_food_status({
            "date_code" :event.date_code
          });
          final DateTime start_week_dateTime = DateTime.parse(weekly_reserve_food_status['start_week']);



          emit(ReserveStatusSuccess(
            date_code: event.date_code,
            weekly_reserve_food_status: weekly_reserve_food_status['meals'],
            start_week_dateTime: start_week_dateTime,
          ));
          // debugPrint("4 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");

        } catch (e) {
          debugPrint("start catch in ReserveFoodBloc - ReserveFoodRefresh   ===================================================");
          debugPrint(e.toString());
          emit(ReserveStatusError(exception: e is AppException ? e : AppException(more_info: {"toString":e.toString()})));
          debugPrint("end catch in ReserveFoodBloc - ReserveFoodRefresh   ===================================================");
        }
      }
    });
  }
}

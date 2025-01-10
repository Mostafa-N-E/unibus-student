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
import '../../../../data/repo/turn_repository.dart';
import '../../../../data/turn.dart';

part 'bus_event.dart';
part 'bus_state.dart';

class BusBloc extends Bloc<BusEvent, BusState> {
  BusBloc({required TurnRepository turnRepository, required NotificationRepository notificationRepository}) : super(BusLoading()) {
    on<BusEvent>((event, emit) async {
      Jalali today = Jalali.now();
      if (event is BusStarted) {
        // try {
          emit(BusLoading());
          final user_info = await authRepository.get_user_info();
          final turns = await turnRepository.turns({
            "date": '${today.year}-${today.month}-${today.day}',
            "reserved_user_id": global_userInfo.id
          });
          final notifications = await notificationRepository.get_public_notifications({"related_system": 1});
          emit(BusSuccess(
              user_info: user_info,
              turns: turns,
              notifications: notifications
          ));
        // } catch (e) {
        //   debugPrint("start catch in HomeBloc - HomeError   ===================================================");
        //   debugPrint(e.toString());
        //   emit(FoodError(exception: e is AppException ? e : AppException(more_info: {"toString":e.toString()})));
        //   debugPrint("end catch in HomeBloc - HomeError   ===================================================");
        // }
      }
      else if(event is BusRefresh){
        try {
          debugPrint("start in FoodRefresh - FoodRefresh   ===================================================");

          emit(BusLoading());
          final user_info = await authRepository.get_user_info();
          final turns = await turnRepository.turns({
            "date": '${today.year}-${today.month}-${today.day}',
            "reserved_user_id": global_userInfo.id
          });
          final notifications = await notificationRepository.get_public_notifications({"related_system": 1});
          emit(BusSuccess(
              user_info: user_info,
              turns: turns,
              notifications: notifications
          ));
        } catch (e) {
          debugPrint("start catch in HomeBloc - HomeError   ===================================================");
          debugPrint(e.toString());
          emit(BusError(exception: e is AppException ? e : AppException(more_info: {"toString":e.toString()})));
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

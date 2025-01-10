import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:rajaee_web_app/data/turn.dart';
import '../../../../common/exceptions.dart';
import '../../../../data/dormitory.dart';
import '../../../../data/meal_food.dart';
import '../../../../data/repo/dormitory_repository.dart';
import '../../../../data/repo/meal_food_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../data/repo/turn_repository.dart';

part 'reserve_bus_event.dart';
part 'reserve_bus_state.dart';

class ReserveBusBloc extends Bloc<ReserveBusEvent, ReserveBusState> {
  ReserveBusBloc({required TurnRepository turnRepository}) : super(ReserveBusFirstLoading(picked_date: Jalali.now())) {
    on<ReserveBusEvent>((event, emit) async {
      if (event is ReserveBusStarted ) {
        // try {
          emit(ReserveBusFirstLoading(picked_date: event.get_picked_date));
          final dormitoies = await dormitoryRepository.list();
          // emit(ReserveFoodLoading(SelfServiceId: event.get_SelfServiceId, picked_date: event.get_picked_date, self_services: self_services));
          // debugPrint("1 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");
          // debugPrint(event.get_picked_date.toString());
          // debugPrint(event.get_SelfServiceId.toString());
          // debugPrint("2 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");
          // final meal_foods = await mealFoodRepository.meal_foods(MealFood_APIbody.none);
          // // debugPrint("3 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");
          //
          emit(ReserveBusFirstSuccess(
            picked_date: event.get_picked_date,
            dormitory_id: event.get_dormitory_id,
            dormitoies: dormitoies,
          ));
          // debugPrint("4 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");

        // } catch (e) {
        //   debugPrint("start catch in ReserveFoodBloc - ReserveFoodFirstLoading   ===================================================");
        //   debugPrint(e.toString());
        //   emit(ReserveBusError(exception: e is AppException ? e : AppException(more_info: {"toString":e.toString()})));
        //   debugPrint("end catch in ReserveFoodBloc - ReserveFoodFirstLoading   ===================================================");
        // }
      }else if(event is ReserveBusChangeSelfService){
        // try {
          int selected_dormitoiy_id = -1;
          SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
          int? selected_dormitoiy_id_temp = sharedPreferences.getInt("selected_dormitory_id");
          if(selected_dormitoiy_id_temp == null){
            selected_dormitoiy_id = -1;
          }else{
            selected_dormitoiy_id = selected_dormitoiy_id_temp;
          }
          print("____________!!!!!!@@@@@@@@########^^^^^^^^^____________");
          print("____________!!!!!!@@@@@@@@########^^^^^^^^^____________");
          print(selected_dormitoiy_id_temp);
          print("____________!!!!!!@@@@@@@@########^^^^^^^^^____________");
          print("____________!!!!!!@@@@@@@@########^^^^^^^^^____________");

          emit(ReserveBusLoading(dormitoiy_id: selected_dormitoiy_id, picked_date: event.get_picked_date, dormitoies: event.dormitories));
          final turns = await turnRepository.turns({
            "date": '${event.picked_date.year}-${event.picked_date.month}-${event.picked_date.day}',
            "dormitory_id": event.dormitories[selected_dormitoiy_id].id
          });
          emit(ReserveBusSuccess(
            picked_date: event.get_picked_date,
            dormitory_id: selected_dormitoiy_id,
            dormitories: event.dormitories,
            turns: turns,
          ));
          // debugPrint("4 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");

        // } catch (e) {
        //   debugPrint("start catch in ReserveFoodBloc - ReserveFoodChangeSelfService   ===================================================");
        //   debugPrint(e.toString());
        //   emit(ReserveFoodError(exception: e is AppException ? e : AppException(more_info: {"toString":e.toString()})));
        //   debugPrint("end catch in ReserveFoodBloc - ReserveFoodChangeSelfService   ===================================================");
        // }
      } else if(event is ReserveBusRefresh){
        // try {
        int selected_dormitoiy_id = -1;
        SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
        // int? selected_dormitoiy_id_temp = sharedPreferences.getInt("selected_dormitory_id");
        int? selected_dormitoiy_id_temp = Hive.box('cache').get('selected_dormitory_id',);

        if(selected_dormitoiy_id_temp == null){
          selected_dormitoiy_id = -1;
        }else{
          selected_dormitoiy_id = selected_dormitoiy_id_temp;
        }
          emit(ReserveBusLoading(dormitoiy_id: selected_dormitoiy_id, picked_date: event.get_picked_date, dormitoies: event.dormitories));
          // debugPrint("1 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");
          // debugPrint(event.get_picked_date.toString());
          // debugPrint(event.get_SelfServiceId.toString());
          // debugPrint("2 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");
          final dormitoies = await dormitoryRepository.list();
          print("RRRRRRRRRRRRRRRR____________!!!!!!@@@@@@@@########^^^^^^^^^____________");
          print(event.dormitories);
          print("RRRRRRRRRRRRRRRR________________________!!!!!!@@@@@@@@########^^^^^^^^^____________");
          print(selected_dormitoiy_id);
          print("RRRRRRRRRRRRRRRR________________________!!!!!!@@@@@@@@########^^^^^^^^^____________");
          print(event.dormitory_id);
          print("____________!!!!!!@@@@@@@@########^^^^^^^^^____________");
          final turns = await turnRepository.turns({
            "date": '${event.picked_date.year}-${event.picked_date.month}-${event.picked_date.day}',
            "dormitory_id": event.dormitories[selected_dormitoiy_id].id
          });
          // debugPrint("3 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");

          emit(ReserveBusSuccess(
            picked_date: event.get_picked_date,
            dormitory_id: selected_dormitoiy_id,
            dormitories: dormitoies,
            turns: turns,
          ));
          // debugPrint("4 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");

        // } catch (e) {
        //   debugPrint("start catch in ReserveFoodBloc - ReserveFoodRefresh   ===================================================");
        //   debugPrint(e.toString());
        //   emit(ReserveBusError(exception: e is AppException ? e : AppException(more_info: {"toString":e.toString()})));
        //   debugPrint("end catch in ReserveFoodBloc - ReserveFoodRefresh   ===================================================");
        // }
      }
    });
  }
}

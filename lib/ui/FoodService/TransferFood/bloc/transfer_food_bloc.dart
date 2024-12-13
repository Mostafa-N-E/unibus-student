import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/exceptions.dart';
import '../../../../data/meal_food.dart';
import '../../../../data/repo/meal_food_repository.dart';
import '../../../../data/repo/transfer_food_repository.dart';

part 'transfer_food_event.dart';
part 'transfer_food_state.dart';

class TransferFoodBloc extends Bloc<TransferFoodEvent, TransferFoodState> {
  TransferFoodBloc({required TransferFoodRepository transferFoodRepository, required MealFoodEntity meal_food}) : super(TransferFoodLoading(meal_food: meal_food)) {
    on<TransferFoodEvent>((event, emit) async {
      // Jalali today = Jalali.now();
      if (event is TransferFoodStarted ) {
        try {
          emit(TransferFoodLoading(meal_food: meal_food));
          final self_services = await transferFoodRepository.get_list_available_self_service({"meal_food_id": meal_food.id});
          // debugPrint("4 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");
          if(self_services.isEmpty){
            emit(TransferFoodNotAvailable(
              meal_food: meal_food,
            ));
          }else{
            emit(TransferFoodSuccess(
              SelfServiceId: event.get_SelfServiceId,
              self_services: self_services,
              meal_food: meal_food,
            ));
          }

        } catch (e) {
          debugPrint("start catch in ReserveFoodBloc - ReserveFoodFirstLoading   ===================================================");
          debugPrint(e.toString());
          emit(TransferFoodError(exception: e is AppException ? e : AppException(more_info: {"toString":e.toString()})));
          debugPrint("end catch in ReserveFoodBloc - ReserveFoodFirstLoading   ===================================================");
        }
      }
      else if(event is TransferFoodChangeSelfService){
        try {
          emit(TransferFoodLoading(meal_food: meal_food));
          int selected_self_service_id = -1;
          SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
          int? selected_self_service_id_temp = sharedPreferences.getInt("selected_self_service_id");
          if(selected_self_service_id_temp == null){
            selected_self_service_id = -1;
          }else{
            selected_self_service_id = selected_self_service_id_temp;
          }
          emit(TransferFoodSuccess(
            SelfServiceId: selected_self_service_id,
            self_services: event.selfservices,
            meal_food: meal_food,
          ));

        } catch (e) {
          debugPrint("start catch in ReserveFoodBloc - ReserveFoodChangeSelfService   ===================================================");
          debugPrint(e.toString());
          emit((TransferFoodError(exception: e is AppException ? e : AppException(more_info: {"toString":e.toString()}))));
          debugPrint("end catch in ReserveFoodBloc - ReserveFoodChangeSelfService   ===================================================");
        }
      }
      else if(event is TransferFoodSubmitRequest){
        // try {
          emit(TransferFoodLoading(meal_food: meal_food));
          int selected_self_service_id = -1;
          SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
          int? selected_self_service_id_temp = sharedPreferences.getInt("selected_self_service_id");
          if(selected_self_service_id_temp == null){
            selected_self_service_id = -1;
          }else{
            selected_self_service_id = selected_self_service_id_temp;
          }
          Map response = await transferFoodRepository.request({
            "meal_food_id": meal_food.id,
            "destination_self_service_id": event.selfservices[selected_self_service_id].id
          });
          emit(TransferFoodSuccessSubmitRequest(
            SelfServiceId: selected_self_service_id,
            self_services: event.selfservices,
            meal_food: meal_food,
            response: response,
          ));

        // } catch (e) {
        //   debugPrint("start catch in ReserveFoodBloc - ReserveFoodChangeSelfService   ===================================================");
        //   debugPrint(e.toString());
        //   emit((TransferFoodError(exception: e is AppException ? e : AppException(more_info: {"toString":e.toString()}))));
        //   debugPrint("end catch in ReserveFoodBloc - ReserveFoodChangeSelfService   ===================================================");
        // }
      }
      else if(event is TransferFoodRefresh){
        try {
          emit(TransferFoodLoading(meal_food: meal_food));
          final self_services = await transferFoodRepository.get_list_available_self_service({"meal_food_id": meal_food.id});
          int selected_self_service_id = -1;
          SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
          int? selected_self_service_id_temp = sharedPreferences.getInt("selected_self_service_id");
          if(selected_self_service_id_temp == null){
            selected_self_service_id = -1;
          }else{
            selected_self_service_id = selected_self_service_id_temp;
          }
          emit(TransferFoodSuccess(
            SelfServiceId: selected_self_service_id,
            self_services: self_services,
            meal_food: meal_food,
          ));

        } catch (e) {
          debugPrint("start catch in ReserveFoodBloc - ReserveFoodRefresh   ===================================================");
          debugPrint(e.toString());
          emit(TransferFoodError(exception: e is AppException ? e : AppException(more_info: {"toString":e.toString()})));
          debugPrint("end catch in ReserveFoodBloc - ReserveFoodRefresh   ===================================================");
        }
      }
    });
  }
}



import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../common/exceptions.dart';
import '../../../../data/auth_info.dart';
import '../../../../data/card.dart';
import '../../../../data/repo/auth_repository.dart';
import '../../../../data/repo/card_repository.dart';

part 'card_management_event.dart';
part 'card_management_state.dart';

class CardManagementBloc extends Bloc<CardManagementEvent, CardManagementState> {
  CardManagementBloc({required CardRepository cardRepository, required AuthRepository authRepository}) : super(CardManagementLoading()) {
    on<CardManagementEvent>((event, emit) async {
      if (event is CardManagementStarted ) {
        // try {
          emit(CardManagementLoading());
          final cards = await cardRepository.get_user_cards();
          final user_info= await authRepository.get_user_info();

          // emit(ReserveFoodLoading(SelfServiceId: event.get_SelfServiceId, picked_date: event.get_picked_date, self_services: self_services));
          // debugPrint("1 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");
          // debugPrint(event.get_picked_date.toString());
          // debugPrint(event.get_SelfServiceId.toString());
          // debugPrint("2 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");
          // final meal_foods = await mealFoodRepository.meal_foods(MealFood_APIbody.none);
          // // debugPrint("3 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");
          //
          emit(CardManagementSuccess(
              user_info: user_info,
              cards: cards
          ));
          // debugPrint("4 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");

        // } catch (e) {
        //   debugPrint("start catch in ReserveFoodBloc - ReserveFoodFirstLoading   ===================================================");
        //   debugPrint(e.toString());
        //   emit(CardManagementError(exception: e is AppException ? e : AppException(more_info: {"toString":e.toString()})));
        //   debugPrint("end catch in ReserveFoodBloc - ReserveFoodFirstLoading   ===================================================");
        // }
      }
      else if(event is CardManagementRefresh){
        try {
          emit(CardManagementLoading());
          // debugPrint("1 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");
          // debugPrint(event.get_picked_date.toString());
          // debugPrint(event.get_SelfServiceId.toString());
          // debugPrint("2 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");
          final cards = await cardRepository.get_user_cards();
          final user_info= await authRepository.get_user_info();

          emit(CardManagementSuccess(
              user_info: user_info,
              cards: cards
          ));
          // debugPrint("4 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");

        } catch (e) {
          debugPrint("start catch in ReserveFoodBloc - ReserveFoodRefresh   ===================================================");
          debugPrint(e.toString());
          emit(CardManagementError(exception: e is AppException ? e : AppException(more_info: {"toString":e.toString()})));
          debugPrint("end catch in ReserveFoodBloc - ReserveFoodRefresh   ===================================================");
        }
      }
    });
  }
}

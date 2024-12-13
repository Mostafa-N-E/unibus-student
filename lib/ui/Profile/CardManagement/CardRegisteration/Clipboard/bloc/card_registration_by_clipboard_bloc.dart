import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../../common/exceptions.dart';
import '../../../../../../data/repo/auth_repository.dart';
import '../../../../../../data/repo/card_repository.dart';

part 'card_registration_by_clipboard_event.dart';
part 'card_registration_by_clipboard_state.dart';

class CardRegistrationByClipboardBloc extends Bloc<CardRegistrationByClipboardEvent, CardRegistrationByClipboardState> {
  CardRegistrationByClipboardBloc({required CardRepository cardRepository, required AuthRepository authRepository}) : super(CardRegistrationByClipboardLoading()) {
    on<CardRegistrationByClipboardEvent>((event, emit) async {
      if (event is CardRegistrationByClipboardStarted ) {
        // try {
        emit(CardRegistrationByClipboardLoading());
        // final response = await cardRepository.card_registration(body);
        emit(CardRegistrationByClipboardSuccess(
            response: {}
        ));
        // } catch (e) {
        //   debugPrint("start catch in ReserveFoodBloc - ReserveFoodFirstLoading   ===================================================");
        //   debugPrint(e.toString());
        //   emit(CardManagementError(exception: e is AppException ? e : AppException(more_info: {"toString":e.toString()})));
        //   debugPrint("end catch in ReserveFoodBloc - ReserveFoodFirstLoading   ===================================================");
        // }
      }
      else if(event is CardRegistrationByClipboardRefresh){
        try {
          emit(CardRegistrationByClipboardLoading());
          // final response = await cardRepository.card_registration(body);
          emit(CardRegistrationByClipboardSuccess(
              response: {}
          ));

        } catch (e) {
          debugPrint("start catch in ReserveFoodBloc - ReserveFoodRefresh   ===================================================");
          debugPrint(e.toString());
          emit(CardRegistrationByClipboardError(exception: e is AppException ? e : AppException(more_info: {"toString":e.toString()})));
          debugPrint("end catch in ReserveFoodBloc - ReserveFoodRefresh   ===================================================");
        }
      }
    });
  }
}

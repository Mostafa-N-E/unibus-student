import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../common/exceptions.dart';
import '../../../../data/auth_info.dart';
import '../../../../data/repo/activity_report_repository.dart';
import '../../../../data/repo/auth_repository.dart';

part 'profile_detail_event.dart';
part 'profile_detail_state.dart';

class ProfileDetailBloc extends Bloc<ProfileDetailEvent, ProfileDetailState> {
  ProfileDetailBloc({required AuthRepository authRepository}) : super(ProfileDetailLoading()) {
    on<ProfileDetailEvent>((event, emit) async {

      if (event is ProfileDetailStarted ) {
        // try {
        emit(ProfileDetailLoading());
        // final user_info;
        // if (AuthRepository.userInfoChangeNotifier.value != null){
        //   user_info = AuthRepository.userInfoChangeNotifier.value as UserInfo;
        // }else{
        //   user_info = await authRepository.user_info();
        // }
        final user_info= await authRepository.get_user_info();
        emit(ProfileDetailSuccess(
            user_info: user_info
        ));

        // } catch (e) {
        //   debugPrint("start catch in ProfileBloc - ProfileStarted   ===================================================");
        //   debugPrint(e.toString());
        //   emit(ProfileError(exception: e is AppException ? e : AppException(more_info: {"toString":e.toString()})));
        //   debugPrint("end catch in ProfileBloc - ProfileStarted   ===================================================");
        // }
      } else if(event is ProfileDetailRefresh){
        try {
          emit(ProfileDetailLoading());
          // debugPrint("1 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");
          // debugPrint(event.get_picked_date.toString());
          // debugPrint(event.get_SelfServiceId.toString());
          // debugPrint("2 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");
          final user_info= await authRepository.get_user_info();

          // debugPrint("3 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");

          emit(ProfileDetailSuccess(
            user_info: user_info
          ));
          // debugPrint("4 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");

        } catch (e) {
          debugPrint("start catch in ReserveFoodBloc - ReserveFoodRefresh   ===================================================");
          debugPrint(e.toString());
          emit(ProfileDetailError(exception: e is AppException ? e : AppException(more_info: {"toString":e.toString()})));
          debugPrint("end catch in ReserveFoodBloc - ReserveFoodRefresh   ===================================================");
        }
      }


    });
  }
}

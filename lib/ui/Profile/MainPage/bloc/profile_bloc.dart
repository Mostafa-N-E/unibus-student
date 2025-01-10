import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../../../../common/exceptions.dart';
import '../../../../data/activity_report.dart';
import '../../../../data/auth_info.dart';
import '../../../../data/repo/activity_report_repository.dart';
import '../../../../data/repo/auth_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final int INIT_PER_PAGE = 20;
  ProfileBloc({required UserActivityRepository userActivityRepository, required AuthRepository authRepository}) : super(ProfileFirstLoading()) {
    on<ProfileEvent>((event, emit) async {

      if (event is ProfileStarted ) {
        // try {
          emit(ProfileFirstLoading());
          final user_info= await authRepository.get_user_info();
          emit(ProfileFirstSuccess(
              user_info: user_info
          ));
          final user_food_system_activities = await userActivityRepository.get_user_food_activities({
            "page":1,
            "perPage":INIT_PER_PAGE,
          });
          final user_bus_system_activities = await userActivityRepository.get_user_bus_activities({
            "page":1,
            "perPage":INIT_PER_PAGE,
          });
          final user_financial_activities = await userActivityRepository.get_user_financial_activities({
            "page":1,
            "perPage":INIT_PER_PAGE,
          });
          final user_dormitory_system_activities = await userActivityRepository.get_user_dormitory_activities({
            "page":1,
            "perPage":INIT_PER_PAGE,
          });
          final user_system_activities = await userActivityRepository.get_user_system_activities({
            "page":1,
            "perPage":INIT_PER_PAGE,
          });

          emit(ProfileSuccess(
            user_food_system_activities: user_food_system_activities,
            user_bus_system_activities: user_bus_system_activities,
            user_financial_activities: user_financial_activities,
            user_dormitory_system_activities: user_dormitory_system_activities,
            user_system_activities: user_system_activities,
            user_info: user_info,
          ));
          // debugPrint("4 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");

        // } catch (e) {
        //   debugPrint("start catch in ProfileBloc - ProfileStarted   ===================================================");
        //   debugPrint(e.toString());
        //   emit(ProfileError(exception: e is AppException ? e : AppException(more_info: {"toString":e.toString()})));
        //   debugPrint("end catch in ProfileBloc - ProfileStarted   ===================================================");
        // }
      } else if(event is ProfileRefreshUserInfo){
        try {
          emit(ProfileRefreshUserInfoLoading(
              user_food_system_activities: event.user_food_system_activities,
              user_bus_system_activities: event.user_bus_system_activities,
              user_financial_activities: event.user_financial_activities,
              user_system_activities: event.user_system_activities,
              user_dormitory_system_activities: event.user_dormitory_system_activities,
            )
          );
          // await Timer(const Duration(seconds: 5), () { });
          final user_info= await authRepository.get_user_info(refresh:true);
          // final user_food_system_activities = await userActivityRepository.get_user_food_activities({});
          // final user_bus_system_activities = await userActivityRepository.get_user_bus_activities({});
          // final user_financial_activities = await userActivityRepository.get_user_financial_activities({});

          emit(ProfileSuccess(
            user_food_system_activities: event.user_food_system_activities,
            user_bus_system_activities: event.user_bus_system_activities,
            user_financial_activities: event.user_financial_activities,
            user_dormitory_system_activities: event.user_dormitory_system_activities,
            user_system_activities: event.user_system_activities,
            user_info: user_info,
          ));
          // debugPrint("4 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");

        } catch (e) {
          debugPrint("start catch in ProfileBloc - ProfileStarted   ===================================================");
          debugPrint(e.toString());
          emit(ProfileError(exception: e is AppException ? e : AppException(more_info: {"toString":e.toString()})));
          debugPrint("end catch in ProfileBloc - ProfileStarted   ===================================================");
        }
      }else if(event is ProfileRefreshUserActivity){
        try {
          emit(ProfileFirstSuccess(
              user_info: event.user_info
          ));
          final user_food_system_activities = await userActivityRepository.get_user_food_activities({
            "page":1,
            "perPage":INIT_PER_PAGE,
          });
          final user_bus_system_activities = await userActivityRepository.get_user_bus_activities({
            "page":1,
            "perPage":INIT_PER_PAGE,
          });
          final user_financial_activities = await userActivityRepository.get_user_financial_activities({
            "page":1,
            "perPage":INIT_PER_PAGE,
          });
          final user_dormitory_system_activities = await userActivityRepository.get_user_dormitory_activities({});
          final user_system_activities = await userActivityRepository.get_user_system_activities({});

          emit(ProfileSuccess(
            user_food_system_activities: user_food_system_activities,
            user_bus_system_activities: user_bus_system_activities,
            user_financial_activities: user_financial_activities,
            user_dormitory_system_activities: user_dormitory_system_activities,
            user_system_activities: user_system_activities,
            user_info: event.user_info,
          ));
          // debugPrint("4 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");

        } catch (e) {
          debugPrint("start catch in ProfileBloc - ProfileStarted   ===================================================");
          debugPrint(e.toString());
          emit(ProfileError(exception: e is AppException ? e : AppException(more_info: {"toString":e.toString()})));
          debugPrint("end catch in ProfileBloc - ProfileStarted   ===================================================");
        }
      }else if(event is ProfileFoodActivity){
        try {
          emit(ProfileLoading(
              user_info: event.user_info
          ));
          // debugPrint("1 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");
          // debugPrint(event.get_picked_date.toString());
          // debugPrint(event.get_SelfServiceId.toString());
          // debugPrint("2 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");
          final user_food_system_activities = await userActivityRepository.get_user_food_activities({});
          // debugPrint("3 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");

          emit(ProfileGetFoodSystemActivitiesSuccess(
              user_food_system_activities: user_food_system_activities,
              user_info: event.user_info,
          ));

          final user_bus_system_activities = await userActivityRepository.get_user_bus_activities({});
          final user_financial_activities = await userActivityRepository.get_user_financial_activities({});
          final user_dormitory_system_activities = await userActivityRepository.get_user_dormitory_activities({});
          final user_system_activities = await userActivityRepository.get_user_system_activities({});

          emit(ProfileSuccess(
            user_food_system_activities: user_food_system_activities,
            user_bus_system_activities: user_bus_system_activities,
            user_financial_activities: user_financial_activities,
            user_dormitory_system_activities: user_dormitory_system_activities,
            user_system_activities: user_system_activities,
            user_info: event.user_info,
          ));
          // debugPrint("4 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");

        } catch (e) {
          debugPrint("start catch in ReserveFoodBloc - ReserveFoodRefresh   ===================================================");
          debugPrint(e.toString());
          emit(ProfileError(exception: e is AppException ? e : AppException(more_info: {"toString":e.toString()})));
          debugPrint("end catch in ReserveFoodBloc - ReserveFoodRefresh   ===================================================");
        }
      }else if(event is ProfileBusActivity){
        try {
          emit(ProfileLoading(
              user_info: event.user_info
          ));
          // debugPrint("1 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");
          // debugPrint(event.get_picked_date.toString());
          // debugPrint(event.get_SelfServiceId.toString());
          // debugPrint("2 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");
          final user_bus_system_activities = await userActivityRepository.get_user_bus_activities({});
          final user_financial_activities = await userActivityRepository.get_user_financial_activities({});
          final user_dormitory_system_activities = await userActivityRepository.get_user_dormitory_activities({});
          final user_system_activities = await userActivityRepository.get_user_system_activities({});

          emit(ProfileSuccess(
            user_food_system_activities:  event.food_activities,
            user_bus_system_activities: user_bus_system_activities,
            user_financial_activities: user_financial_activities,
            user_dormitory_system_activities: user_dormitory_system_activities,
            user_system_activities: user_system_activities,
            user_info: event.user_info,
          ));
          // debugPrint("4 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");

        } catch (e) {
          debugPrint("start catch in ReserveFoodBloc - ReserveFoodRefresh   ===================================================");
          debugPrint(e.toString());
          emit(ProfileError(exception: e is AppException ? e : AppException(more_info: {"toString":e.toString()})));
          debugPrint("end catch in ReserveFoodBloc - ReserveFoodRefresh   ===================================================");
        }
      }else if(event is ProfileFinancialActivity){
        try {
          emit(ProfileLoading(
              user_info: event.user_info
          ));
          // debugPrint("1 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");
          // debugPrint(event.get_picked_date.toString());
          // debugPrint(event.get_SelfServiceId.toString());
          // debugPrint("2 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");
          final user_financial_activities = await userActivityRepository.get_user_financial_activities({});
          final user_bus_system_activities = await userActivityRepository.get_user_bus_activities({});
          final user_dormitory_system_activities = await userActivityRepository.get_user_dormitory_activities({});
          final user_system_activities = await userActivityRepository.get_user_system_activities({});
          // debugPrint("3 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");

          emit(ProfileSuccess(
              user_bus_system_activities: user_bus_system_activities,
              user_financial_activities: user_financial_activities,
              user_dormitory_system_activities: user_dormitory_system_activities,
              user_system_activities: user_system_activities,
              user_food_system_activities: event.food_activities,
              user_info: event.user_info,
          ));
          // debugPrint("4 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");

        } catch (e) {
          debugPrint("start catch in ReserveFoodBloc - ReserveFoodRefresh   ===================================================");
          debugPrint(e.toString());
          emit(ProfileError(exception: e is AppException ? e : AppException(more_info: {"toString":e.toString()})));
          debugPrint("end catch in ReserveFoodBloc - ReserveFoodRefresh   ===================================================");
        }
      }
      else if(event is ProfileRefresh){
        try {
          emit(ProfileFirstLoading());
          final user_info= await authRepository.get_user_info();
          emit(ProfileFirstSuccess(
              user_info: user_info
          ));
          final user_food_system_activities = await userActivityRepository.get_user_food_activities({});
          // emit(ProfileGetFoodSystemActivitiesSuccess(
          //     user_info: user_info,
          //     user_food_system_activities: user_food_system_activities
          // ));

          final user_bus_system_activities = await userActivityRepository.get_user_bus_activities({});
          final user_financial_activities = await userActivityRepository.get_user_financial_activities({});
          final user_dormitory_system_activities = await userActivityRepository.get_user_dormitory_activities({});
          final user_system_activities = await userActivityRepository.get_user_system_activities({});

          emit(ProfileSuccess(
            user_food_system_activities: user_food_system_activities,
            user_bus_system_activities: user_bus_system_activities,
            user_financial_activities: user_financial_activities,
            user_dormitory_system_activities: user_dormitory_system_activities,
            user_system_activities: user_system_activities,
            user_info: user_info,
          ));
        } catch (e) {
          debugPrint("start catch in ReserveFoodBloc - ReserveFoodRefresh   ===================================================");
          debugPrint(e.toString());
          emit(ProfileError(exception: e is AppException ? e : AppException(more_info: {"toString":e.toString()})));
          debugPrint("end catch in ReserveFoodBloc - ReserveFoodRefresh   ===================================================");
        }
      }else if(event is UpdateProfileFoodActivity){
        try {
          emit(ProfileFirstSuccess(
              user_info: event.user_info
          ));
          final new_user_food_system_activities = await userActivityRepository.get_user_food_activities({
            "page":1,
            "perPage":event.perPage,
          });

          emit(ProfileSuccess(
            user_food_system_activities: event.user_food_system_activities+new_user_food_system_activities,
            user_bus_system_activities: event.user_bus_system_activities,
            user_financial_activities: event.user_financial_activities,
            user_dormitory_system_activities: event.user_dormitory_system_activities,
            user_system_activities: event.user_system_activities,
            user_info: event.user_info,
          ));
          // debugPrint("4 =================================== ReserveFoodBloc - event is ReserveFoodStarted || event is ReserveFoodRefresh   ===================================================");

        } catch (e) {
          debugPrint("start catch in ProfileBloc - ProfileStarted   ===================================================");
          debugPrint(e.toString());
          emit(ProfileError(exception: e is AppException ? e : AppException(more_info: {"toString":e.toString()})));
          debugPrint("end catch in ProfileBloc - ProfileStarted   ===================================================");
        }
      }


    });
  }
}

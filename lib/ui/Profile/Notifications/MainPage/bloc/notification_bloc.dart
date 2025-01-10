import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../../../../../common/exceptions.dart';
import '../../../../../data/notification.dart';
import '../../../../../data/repo/notification_repository.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc({required NotificationRepository notificationRepository, }) : super(NotificationLoading()) {
    on<NotificationEvent>((event, emit) async {
      if (event is NotificationStarted ) {
        // try {
        emit(NotificationLoading());
        final notifications = await notificationRepository.get_public_notifications({"related_system": -1});
        // final user_info= await authRepository.get_user_info();

        emit(NotificationSuccess(
            notifications: notifications
        ));
        // } catch (e) {
        //   debugPrint("start catch in ReserveFoodBloc - ReserveFoodFirstLoading   ===================================================");
        //   debugPrint(e.toString());
        //   emit(CardManagementError(exception: e is AppException ? e : AppException(more_info: {"toString":e.toString()})));
        //   debugPrint("end catch in ReserveFoodBloc - ReserveFoodFirstLoading   ===================================================");
        // }
      }
      else if(event is NotificationRefresh){
        try {
          emit(NotificationLoading());
          final notifications = await notificationRepository.get_public_notifications({"related_system": -1});
          emit(NotificationSuccess(
              notifications: notifications
          ));

        } catch (e) {
          debugPrint("start catch in ReserveFoodBloc - ReserveFoodRefresh   ===================================================");
          debugPrint(e.toString());
          emit(NotificationError(exception: e is AppException ? e : AppException(more_info: {"toString":e.toString()})));
          debugPrint("end catch in ReserveFoodBloc - ReserveFoodRefresh   ===================================================");
        }
      }
    });
  }
}

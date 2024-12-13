import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_notification_event.dart';
part 'user_notification_state.dart';

class UserNotificationBloc extends Bloc<UserNotificationEvent, UserNotificationState> {
  UserNotificationBloc() : super(UserNotificationInitial()) {
    on<UserNotificationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

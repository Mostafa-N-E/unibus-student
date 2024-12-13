part of 'user_notification_bloc.dart';

abstract class UserNotificationState extends Equatable {
  const UserNotificationState();
}

class UserNotificationInitial extends UserNotificationState {
  @override
  List<Object> get props => [];
}

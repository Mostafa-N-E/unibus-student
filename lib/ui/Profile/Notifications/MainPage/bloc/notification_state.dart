part of 'notification_bloc.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();
}

class NotificationInitial extends NotificationState {
  @override
  List<Object> get props => [];
}

class NotificationLoading extends NotificationState {
  const NotificationLoading();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NotificationSuccess extends NotificationState{
  final List<NotificationEntity> notifications;

  const NotificationSuccess({required this.notifications,  });

  @override
  // TODO: implement props
  List<Object?> get props => [];


}

class NotificationError extends NotificationState {
  final AppException exception;
  const NotificationError({required this.exception});

  @override
  List<Object> get props => [exception];
}
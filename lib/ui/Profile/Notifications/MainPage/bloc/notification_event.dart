part of 'notification_bloc.dart';

abstract class NotificationEvent extends Equatable {
  const NotificationEvent();
}

class NotificationStarted extends NotificationEvent{
  const NotificationStarted();
  @override
  // TODO: implement props
  List<Object?> get props => [];

// @override
// get get_SelfServiceId => this.SelfServiceId;

}

class NotificationRefresh extends NotificationEvent{
  const NotificationRefresh();
  @override
  // TODO: implement props
  List<Object?> get props => [];

// @override
// get get_SelfServiceId => this.SelfServiceId;

}
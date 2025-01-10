part of 'card_management_bloc.dart';

abstract class CardManagementEvent extends Equatable {
  const CardManagementEvent();
}


class CardManagementStarted extends CardManagementEvent{
  const CardManagementStarted();
  @override
  // TODO: implement props
  List<Object?> get props => [];

  // @override
  // get get_SelfServiceId => this.SelfServiceId;

}

class CardManagementRefresh extends CardManagementEvent{
  const CardManagementRefresh();
  @override
  // TODO: implement props
  List<Object?> get props => [];

  // @override
  // get get_SelfServiceId => this.SelfServiceId;

}
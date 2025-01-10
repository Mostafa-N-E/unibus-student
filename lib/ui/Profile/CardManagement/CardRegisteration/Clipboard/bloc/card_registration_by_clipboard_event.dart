part of 'card_registration_by_clipboard_bloc.dart';

abstract class CardRegistrationByClipboardEvent extends Equatable {
  const CardRegistrationByClipboardEvent();
}

class CardRegistrationByClipboardStarted extends CardRegistrationByClipboardEvent{
  const CardRegistrationByClipboardStarted();
  @override
  // TODO: implement props
  List<Object?> get props => [];

// @override
// get get_SelfServiceId => this.SelfServiceId;

}

class CardRegistrationByClipboardRefresh extends CardRegistrationByClipboardEvent{
  const CardRegistrationByClipboardRefresh();
  @override
  // TODO: implement props
  List<Object?> get props => [];

// @override
// get get_SelfServiceId => this.SelfServiceId;

}
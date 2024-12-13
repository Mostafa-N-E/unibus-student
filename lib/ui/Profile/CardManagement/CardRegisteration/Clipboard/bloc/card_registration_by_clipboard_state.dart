part of 'card_registration_by_clipboard_bloc.dart';

abstract class CardRegistrationByClipboardState extends Equatable {
  const CardRegistrationByClipboardState();
}

class CardRegistrationByClipboardInitial extends CardRegistrationByClipboardState {
  @override
  List<Object> get props => [];
}


class CardRegistrationByClipboardLoading extends CardRegistrationByClipboardState {
  const CardRegistrationByClipboardLoading();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CardRegistrationByClipboardSuccess extends CardRegistrationByClipboardState{
  final Map response;

  const CardRegistrationByClipboardSuccess({required this.response});

  @override
  // TODO: implement props
  List<Object?> get props => [];


}

class CardRegistrationByClipboardError extends CardRegistrationByClipboardState {
  final AppException exception;
  const CardRegistrationByClipboardError({required this.exception});

  @override
  List<Object> get props => [exception];
}
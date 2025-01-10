part of 'card_management_bloc.dart';

abstract class CardManagementState extends Equatable {
  const CardManagementState();
}

class CardManagementInitial extends CardManagementState {
  @override
  List<Object> get props => [];
}


class CardManagementLoading extends CardManagementState {
  const CardManagementLoading();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CardManagementSuccess extends CardManagementState{
  final UserInfo user_info;
  final List<CardEntity> cards;
  // final Jalali picked_date;

  const CardManagementSuccess({required this.user_info, required this.cards,  });

  @override
  // TODO: implement props
  List<Object?> get props => [];


}

class CardManagementError extends CardManagementState {
  final AppException exception;
  const CardManagementError({required this.exception});

  @override
  List<Object> get props => [exception];
}


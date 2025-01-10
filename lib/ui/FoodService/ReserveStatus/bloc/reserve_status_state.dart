part of 'reserve_status_bloc.dart';

abstract class ReserveStatusState extends Equatable {
  const ReserveStatusState();
}

class ReserveStatusInitial extends ReserveStatusState {
  @override
  List<Object> get props => [];
}



class ReserveStatusLoading extends ReserveStatusState {

  const ReserveStatusLoading();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ReserveStatusError extends ReserveStatusState {
  final AppException exception;
  const ReserveStatusError({required this.exception});

  @override
  List<Object> get props => [exception];
}

class ReserveStatusSuccess extends ReserveStatusState{
  final int date_code;
  final Map weekly_reserve_food_status;
  final DateTime start_week_dateTime;


  const ReserveStatusSuccess({required this.date_code, required this.weekly_reserve_food_status, required this.start_week_dateTime});

  @override
  // TODO: implement props
  List<Object?> get props => [];


}

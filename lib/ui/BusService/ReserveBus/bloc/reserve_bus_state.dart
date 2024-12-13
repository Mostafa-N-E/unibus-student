part of 'reserve_bus_bloc.dart';

abstract class ReserveBusState extends Equatable {
  const ReserveBusState();
}

class ReserveFoodInitial extends ReserveBusState {
  @override
  List<Object> get props => [];
}

class ReserveBusFirstLoading extends ReserveBusState {
  final Jalali picked_date;
  const ReserveBusFirstLoading({required this.picked_date, });

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ReserveBusLoading extends ReserveBusState {
  final int dormitoiy_id;
  final Jalali picked_date;
  final List<Dormitory> dormitoies;


  const ReserveBusLoading({required this.dormitoiy_id, required this.picked_date, required this.dormitoies, });

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ReserveBusError extends ReserveBusState {
  final AppException exception;
  const ReserveBusError({required this.exception});

  @override
  List<Object> get props => [exception];
}

class ReserveBusSuccess extends ReserveBusState{
  final List<TurnEntity> turns;
  final List<Dormitory> dormitories;
  final int dormitory_id;
  final Jalali picked_date;

  const ReserveBusSuccess({required this.turns, required this.dormitory_id, required this.picked_date, required this.dormitories, });

  @override
  // TODO: implement props
  List<Object?> get props => [];


}

class ReserveBusFirstSuccess extends ReserveBusState {
  final List<Dormitory> dormitoies;
  final int dormitory_id;
  final Jalali picked_date;
  const ReserveBusFirstSuccess({required this.dormitoies, required this.dormitory_id, required this.picked_date, });

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
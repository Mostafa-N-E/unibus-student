part of 'reserve_food_bloc.dart';

abstract class ReserveFoodEvent extends Equatable {
  const ReserveFoodEvent();

  get get_picked_date => Jalali.now();
  get get_SelfServiceId => -1;

}


class ReserveFoodStarted extends ReserveFoodEvent{
  final int SelfServiceId;
  final Jalali picked_date;
  const ReserveFoodStarted({required this.picked_date, required this.SelfServiceId});
  @override
  // TODO: implement props
  List<Object?> get props => [];

  @override
  get get_picked_date => this.picked_date;

  @override
  get get_SelfServiceId => this.SelfServiceId;

}

class ReserveFoodRefresh extends ReserveFoodEvent{
  final int SelfServiceId;
  final Jalali picked_date;
  final List<SelfServiceEntity> selfservices;
  const ReserveFoodRefresh({required this.picked_date, required this.SelfServiceId, required this.selfservices});
  @override
  // TODO: implement props
  List<Object?> get props => [];

  @override
  get get_picked_date => this.picked_date;

  @override
  get get_SelfServiceId => this.SelfServiceId;

}

// class ReserveFoodChangeDate extends ReserveFoodEvent{
//   final Jalali picked_date;
//
//   const ReserveFoodChangeDate(this.picked_date);
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => throw UnimplementedError();
// }
//
//
class ReserveFoodChangeSelfService extends ReserveFoodEvent{
  late int SelfServiceId;
  final Jalali picked_date;
  final List<SelfServiceEntity> selfservices;
  ReserveFoodChangeSelfService({required this.picked_date, required this.SelfServiceId, required this.selfservices});


  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  @override
  get get_picked_date => this.picked_date;

  @override
  get get_SelfServiceId => this.SelfServiceId;
}
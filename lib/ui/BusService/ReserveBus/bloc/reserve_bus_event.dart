part of 'reserve_bus_bloc.dart';

abstract class ReserveBusEvent extends Equatable {
  const ReserveBusEvent();

  get get_picked_date => Jalali.now();
  get get_dormitory_id => -1;

}


class ReserveBusStarted extends ReserveBusEvent{
  final int dormitory_id;
  final Jalali picked_date;
  const ReserveBusStarted({required this.picked_date, required this.dormitory_id});
  @override
  // TODO: implement props
  List<Object?> get props => [];

  @override
  get get_picked_date => this.picked_date;

  @override
  get get_dormitory_id => this.dormitory_id;

}

class ReserveBusRefresh extends ReserveBusEvent{
  final int dormitory_id;
  final Jalali picked_date;
  final List<Dormitory> dormitories;
  const ReserveBusRefresh({required this.picked_date, required this.dormitory_id, required this.dormitories});
  @override
  // TODO: implement props
  List<Object?> get props => [];

  @override
  get get_picked_date => this.picked_date;

  @override
  get get_dormitory_id => this.dormitory_id;

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
class ReserveBusChangeSelfService extends ReserveBusEvent{
  late int dormitory_id;
  final Jalali picked_date;
  final List<Dormitory> dormitories;
  ReserveBusChangeSelfService({required this.picked_date, required this.dormitory_id, required this.dormitories});


  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  @override
  get get_picked_date => this.picked_date;

  @override
  get get_dormitory_id => this.dormitory_id;
}
part of 'food_sale_day_bloc.dart';

abstract class FoodSaleDayEvent extends Equatable {
  const FoodSaleDayEvent();
}


class FoodSaleDayStarted extends FoodSaleDayEvent{
  final int SelfServiceId;
  // final Jalali picked_date;
  const FoodSaleDayStarted({required this.SelfServiceId});
  @override
  // TODO: implement props
  List<Object?> get props => [];

  // @override
  // get get_picked_date => this.picked_date;

  @override
  get get_SelfServiceId => this.SelfServiceId;

}

class FoodSaleDayRefresh extends FoodSaleDayEvent{
  final int SelfServiceId;
  // final Jalali picked_date;
  final List<SelfServiceEntity> selfservices;
  const FoodSaleDayRefresh({required this.SelfServiceId, required this.selfservices});
  @override
  // TODO: implement props
  List<Object?> get props => [];

  // @override
  // get get_picked_date => this.picked_date;

  @override
  get get_SelfServiceId => this.SelfServiceId;

}

class FoodSaleDayChangeSelfService extends FoodSaleDayEvent{
  late int SelfServiceId;
  // final Jalali picked_date;
  final List<SelfServiceEntity> selfservices;
  FoodSaleDayChangeSelfService({required this.SelfServiceId, required this.selfservices});


  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  // @override
  // get get_picked_date => this.picked_date;

  @override
  get get_SelfServiceId => this.SelfServiceId;
}
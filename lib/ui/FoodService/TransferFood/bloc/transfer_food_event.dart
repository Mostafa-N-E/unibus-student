part of 'transfer_food_bloc.dart';

abstract class TransferFoodEvent extends Equatable {
  const TransferFoodEvent();
}


class TransferFoodStarted extends TransferFoodEvent{
  final int SelfServiceId;
  // final Jalali picked_date;
  const TransferFoodStarted({required this.SelfServiceId});
  @override
  // TODO: implement props
  List<Object?> get props => [];

  // @override
  // get get_picked_date => this.picked_date;

  @override
  get get_SelfServiceId => this.SelfServiceId;

}

class TransferFoodRefresh extends TransferFoodEvent{
  final int SelfServiceId;
  // final Jalali picked_date;
  final List<SelfServiceEntity> selfservices;
  const TransferFoodRefresh({required this.SelfServiceId, required this.selfservices});
  @override
  // TODO: implement props
  List<Object?> get props => [];

  // @override
  // get get_picked_date => this.picked_date;

  @override
  get get_SelfServiceId => this.SelfServiceId;

}

class TransferFoodChangeSelfService extends TransferFoodEvent{
  late int SelfServiceId;
  // final Jalali picked_date;
  final List<SelfServiceEntity> selfservices;
  TransferFoodChangeSelfService({required this.SelfServiceId, required this.selfservices});


  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  // @override
  // get get_picked_date => this.picked_date;

  @override
  get get_SelfServiceId => this.SelfServiceId;
}

class TransferFoodSubmitRequest extends TransferFoodEvent{
  late int SelfServiceId;
  // final Jalali picked_date;
  final List<SelfServiceEntity> selfservices;
  TransferFoodSubmitRequest({required this.SelfServiceId, required this.selfservices});


  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  // @override
  // get get_picked_date => this.picked_date;

  @override
  get get_SelfServiceId => this.SelfServiceId;
}
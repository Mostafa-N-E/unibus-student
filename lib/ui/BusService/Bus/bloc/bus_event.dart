part of 'bus_bloc.dart';

@immutable
abstract class BusEvent {
  const BusEvent();

  @override
  List<Object> get props => [];
}


class BusStarted extends BusEvent{

}

class BusRefresh extends BusEvent{

}
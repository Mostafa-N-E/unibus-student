part of 'reserve_status_bloc.dart';

abstract class ReserveStatusEvent extends Equatable {
  const ReserveStatusEvent();
}


class ReserveStatusStarted extends ReserveStatusEvent{
  // final int date_code;
  const ReserveStatusStarted();
  @override
  // TODO: implement props
  List<Object?> get props => [];


}

class ReserveStatusRefresh extends ReserveStatusEvent{
  final int date_code;
  const ReserveStatusRefresh({required this.date_code, });
  @override
  // TODO: implement props
  List<Object?> get props => [];


}
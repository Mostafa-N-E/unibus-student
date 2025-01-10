part of 'bus_bloc.dart';

@immutable
abstract class BusState {
  const BusState();

  @override
  List<Object> get props => [];
}

class BusInitial extends BusState {}

class BusLoading extends BusState {}

class BusError extends BusState {
  final AppException exception;
  const BusError({required this.exception});

  @override
  List<Object> get props => [exception];
}

class BusSuccess extends BusState{
  // final List<BannerEntity> banners;
  // final List<ProductEntity> latestProducts;
  // final List<ProductEntity> popularProducts;
  final UserInfo user_info;
  final List<TurnEntity> turns;
  final List<NotificationEntity> notifications;
  // const HomeSuccess({required this.banners,required this.latestProducts,required this.popularProducts});
  const BusSuccess({required this.user_info, required this.turns, required this.notifications});


}
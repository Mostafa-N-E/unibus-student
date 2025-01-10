part of 'profile_detail_bloc.dart';

abstract class ProfileDetailState extends Equatable {
  const ProfileDetailState();
}

class ProfileDetailInitial extends ProfileDetailState {
  @override
  List<Object> get props => [];
}


class ProfileDetailLoading extends ProfileDetailState {

  const ProfileDetailLoading();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProfileDetailError extends ProfileDetailState {
  final AppException exception;
  const ProfileDetailError({required this.exception});

  @override
  List<Object> get props => [exception];
}

class ProfileDetailSuccess extends ProfileDetailState{
  final UserInfo user_info;
  // final int activity_type;

  const ProfileDetailSuccess({required this.user_info,});

  @override
  // TODO: implement props
  List<Object?> get props => [];


}
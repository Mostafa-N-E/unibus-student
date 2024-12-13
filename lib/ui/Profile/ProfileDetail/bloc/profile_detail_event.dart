part of 'profile_detail_bloc.dart';

abstract class ProfileDetailEvent extends Equatable {
  const ProfileDetailEvent();
}


class ProfileDetailStarted extends ProfileDetailEvent{
  const ProfileDetailStarted();
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class ProfileDetailRefresh extends ProfileDetailEvent{
  // final UserInfo user_info;
  const ProfileDetailRefresh();
  @override
  // TODO: implement props
  List<Object?> get props => [];


}
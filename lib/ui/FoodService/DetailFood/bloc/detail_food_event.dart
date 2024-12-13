part of 'detail_food_bloc.dart';

@immutable
abstract class DetailFoodEvent extends Equatable {
  const DetailFoodEvent();

  @override
  List<Object> get props => [];
}


class DetailFoodStarted extends DetailFoodEvent{

}

class DetailFoodRefresh extends DetailFoodEvent{

}

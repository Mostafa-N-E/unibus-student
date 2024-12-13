


import 'dormitory.dart';

class Bus{
  final int id;
  final String name;
  final int main_capacity;
  final int additional_capacity;
  final int management;
  final int driver;
  final bool status;

  Bus({
    required this.id,
    required this.name,
    this.main_capacity=0,
    this.additional_capacity=0,
    this.management=0,
    this.driver=0,
    this.status=true,

  });
}

class BaseTurn{

  final int id;
  final String name;
  final int weekday;
  final int type;
  final String start_time;
  final String end_time;
  final int cost_main_traveler;
  final int cost_additional_traveler;
  final String description;
  final Dormitory dormitory;

  BaseTurn({
    required this.id,
    required this.weekday,
    required this.type,
    required this.dormitory,
    required this.cost_main_traveler,
    required this.cost_additional_traveler,
    this.start_time = "",
    this.end_time = "",
    this.description = "",
    this.name=""

  });
}

class TurnEntity {
  final int id;
  final BaseTurn base;
  List buses;//List<Bus> buses;
  List reserved;
  List waiting;
  List main_travelers;
  List additional_travelers;
  String date;
  // final bool status;
  final bool enable_main_reserve;
  final bool enable_additional_sell;
  final bool enable_getting_bus;
  final bool enable_get_forgotten_code;
  final bool enable_reaction;
  final bool enable_get_result_reaction;
  List like;
  List refused;
  List dislike;

  int user_vote;

  TurnEntity(
      {
        required this.id,
        required this.base,
        required this.buses,

        this.date = "",
        this.waiting = const [],
        this.reserved = const [],
        this.additional_travelers = const [],
        this.main_travelers = const [],
        this.enable_main_reserve = true,
        this.enable_additional_sell = true,
        this.enable_get_forgotten_code = true,
        this.enable_getting_bus = true,
        this.enable_reaction = true,
        this.enable_get_result_reaction = true,
        this.like = const [],
        this.refused = const [],
        this.dislike = const [],
        this.user_vote = -1
      }
      );

  @override
  String toString() {
    return date;//'Place $name (closed : $isClosed)';
  }

  // @override
  // LatLng get get_location => location.latLng;
  bool has_reserve(int id){
    print("???????????????????????????????????????????????????");
    print(id);
    print(this.reserved);

    for(var i in this.reserved){
      if(id.toInt() == i.toInt()){
        print("???????????????????????????????????????????????????");
        return true;
      }
    }
    return false;
  }

  int get_reaction(int id){
    for(var i in this.refused){
      if(id.toInt() == i.toInt()){
        print("???????????????????????????????????????????????????");
        this.user_vote = 1;
        return 1;
      }
    }
    for(var i in this.like){
      if(id.toInt() == i.toInt()){
        this.user_vote = 0;
        print("???????????????????????????????????????????????????");
        return 0;
      }
    }
    for(var i in this.dislike){
      if(id.toInt() == i.toInt()){
        this.user_vote = 2;
        print("???????????????????????????????????????????????????");
        return 2;
      }
    }
    this.user_vote = -1;
    return -1;
  }

  static Map<String, List<TurnEntity>> get_turns_dased_on_type(List<TurnEntity> turns){
    List<TurnEntity> went = [];
    List<TurnEntity> returns  = [];
    for(var turn in turns){
      switch(turn.base.type){
        case 1:
          print("meal_food.base.meal.type == 1 !!!!!!!!!!!!!!!!!!!!!!!!!!");
          went.add(turn);
          break;
        case 2:
          print("meal_food.base.meal.type == 2 !!!!!!!!!!!!!!!!!!!!!!!!!!");
          returns.add(turn);
          break;
      }
    }
    return {
      "went": went,
      "return": returns,
    };
  }
}


TurnEntity turn_builder(Map data){
  return TurnEntity(
    id: data['id'],
    base: BaseTurn(
      id: data['base']['id'],
      weekday: data['base']['weekday'],
      type: data['base']['type'],
      cost_additional_traveler: data['base']['cost_additional_traveler'],
      cost_main_traveler: data['base']['cost_main_traveler'],
      start_time: data['base']['start_time'],
      end_time: data['base']['end_time'],
      dormitory: dormitory_builder(data['base']['dormitory']),
      description: data['base']['description'],
    ),
    date: data['date'],
    reserved: data['reserved'],
    waiting: data['waiting'],
    main_travelers: data['main_travelers'],
    additional_travelers: data['additional_travelers'],
    like: data['like'],
    refused: data['refused'],
    dislike: data['dislike'],
    enable_main_reserve: data['enable_main_reserve'] ?? true,
    enable_additional_sell: data['enable_additional_sell'] ?? true,
    enable_reaction: data['enable_reaction'] ?? true,
    enable_get_result_reaction: data['enable_get_result_reaction'] ?? true,
    enable_get_forgotten_code: data['enable_get_forgotten_code'] ?? true,
    enable_getting_bus: data['enable_get_meal_food'] ?? true,
    buses: data['buses'],
  );
}

class CardEntity{
  final int id;
  final String card_serial;
  final String created;
  late final bool is_active;
  final bool main_card;


  CardEntity({
    required this.id,
    this.card_serial = "",
    this.created = "",
    this.main_card = true,
    this.is_active = true,

  });

}

CardEntity card_builder(Map data){
  return CardEntity(
    id: data['id'],
    card_serial: data['card_serial'] ?? "",
    created: data['created'] ?? "",
    main_card: data['main_card'] ?? "",
    is_active: data['is_active'] ?? "",

  );
}
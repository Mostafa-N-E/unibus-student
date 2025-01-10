
class Dormitory{
  final int id;
  final String name;
  final int capacity;
  final bool status;
  final int management;

  Dormitory({
    required this.id,
    required this.name,
    this.capacity = 0,
    this.status = true,
    this.management = 1,
  });
}



Dormitory dormitory_builder(Map data){
  return Dormitory(
    id: data['id'],
    name: data['name'],
    capacity: data['capacity'],
    status: data['status'],
    management: data['management'],
  );
}

class Store {
  final int id;
  final String name;
  final String address;

  Store({required this.id, required this.name, required this.address});

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(id: json['id'], name: json['name'], address: json['address']);
  }
}

import 'package:equatable/equatable.dart';

class Store extends Equatable {
  final int id;
  final String name;
  final String address;

  const Store({required this.id, required this.name, required this.address});

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(id: json['id'], name: json['name'], address: json['address']);
  }

  Map<String, dynamic> toJson() => {"id": id, "name": name, "address": address};

  @override
  List<Object?> get props => [id, name, address];
}

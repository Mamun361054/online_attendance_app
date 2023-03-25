import 'package:equatable/equatable.dart';
import '../../domain/store.dart';

class StoreState extends Equatable {
  final List<Store> stores;
  final bool isLoading;

  const StoreState({required this.stores, required this.isLoading});

  factory StoreState.init() => const StoreState(stores: [], isLoading: false);

  StoreState copyWith({bool? isLoading, List<Store>? stores}) {
    return StoreState(
        stores: stores ?? this.stores, isLoading: isLoading ?? this.isLoading);
  }

  @override
  List<Object?> get props => [isLoading, stores];
}

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_attendance_app/application/home_app/store_state.dart';
import 'package:online_attendance_app/core/toast.dart';
import 'package:online_attendance_app/domain/store.dart';
import 'package:online_attendance_app/domain/store_domain.dart';

class StoreNotifier extends StateNotifier<StoreState> {
  final StoreDomain storeDomain;

  StoreNotifier({required this.storeDomain}) : super(StoreState.init()){
    loadStores();
  }

  stateMaker(StoreState newState) => state = newState;

  loadStores({int page=1}) async {
    stateMaker(state.copyWith(isLoading: true));
    List<Store> stores = await storeDomain.getStores(page: page);
    stateMaker(state.copyWith(isLoading: false,stores: stores));
  }
}
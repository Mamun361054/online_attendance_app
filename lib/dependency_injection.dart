import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_attendance_app/application/home_app/store_notifier.dart';
import 'package:online_attendance_app/application/home_app/store_state.dart';
import 'package:online_attendance_app/core/api_service.dart';
import 'package:online_attendance_app/core/location_service.dart';
import 'package:online_attendance_app/domain/store_domain.dart';
import 'package:online_attendance_app/infrastructure/store_infrastructure.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// ApiService register as singleton dependency
  sl.registerSingleton<ApiService>(ApiService());
  /// StoreInfrastructure register as singleton dependency
  sl.registerSingleton<StoreDomain>(StoreInfrastructure(apiService: sl()));
  /// LocationService register as singleton dependency
  sl.registerSingleton<LocationService>(LocationService());
}
///state change notifier provider for storeState
///
/// notify all listener when any state change
final storeNotifierProvider = StateNotifierProvider<StoreNotifier,StoreState>((ref) => StoreNotifier(storeDomain: sl()));
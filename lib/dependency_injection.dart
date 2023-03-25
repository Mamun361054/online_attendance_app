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
  sl.registerSingleton<ApiService>(ApiService());
  sl.registerSingleton<StoreDomain>(StoreInfrastructure(apiService: sl()));
  sl.registerSingleton<LocationService>(LocationService());
}

final storeNotifierProvider = StateNotifierProvider<StoreNotifier,StoreState>((ref) => StoreNotifier(storeDomain: sl()));
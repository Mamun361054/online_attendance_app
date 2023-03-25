import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_attendance_app/core/api_service.dart';
import 'package:online_attendance_app/infrastructure/store_infrastructure.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerSingleton<ApiService>(ApiService());
  sl.registerSingleton<StoreInfrastructure>(StoreInfrastructure(apiService: sl()));
}

final storeANotifierProvider = StateNotifierProvider((ref) => null);
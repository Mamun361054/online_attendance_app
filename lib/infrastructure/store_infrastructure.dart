import 'package:online_attendance_app/core/api_service.dart';
import 'package:online_attendance_app/core/toast.dart';
import 'package:online_attendance_app/domain/attendance.dart';
import 'package:online_attendance_app/domain/store.dart';
import 'package:online_attendance_app/domain/store_domain.dart';

class StoreInfrastructure extends StoreDomain {
  final ApiService apiService;

  StoreInfrastructure({required this.apiService});

  @override
  Future<List<Store>> getStores({page = 1}) async {
    try {
      final stores = await apiService.getAllStoreData(page: page);
      return stores;
    } catch (e) {
      ToastMessage.error('error occurred => $e');
    }
    return [];
  }

  @override
  Future<bool> requestAttendance({required Attendance attendance}) async {
    try {
      return await apiService.requestAttendance(attendance: attendance);
    } catch (_) {}
    return false;
  }
}

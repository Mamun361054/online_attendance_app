import 'package:online_attendance_app/domain/store.dart';
import 'attendance.dart';

abstract class StoreDomain{
  Future<List<Store>> getStores({page=1});
  Future<bool> requestAttendance({required Attendance attendance});
}
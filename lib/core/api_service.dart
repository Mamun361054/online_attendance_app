import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:online_attendance_app/core/toast.dart';
import 'package:online_attendance_app/domain/attendance.dart';
import 'package:online_attendance_app/domain/store.dart';

class ApiService {

  static const String baseUrl = "http://128.199.215.102:4040";
  String storesUrl = "$baseUrl/api/stores";
  String attendanceUrl = "$baseUrl/api/attendance";

  Future<List<Store>> getAllStoreData({page=1}) async {
    try {
      var res = await http.get(Uri.parse('$storesUrl?page=$page'));
      print('store response ${res.body}');
      if (res.statusCode == 200) {
        var decData = jsonDecode(res.body.toString());
        var data = decData['data'];
        return List<Store>.from(data.map((e) => Store.fromJson(e)));
      }
    } catch (e) {
      ToastMessage.error(e.toString());
    }
    return [];
  }
  Future<bool> requestAttendance({required Attendance attendance}) async {
    try {
      var res = await http.get(Uri.parse(attendanceUrl));
      print('attendance response ${res.body}');
      if (res.statusCode == 200) {
        return true;
      }
    } catch (e) {
      ToastMessage.error(e.toString());
    }
    return false;
  }
}

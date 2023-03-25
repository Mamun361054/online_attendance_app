import 'package:online_attendance_app/domain/store.dart';

abstract class StoreDomain{
  Future<List<Store>> getStores({page=1});
}
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_attendance_app/application/home_app/store_state.dart';
import 'package:online_attendance_app/domain/attendance.dart';
import 'package:online_attendance_app/domain/store.dart';
import 'package:online_attendance_app/domain/store_domain.dart';

import '../../core/toast.dart';

class StoreNotifier extends StateNotifier<StoreState> {
  final StoreDomain storeDomain;
  int page = 1;
  List<Store> stores = [];

  StoreNotifier({required this.storeDomain}) : super(StoreState.init()) {
    loadStores();
    loadMore();
  }

  ScrollController controller = ScrollController();

  stateMaker(StoreState newState) => state = newState;

  loadMore() {
    controller.addListener(() {
      ///reach to the bottom
      if (controller.offset >= controller.position.maxScrollExtent &&
          !controller.position.outOfRange) {
        loadStores(page: ++page);
      }
    });
  }

  loadStores({int page = 1}) async {
    ///page equal 1 means first time data loading so
    ///we have to show loader in view page and assign list
    if (page == 1) {
      stateMaker(state.copyWith(isLoading: true));
      stores = await storeDomain.getStores(page: page);
      stateMaker(state.copyWith(isLoading: false, stores: stores));

      ///page greater than 1 means user want to load more data
      ///here we don't need to show any loader
    } else {
      final moreStores = await storeDomain.getStores(page: page);
      stores.addAll(moreStores);
      stateMaker(state.copyWith(isLoading: false, stores: stores));
    }
  }

  requestAttendance(
      {required Attendance attendance, required BuildContext context}) async {
    stateMaker(state.copyWith(isLoading: true));
    await storeDomain.requestAttendance(attendance: attendance).then((success) {
      if (success) {
        ToastMessage.success('Attendance Successful');
        Navigator.of(context).pop();
      } else {
        ToastMessage.error('try again later');
      }
    });
    stateMaker(state.copyWith(isLoading: false));
  }
}

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_attendance_app/core/location_service.dart';
import 'package:online_attendance_app/domain/attendance.dart';
import 'package:online_attendance_app/domain/store.dart';
import '../../dependency_injection.dart';
import 'elevated_button.dart';
import 'form_field.dart';

class AttendancePage extends HookConsumerWidget {
  final Store store;

  const AttendancePage({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    LocationService locationService = sl.get<LocationService>();
    locationService.determinePosition();
    final state = ref.watch(storeNotifierProvider);
    final controller = ref.read(storeNotifierProvider.notifier);
    Attendance attendance = Attendance();

    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xFF294677),
                Color(0xFF0E4FCE),
              ]),
            ),
          ),
          title: Text(store.name),
          centerTitle: true,
        ),
        body: state.isLoading
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    FromField(
                      title: "Name ",
                      onChanged: (val) {
                        attendance.name = val;
                      },
                      hintText: "john",
                    ),
                    FromField(
                      title: "User Id ",
                      onChanged: (val) {
                        attendance.uid = val;
                      },
                      hintText: "xxxx",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButtonWidget(
                      text: "SAVE",
                      onPressed: () async {
                        if (formKey.currentState!.validate() && !state.isLoading) {
                          Position position = await locationService.determinePosition();
                          attendance.requestId = '${Random().nextInt(16 * 16)}';
                          attendance.latitude = position.latitude;
                          attendance.longitude = position.longitude;
                          print(attendance.toJson());
                          controller.requestAttendance(
                              attendance: attendance, context: context);
                        }
                      },
                    )
                  ],
                ),
              ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:online_attendance_app/domain/store.dart';
import 'elevated_button.dart';
import 'form_field.dart';

class AttendancePage extends StatelessWidget {
  final Store store;

  const AttendancePage({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: const Color(0xFF294677),
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            FromField(
              title: "Name ",
              onTap: () {},
              hintText: "john",
            ),
            FromField(
              title: "User Id ",
              onTap: () {},
              hintText: "xxxx",
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButtonWidget(
              text: "SAVE",
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}

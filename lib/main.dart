import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_attendance_app/routes/route.dart';
import 'dependency_injection.dart' as di;
void main() async {
  await di.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      /// Creates a [MaterialApp] that uses the [Router] instead of a [Navigator].
      builder: ((_,c) => MaterialApp.router(
        title: 'Store Attendance',
        routerConfig: AppRoute.router,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      )),
    );
  }
}


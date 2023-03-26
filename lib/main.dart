import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_attendance_app/routes/route.dart';
import 'dependency_injection.dart' as di;

void main() async {
  ///initialize dependencies so that singleton instance available
  ///from any where of the project
  await di.init();
  WidgetsFlutterBinding.ensureInitialized();
  /// ProviderScope that stores the state of providers.
  /// Have to initialize from top of the project
  runApp(const ProviderScope(child: MyApp()));
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


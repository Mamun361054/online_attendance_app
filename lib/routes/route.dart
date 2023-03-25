import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../presentation/home/home_page.dart';

class AppRoute{

  static const main = '/main';

  static GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(path: '/',builder: (BuildContext context,GoRouterState state){
        return const HomePage();
      })
    ]
  );

}


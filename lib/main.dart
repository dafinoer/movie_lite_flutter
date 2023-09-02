import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tix_clone_flutter/app_configure.dart';
import 'package:tix_clone_flutter/ui/detail/detail_screen_page.dart';

import 'ui/apikey/apikey_screen_page.dart';
import 'ui/movies/movies_screen_page.dart';

void main() {
  Hive.initFlutter()
      .then((value) => appConfigure())
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData.dark(useMaterial3: true),
      routerConfig: GoRouter(
        initialLocation: '/apiKey',
        routes: [
          GoRoute(
            path: '/apiKey',
            builder: (context, state) => const ApiScreenPage(),
          ),
          GoRoute(
            path: '/home',
            builder: (context, state) => const MoviesScreenPage(),
          ),
          GoRoute(
            path: '/detail/:movieId',
            builder: (context, state) => const DetailScreenPage(),
          )
        ],
      ),
    );
  }
}

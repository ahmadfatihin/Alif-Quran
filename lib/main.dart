import 'package:alif_quran/core/di/injector.dart';
import 'package:flutter/material.dart';

import 'core/routes/routes_config.dart';

void main() async {
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: RoutesConfig.appRouter,
    );
  }
}

import 'dart:async';

import 'package:bloc_usecase_example/di/di.dart';
import 'package:bloc_usecase_example/routes.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  return runZonedGuarded(() async {
    runApp(MyApp());
  }, (error, stack) {
    print("error: $error\nstack: $stack");
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: Routes.routes,
    );
  }
}

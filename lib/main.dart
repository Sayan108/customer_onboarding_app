import 'dart:async';

import 'package:flutter/material.dart';
import 'package:customer_onboarding_app/routes.dart';

import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Customer Onboarding',

      getPages: Routes.routes,
      initialRoute: RouteName.initial,
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Poppins'),
    );
  }
}

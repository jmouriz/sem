import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/application.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Demo App',
    supportedLocales: const <Locale>[
      Locale('en', 'US'),
      Locale('es', 'AR'),
    ],
    theme: ThemeData(
      primarySwatch: Colors.teal,
    ),
    home: const Application(),
  ));
}
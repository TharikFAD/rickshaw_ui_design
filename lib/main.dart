// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:meter_app/routes/route_generator.dart';
import 'package:meter_app/routes/route_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: splashScreenRoute,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

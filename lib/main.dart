// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'dart:async';

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
      home: SplashScreen(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

//!---------------------------------------------------------------------------->

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 7),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOutQuint,
  );
  startTime() async {
    var duration = const Duration(seconds: 7);
    return Timer(duration, navigationPage);
  }

  Future<void> navigationPage() async {
    Navigator.of(context).pushReplacementNamed(loginScreenRoute);
  }

  //Permission Handler ↓↓↓↓. This handles the landing page scenario based on the
  //user data. Meaning if the user is already logged in homePageScreenRoute will
  //be launched. But for now. it is commented cuz there is no API on here. ↓↓↓↓↓

  // Future<void> navigationPage() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   var token = pref.getString("JWT-Token");
  //   var userId = pref.getString("User-Id");
  //   debugPrint('IN MAIN JWT: $token');
  //   debugPrint('IN MAIN USER ID: $userId');
  //   (token == null && userId == null)
  //       ? Navigator.of(context).pushReplacementNamed(loginScreenRoute)
  //       : Navigator.of(context).pushReplacementNamed(homeScreenRoute);
  // }

  @override
  void initState() {
    startTime();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4885ED),
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Padding(
            padding: const EdgeInsets.all(80),
            child: Image.asset("assets/AutoKaaran-splash.gif"),
          ),
        ),
      ),
    );
  }
}

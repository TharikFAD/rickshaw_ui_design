import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../routes/route_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  startTime() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, navigationPage);
  }

  Future<void> navigationPage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var userId = pref.getString("identification_key");
    bool? tripStarted=pref.getBool('tripStarted');

    if(tripStarted != null && tripStarted){
      Navigator.of(context).pushReplacementNamed(completeRideScreenRoute);
    }

    debugPrint('IN MAIN USER ID: $userId');

    (userId == null)
        ? Navigator.of(context).pushReplacementNamed(loginScreenRoute)
        : Navigator.of(context).pushReplacementNamed(homeScreenRoute);
  }

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
            child: SvgPicture.asset("assets/AutoKaaran.svg"),
          ),
        ),
      ),
    );
  }
}

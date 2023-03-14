import 'dart:async';

import 'package:flutter/material.dart';

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
    return Timer(duration, loginScreenRoute);
  }

  void loginScreenRoute() {
    //Navigator.pushNamed(context, RouteGenerator.loginScreenRoute);
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
            child: Image.asset("assets/images/AutoKaaran-splash.gif"),
          ),
        ),
      ),
    );
  }
}

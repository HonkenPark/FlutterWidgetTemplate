import 'dart:async';

import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 700),
    vsync: this,
  )..forward();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      requestInformation();
    });
  }

  void requestInformation() {
    Timer(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.white,
              Colors.white,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // height: 60,
              // width: 600,
              height: MediaQuery.of(context).size.height / 8,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/widget_template_logo_white.png'),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

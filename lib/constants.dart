import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// [Maximum Log size]
const int maximumLogSize = 5;

/// [Color] value
Color primaryLightColor = Colors.grey.shade800;
const Color primaryDarkColor = Colors.amber;

/// Value to determine the screen size for [Responsive] layout
/// NavigationRail shows if the screen width is greater or equal to narrowScreenWidthThreshold;
/// otherwise, NavigationBar is used for navigation.
const double narrowScreenWidthThreshold = 600;
const double mediumWidthBreakpoint = 1280;
const double largeWidthBreakpoint = 1600;

enum ScreenSize {
  largeScreen(0),
  mediumScreen(1),
  smallScreen(2),
  mobileScreen(4);

  const ScreenSize(this.value);
  final int value;
}

ScreenSize getScreenSize(double width) {
  if (width > largeWidthBreakpoint) {
    return ScreenSize.largeScreen;
  } else if (width > mediumWidthBreakpoint) {
    return ScreenSize.mediumScreen;
  } else if (width > narrowScreenWidthThreshold) {
    return ScreenSize.smallScreen;
  } else {
    return ScreenSize.mobileScreen;
  }
}

ScreenSize setScreenFit(double shortestSide) {
  final bool isMobileSize = (shortestSide > narrowScreenWidthThreshold) ? false : true;
  final bool usePortraitLayout = ((!kIsWeb && (defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS) && isMobileSize)) ? true : false;

  if (usePortraitLayout) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  if (shortestSide > largeWidthBreakpoint) {
    return ScreenSize.largeScreen;
  } else if (shortestSide > mediumWidthBreakpoint) {
    return ScreenSize.mediumScreen;
  } else if (shortestSide > narrowScreenWidthThreshold) {
    return ScreenSize.smallScreen;
  } else {
    return ScreenSize.mobileScreen;
  }
}

/// This Shadow information is used in title of each Chart
const List<Shadow> shadowEffect = [
  Shadow(
    color: Colors.grey,
    offset: Offset(0, 0.7),
    blurRadius: 0.5,
  )
];

/// Defines addresses that request API calls to receive services. [Demo Server]
String thinkAiAuthUrl = const String.fromEnvironment('PA_URL').isNotEmpty ? const String.fromEnvironment('PA_URL') : "https://dev.think-ai.co.kr:20101/pa/";
// String thinkAIIftkUrl = const String.fromEnvironment('PI_URL').isNotEmpty ? const String.fromEnvironment('PI_URL') : "https://dev.think-ai.co.kr:20201/pi/";
String thinkAIIftkUrl = const String.fromEnvironment('PI_URL').isNotEmpty ? const String.fromEnvironment('PI_URL') : "https://dev.think-ai.co.kr:41000/pi/";
String thinkAiOpaiUrl = const String.fromEnvironment('PO_URL').isNotEmpty ? const String.fromEnvironment('PO_URL') : "https://dev.think-ai.co.kr:20202/po/";

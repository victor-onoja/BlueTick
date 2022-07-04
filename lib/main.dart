import 'package:bluetick/screens/home/home.dart';
import 'package:bluetick/screens/home/home_tabs.dart';
import 'package:bluetick/screens/sign_up/onBoarding.dart';
import 'package:bluetick/screens/sign_up/splash_screen.dart';
import 'package:bluetick/screens/sign_up/onboarding_animation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'screens/sign_in/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(child,
          maxWidth: 1200,
          minWidth: 350,
          defaultScale: true,
          breakpoints: const [
            ResponsiveBreakpoint.resize(350, name: MOBILE),
            ResponsiveBreakpoint.autoScale(600, name: TABLET),
            ResponsiveBreakpoint.resize(800, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(1000, name: 'LARGESCREEN'),
            ResponsiveBreakpoint.resize(1200, name: 'EXTRALARGESCREEN'),
          ]),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OnBoardingScreenAnimation(), //SplashScreen(),
    );
  }
}

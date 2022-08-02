import 'package:bluetick/components/constants/app_router/app_router.dart';
import 'package:bluetick/screens/home/notifications.dart';

import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'screens/chatScreen/adminBroadcastScreen.dart';
import 'screens/home/contact_us_screen.dart';

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
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      initialRoute: AppRouter.personalProfile,
      routes: AppRouter.routes,
      onGenerateRoute: AppRouter.generateRoute,

      //  home: ContactUs() //const SplashScreen(),
    );
  }
}

import 'package:bluetick/app/module/sign_in/view/onBoarding.dart';
import 'package:flutter/material.dart';

import 'app/module/get_started/views/admin_sign_up.dart';
import 'app/module/sign_in/view/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OnBoardingScreen(),
    );
  }
}

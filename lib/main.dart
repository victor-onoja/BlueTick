import 'package:bluetick/components/widgets/popup.dart';
import 'package:bluetick/screens/chatScreen/broadcastScreen.dart';
import 'package:bluetick/screens/chatScreen/chatScreen.dart';
import 'package:bluetick/screens/groupchat/groupchatScreen.dart';
import 'package:bluetick/screens/home/broadcast.dart';
import 'package:bluetick/screens/home/co_wokers/co_workers_call_screen.dart';
import 'package:bluetick/screens/home/contact_us_screen.dart';
import 'package:bluetick/screens/home/group_call_screen.dart';
import 'package:bluetick/screens/home/invitation_screens/invitation_screen.dart';
import 'package:bluetick/screens/home/invitation_screens/invitationb1.dart';
import 'package:bluetick/screens/home/invitation_screens/test_tag.dart';
import 'package:bluetick/screens/home/sub_home/personal_profile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'screens/sign_up/splash_screen.dart';

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
      home: Chatscreen(),
    );
  }
}

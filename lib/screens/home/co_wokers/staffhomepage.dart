import 'dart:async';

import 'package:bluetick/components/config/config_sheet.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../todo_screen.dart';
import 'co_workers_drawer.dart';

class StaffHomePage extends StatefulWidget {
  const StaffHomePage({Key? key}) : super(key: key);
  @override
  StaffHomePageState createState() => StaffHomePageState();
}

class StaffHomePageState extends State<StaffHomePage> {
  String? date;
  String? dateTime;

  bool check = false;
  Timer? timer;
  Duration? duration = const Duration(hours: 00);

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      return setTimer();
    });
  }

  void resumeTimer() {
    startTimer();
  }

  void stopTimer() {
    setState(() => timer!.cancel());
  }

  void resetTimer() {
    stopTimer();
    setState(() => duration = const Duration(hours: 00));
  }

  void setTimer() {
    const increaseBy = 1;

    setState(() {
      final timeLoad = duration!.inSeconds + increaseBy;

      duration = Duration(seconds: timeLoad);
    });
  }

  @override
  void initState() {
    setState(() {
      date = DateFormat.yMd().format(DateTime.now());
      dateTime = DateFormat('EEEE,').add_jm().format(DateTime.now());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');

    final hours = strDigits(duration!.inHours.remainder(60));
    final minutes = strDigits(duration!.inMinutes.remainder(60));
    final seconds = strDigits(duration!.inSeconds.remainder(60));

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: blue2,
        appBar: GeneralAppBar(),
        // bottomNavigationBar: homeBottomNavigationBar(),
        drawer: CoWorkersDrawer(),
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
              Container(
                margin: const EdgeInsets.only(top: 50, bottom: 10),
                height: 275.92,
                alignment: Alignment.center,
                width: 341,
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                ),
                decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          inset: true,
                          color: darkBlue.withOpacity(0.6),
                          blurRadius: 8,
                          offset: const Offset(8, 8)),
                      BoxShadow(
                          inset: true,
                          color: darkBlue.withOpacity(0.6),
                          blurRadius: 8,
                          offset: const Offset(-8, -8))
                    ],
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    border: Border.all(
                        color: darkBlue, width: 3, style: BorderStyle.solid),
                    gradient: RadialGradient(
                        colors: [offWhite, blue2], stops: const [0.0, 84.21])),
                child: Center(
                  child: Column(
                    // direction: Axis.vertical,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Text(
                            '${dateTime ?? 'Present Time'} \n${date ?? 'Today\'s Date'}',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  color: darkBlue),
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 5),
                          child: Text(
                            'Current work hour',
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: darkBlue,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600)),
                          )),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        height: 47,
                        width: 136,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: blue2,
                                offset: const Offset(2, 2),
                                blurRadius: 8.0,
                                inset: true,
                              ),
                              BoxShadow(
                                color: offWhite,
                                offset: const Offset(-2, -2),
                                blurRadius: 8.0,
                                inset: true,
                              )
                            ],
                            border: Border.all(
                              color: darkBlue,
                              width: 1,
                              style: BorderStyle.solid,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4))),
                        alignment: Alignment.center,
                        child: Text('$hours:$minutes:$seconds',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: darkBlue,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600))),
                      ),
                    ],
                  ),
                ),
              ),
              Stack(children: [
                Positioned(
                    child: SizedBox(
                        child: Image.asset(
                            'Assets/images/bluetick_background.png'))),
                Positioned(
                    top: 45,
                    left: 79,
                    child: FlutterSwitch(
                      showOnOff: true,
                      padding: 8.0,
                      duration: const Duration(milliseconds: 200),
                      borderRadius: 12.15,
                      valueFontSize: 16.23,
                      switchBorder: Border.all(color: offWhite, width: 3.04),
                      inactiveColor: darkBlue,
                      activeColor: darkBlue,
                      inactiveTextColor: Colors.white,
                      activeTextColor: Colors.white,
                      inactiveIcon: const Icon(Icons.arrow_forward_rounded),
                      inactiveText: "Swipe to Clock in",
                      activeIcon: const Icon(Icons.arrow_back_rounded),
                      activeText: "Swipe to Clock out",
                      inactiveTextFontWeight: FontWeight.w600,
                      activeTextFontWeight: FontWeight.w600,
                      toggleBorder: Border.all(color: blue2, width: 2.0),
                      width: 236.74,
                      height: 80.86,
                      toggleSize: 60.86,
                      value: check,
                      onToggle: (bool value) {
                        if (value == true) {
                          startTimer();
                        } else {
                          stopTimer();
                        }

                        setState(() {
                          check = value;
                        });
                      },
                    )),
              ]),
            ])));
  }

  AppBar GeneralAppBar() {
    return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.0, 68.11],
                colors: [linearBlue1, darkBlue])),
      ),
      centerTitle: true,
      // leading: IconButton(
      //   icon: const ImageIcon(AssetImage('Assets/images/Group 7.png')),
      //   onPressed: () => null,
      // ),
      title: const Text(
        'BlueTick',
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 23.96),
      ),
      actions: [
        GestureDetector(
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => TodoScreen())),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.asset(
              'Assets/images/Ellipse 20.png',
              fit: BoxFit.contain,
            ),
          ),
          //     const CircleAvatar(
          //   backgroundImage: AssetImage(''),
          // ),
        )
      ],
    );
  }
}

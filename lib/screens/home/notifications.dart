import 'package:bluetick/components/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bluetick/screens/home/home.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.blue2,
      appBar: AppBar(
        toolbarHeight: 44,
        elevation: 0,
        backgroundColor: AppTheme.mainBlue,
        leading: Icon(
          Icons.arrow_back,
          color: AppTheme.offWhite,
        ),
        title: Text(
          "Notifications",
          style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.offWhite)),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                "Assets/icons/charm_tick-double.png",
                alignment: Alignment.topCenter,
              ),
              SizedBox(width: 4.0),
              Text("Mark all as Read",
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.mainBlue)))
            ],
          ),
          SizedBox(height: 10.0),
          TopPanel(
            name: 'Hannah Sent you a File',
            date: "Jul 6, 2022 at 4:49 pm",
          ),
          TopPane(
            name: 'Admin sent a Broadcast',
            date: "Jul 6, 2022 at 5:30 pm",
          ),
          TopPanell(
            name: 'Join group call',
            date: "Jun 21,  2022 at 10:50 am",
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            height: 38,
            color: AppTheme.offWhite,
            padding: EdgeInsets.only(left: 56.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //SizedBox(width: 56,),
                  Text(
                    "Older Notifications",
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.darkBlue)),
                  )
                ]),
          ),
          SizedBox(
            height: 4,
          ),
          downPanel(
              name: 'Password successfully updated',
              date: "Jun 13, 2022 at 5:00 pm"),
          downPanell(
              name: 'Admin sent a Broadcast', date: "Jun 7, 2022 at 4:49 pm"),
          downPane(
              name: 'Jacob Uploaded a File', date: "Jun 4, 2022 at 8:30 pm"),
          downPan(
              name: 'Scheduled group call by 8:30 am',
              date: "May 2, 2022 at 3:00 pm"),
          downPane(
              name: 'Jacob Uploaded a File', date: "Jun 4, 2022 at 8:30 pm"),
        ]),
      ),
    );
  }
}

Container TopPanel({required String name, required String date}) {
  return Container(
    margin: const EdgeInsets.only(top: 4),
    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
    height: 52,
    color: AppTheme.mainBlue,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                //top: 2, bottom: 2,
                right: 16.0,
              ),
              child: Container(
                height: 27.0,
                width: 24.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'Assets/icons/Vector01.png',
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    color: AppTheme.offWhite,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  date,
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    color: AppTheme.offWhite,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

Container TopPane({required String name, required String date}) {
  return Container(
    margin: const EdgeInsets.only(top: 4),
    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
    height: 52,
    color: AppTheme.mainBlue,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                //top: 2, bottom: 2,
                right: 16.0,
              ),
              child: Container(
                height: 27.0,
                width: 24.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'Assets/broadcast.png',
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    color: AppTheme.offWhite,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  date,
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    color: AppTheme.offWhite,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

Container TopPanell({required String name, required String date}) {
  return Container(
    margin: const EdgeInsets.only(top: 4),
    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
    height: 52,
    color: AppTheme.mainBlue,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                //top: 2, bottom: 2,
                right: 16.0,
              ),
              child: Container(
                height: 27.0,
                width: 24.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'Assets/icons/fluent_call-24-filled.png',
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    color: AppTheme.offWhite,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  date,
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    color: AppTheme.offWhite,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

Container downPanel({required String name, required String date}) {
  return Container(
      margin: const EdgeInsets.only(top: 4),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      height: 52.0,
      color: AppTheme.offWhite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              //top: 2, bottom: 2,
              right: 16.0,
            ),
            child: Container(
              height: 24.0,
              width: 24.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'Assets/icons/teenyicons_password-outline.png',
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  color: AppTheme.blackerBlack,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                date,
                style: GoogleFonts.montserrat(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  color: AppTheme.blackerBlack,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ));
}

Container downPane({required String name, required String date}) {
  return Container(
      margin: const EdgeInsets.only(top: 4),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      height: 52.0,
      color: AppTheme.offWhite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              //top: 2, bottom: 2,
              right: 16.0,
            ),
            child: Container(
              height: 24.0,
              width: 24.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'Assets/icons/Vectorblue.png',
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  color: AppTheme.blackerBlack,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                date,
                style: GoogleFonts.montserrat(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  color: AppTheme.blackerBlack,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ));
}

Container downPan({required String name, required String date}) {
  return Container(
      margin: const EdgeInsets.only(top: 4),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      height: 52.0,
      color: AppTheme.offWhite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              //top: 2, bottom: 2,
              right: 16.0,
            ),
            child: Container(
              height: 24.0,
              width: 24.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'Assets/icons/el_groupblue.png',
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  color: AppTheme.blackerBlack,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                date,
                style: GoogleFonts.montserrat(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  color: AppTheme.blackerBlack,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ));
}

Container downPanell({required String name, required String date}) {
  return Container(
      margin: const EdgeInsets.only(top: 4),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      height: 52.0,
      color: AppTheme.offWhite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              //top: 2, bottom: 2,
              right: 16.0,
            ),
            child: Container(
              height: 24.0,
              width: 24.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'Assets/icons/Groupbroadblue.png',
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  color: AppTheme.blackerBlack,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                date,
                style: GoogleFonts.montserrat(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  color: AppTheme.blackerBlack,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ));
}

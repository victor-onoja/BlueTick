import 'package:bluetick/components/constants/app_router/app_router.dart';
import 'package:bluetick/screens/home/home_tabs.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../components/app_theme.dart';
import '../../../components/config/config_sheet.dart';
import '../../../components/ui/ui_utils.dart';
import 'live_location.dart';

class StaffProfileAdmin extends StatelessWidget {
  StaffProfileAdmin();

  @override
  Widget build(BuildContext context) {
    String userName = 'John Mac';
    String status = "(Online)";
    String about = "Lorem ipsum dolor sit amet, consectetur adipiscing elit.";
    const String direction = "Lagos 6km away";

    return Scaffold(
      backgroundColor: mainBlue,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                mainBlue,
                Colors.transparent,
                Colors.transparent,
                Colors.transparent,
                darkBlue
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
            child: Column(children: [
              Stack(children: [
                const Positioned(
                  child: SizedBox(
                    width: 428,
                    height: 315,
                  ),
                ),
                Positioned(
                    child: Container(
                  decoration: BoxDecoration(gradient: linearWhiteGradient),
                  width: 428,
                  height: 271,
                )),
                Positioned(
                    right: 7,
                    bottom: 24,
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          color: blue2,
                          border: Border.all(color: Colors.black),
                          shape: BoxShape.circle),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRouter.chatScreen);
                          },
                          icon: const ImageIcon(
                              AssetImage('Assets/message.png'))),
                    )),
                Positioned(
                    child: IconButton(
                        color: Colors.black,
                        onPressed: () => Navigator.pop(context),
                        // => Navigator.push(context,
                        //     MaterialPageRoute(builder: (_) => const HomeTab())),
                        icon: const Icon(Icons.arrow_back))),
                Positioned(
                    left: 2,
                    right: 2,
                    top: 60,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 42,
                            child: Image.asset('Assets/images/Ellipse 11.png'),
                          ),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 5),
                              child: Text(
                                userName,
                                style: const TextStyle(
                                  fontSize: 24,
                                ),
                              )),
                          Container(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                status,
                                style: const TextStyle(fontSize: 12),
                              )),
                          SizedBox(
                              width: 200,
                              child: Text(
                                about,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 12),
                              ))
                        ])),
                Positioned(
                  right: 1,
                  child: IconButton(
                    color: Colors.black,
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        AppRouter.coWorkersCallScreen,
                      );
                    },
                    icon: const Icon(Icons.phone),
                  ),
                ),
              ]),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height: 52,
                      child: ListTile(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => liveLocationMap(),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12)),
                              ));
                        },
                        horizontalTitleGap: 0,
                        tileColor: blue2,
                        leading: ImageIcon(
                            AssetImage('Assets/images/location.png'),
                            color: darkBlue),
                        title: Text(
                          'View Location',
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.mainBlue,
                          ),
                        ),
                        trailing: Text(
                          'Check In: 8:11am',
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.darkBlue2,
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 4,
                  ),
                  SizedBox(
                      height: 52,
                      child: ListTile(
                        horizontalTitleGap: 0,
                        tileColor: blue2,
                        leading: ImageIcon(
                          AssetImage('Assets/images/gis_position-man.png'),
                          color: darkBlue,
                        ),
                        title: Text(
                          'Role in the company',
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.mainBlue,
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 4,
                  ),
                  SizedBox(
                      height: 52,
                      child: ListTile(
                        horizontalTitleGap: 0,
                        tileColor: blue2,
                        leading: ImageIcon(
                          AssetImage('Assets/images/clarity_email-solid.png'),
                          color: darkBlue,
                        ),
                        title: Text(
                          'Email Address ',
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.mainBlue,
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 4,
                  ),
                  SizedBox(
                      height: 52,
                      child: ListTile(
                        horizontalTitleGap: 0,
                        tileColor: blue2,
                        leading: ImageIcon(
                          AssetImage('Assets/icons/file_download.png'),
                          color: darkBlue,
                        ),
                        title: Text(
                          'Download Work Log',
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.mainBlue,
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 4,
                  ),
                  SizedBox(
                      height: 52,
                      child: ListTile(
                        horizontalTitleGap: 0,
                        tileColor: Color(0xffD6240C),
                        leading: ImageIcon(
                          AssetImage('Assets/icons/person_remove.png'),
                          color: white,
                        ),
                        title: Text(
                          'Remove from Workspace',
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.white,
                          ),
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: 40, left: 10),
                    child: Text(
                      'Media',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.white,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 2,
                color: Color(0xffC8C8C8),
              ),
              SizedBox(
                height: 114,
                child: ListView(
                  // shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: 136,
                      height: 114,
                      child: Image.asset('Assets/images/Rectangle 32.png'),
                    ),
                    SizedBox(
                      width: 136,
                      height: 114,
                      child: Image.asset('Assets/images/Rectangle 33.png'),
                    ),
                    SizedBox(
                      width: 136,
                      height: 114,
                      child: Image.asset('Assets/images/Rectangle 34.png'),
                    ),
                    SizedBox(
                      width: 136,
                      height: 114,
                      child: Image.asset('Assets/images/Rectangle 32.png'),
                    ),
                    SizedBox(
                      width: 136,
                      height: 114,
                      child: Image.asset('Assets/images/Rectangle 33.png'),
                    ),
                    SizedBox(
                      width: 136,
                      height: 114,
                      child: Image.asset('Assets/images/Rectangle 34.png'),
                    )
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

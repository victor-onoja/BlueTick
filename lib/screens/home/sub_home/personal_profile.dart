import 'package:bluetick/components/constants/app_router/app_router.dart';
import 'package:bluetick/screens/home/help_center.dart';
import 'package:bluetick/screens/settings/ntf-settings.dart';
import 'package:bluetick/screens/sign_in/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bluetick/components/config/config_sheet.dart';
import 'package:bluetick/components/ui/ui_utils.dart';

import '../../../components/models/profile_model.dart';

class PersonalProfile extends StatelessWidget {
  const PersonalProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    //print('width is $screenWidth');
    String userName = 'Vera McBerth';
    String about = "Lorem ipsum dolor sit amet, consectetur adipiscing elit.";
    return Scaffold(
        backgroundColor: darkBlue,
        //  bottomNavigationBar: homeBottomNavigationBar(),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(children: [
          Stack(children: [
            Positioned(
                child: Container(
              margin: const EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(gradient: linearWhiteGradient),
              width: 428,
              height: 244,
            )),
            Positioned(
                child: IconButton(
                    color: Colors.black,
                    onPressed: () => Navigator.pop(context),
                    // => Navigator.push(context,
                    //     MaterialPageRoute(builder: (_) => const HomeTab())),
                    icon: const Icon(Icons.arrow_back))),
            Positioned(
              right: 65,
              bottom: 102,
              child: IconButton(
                  color: mainBlue,
                  iconSize: 18.75,
                  onPressed: () => null,
                  icon: const ImageIcon(
                      AssetImage('Assets/icons/ant-design.png'))),
            ),
            Positioned(
                left: 2,
                right: 2,
                top: 30,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 42,
                        child: Image.asset(
                          'Assets/images/Vera.png',
                          filterQuality: FilterQuality.medium,
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.only(
                            top: 20,
                            bottom: 10,
                          ),
                          child: Text(
                            userName,
                            style: GoogleFonts.montserrat(
                                fontSize: 24, fontWeight: FontWeight.w500),
                          )),
                      SizedBox(
                          width: 250,
                          child: Text(
                            about,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          ))
                    ])),
            Positioned(
                right: screenWidth / 2.7692308,
                bottom: 147,
                child: IconButton(
                  icon: const ImageIcon(AssetImage('Assets/icons/add.png')),
                  color: mainBlue,
                  iconSize: 21,
                  onPressed: () => null,
                )),
          ]),
          Padding(
            padding: const EdgeInsets.only(right: 300, bottom: 10),
            child: Text(
              'Settings',
              style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
              //width: 428,
              height: 385,
              child: ListView.separated(
                  itemCount: settingsItem.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(height: 2, color: mainBlue),
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    final title = settingsName[index];
                    final bool logOutColor = title == 'Log Out';

                    nvgtion() {
                      if (title == 'Notification') {
                        return Navigator.pushNamed(
                          context,
                          AppRouter.notificationSettings,
                        );
                      } else if (title == 'Help Center') {
                        return Navigator.pushNamed(
                          context,
                          AppRouter.helpCenter,
                        );
                      } else if (title == 'Log Out') {
                        return Navigator.pushNamed(
                          context,
                          AppRouter.login,
                        );
                      } else
                        () {};
                    }

                    return Container(
                        color: logOutColor ? warningRed : blue2,
                        height: 52,
                        child: ListTile(
                          onTap: () => nvgtion(),
                          textColor: logOutColor ? offWhite : mainBlue,
                          leading: ImageIcon(
                            AssetImage(settingsItem[title]!),
                            color: logOutColor ? offWhite : darkBlue,
                          ),
                          title: Text(
                            title,
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                        ));
                  }))
        ]))));
  }
}

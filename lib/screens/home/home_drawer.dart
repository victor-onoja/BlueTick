import 'package:bluetick/components/constants/app_router/app_router.dart';
import 'package:bluetick/screens/home/sub_home/createbroadcast.dart';
import 'package:bluetick/screens/home/sub_home/personal_profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/app_theme.dart';
import '../sign_in/login.dart';
import 'invitation_screens/invitation_screen.dart';
import 'sub_home/addagroup.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff244BA9), Color(0xff162850)],
          ),
        ),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0, top: 44),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Image.asset('Assets/closeButton.png'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                textContainer(
                    text: 'Home',
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        AppRouter.homeTabs,
                        //    MaterialPageRoute(builder: (_) => const HomeTab()),
                      );
                    }),
                const Divider(
                  color: AppTheme.blue2,
                  thickness: 1,
                ),
                textContainer(
                    text: 'Profile',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const PersonalProfile()));
                    }),
                const Divider(
                  color: AppTheme.blue2,
                  thickness: 1,
                ),
                textContainer(
                    text: 'Create Groups',
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const AddGroup()));
                    }),
                const Divider(
                  color: AppTheme.blue2,
                  thickness: 1,
                ),
                textContainer(
                    text: 'Create Broadcast',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const CreateBroadcast()));
                    }),
                const Divider(
                  color: AppTheme.blue2,
                  thickness: 1,
                ),
                textContainer(
                    text: 'Invite Staff',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InvitationScreen()));
                    }),
                const Divider(
                  color: AppTheme.blue2,
                  thickness: 1,
                ),
                textContainer(
                  text: 'Help Center',
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRouter.helpCenter,
                      //  MaterialPageRoute(builder: (_) => const HelpCenter()),
                    );
                  },
                ),
                const Divider(
                  color: AppTheme.blue2,
                  thickness: 1,
                ),
                textContainer(
                    text: 'About Bluetick',
                    onPressed: () {
                      Navigator.pushNamed(context, AppRouter.about);
                    }),
                const Divider(
                  color: AppTheme.blue2,
                  thickness: 1,
                ),
                textContainer(text: 'FAQs', onPressed: () {}),
                const Divider(
                  color: AppTheme.blue2,
                  thickness: 1,
                ),
                textContainer(
                  text: 'Logout',
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => const LoginScreen()));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container textContainer(
      {required String text, required VoidCallback onPressed}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 14.0),
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: InkWell(
        onTap: onPressed,
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            color: AppTheme.offWhite,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/app_theme.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        backgroundColor: AppTheme.mainBlue,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff244BA9), Color(0xff162850)],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              textContainer(text: 'Home', onPressed: () {}),
              const Divider(
                color: AppTheme.blue2,
                thickness: 1,
              ),
              textContainer(text: 'Profile', onPressed: () {}),
              const Divider(
                color: AppTheme.blue2,
                thickness: 1,
              ),
              textContainer(text: 'Create Groups', onPressed: () {}),
              const Divider(
                color: AppTheme.blue2,
                thickness: 1,
              ),
              textContainer(text: 'Create Broadcast', onPressed: () {}),
              const Divider(
                color: AppTheme.blue2,
                thickness: 1,
              ),
              textContainer(text: 'Invite Staff', onPressed: () {}),
              const Divider(
                color: AppTheme.blue2,
                thickness: 1,
              ),
              textContainer(text: 'FAQs', onPressed: () {}),
              const Divider(
                color: AppTheme.blue2,
                thickness: 1,
              ),
              textContainer(text: 'Logout', onPressed: () {}),
              const Divider(
                color: AppTheme.blue2,
                thickness: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container textContainer(
      {required String text, required VoidCallback onPressed}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12.0),
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

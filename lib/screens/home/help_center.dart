import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../components/config/config_sheet.dart';
import '../../../components/ui/ui_utils.dart';
import '../../components/constants/app_router/app_router.dart';
import 'invitation_screens/invite_button.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({Key? key}) : super(key: key);

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          'Help Center',
          style: GoogleFonts.montserrat(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: offWhite,
          ),
        ),
        centerTitle: true,
        backgroundColor: mainBlue,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset('Assets/Call center.png'),
              InviteButton(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRouter.contactUsScreen,
                    //  MaterialPageRoute(builder: (_) => const HelpCenter()),
                  );
                },
                text: 'Contact Us', //  ->',
                textColor: Colors.white,
                buttonColor: mainBlue,
              ),
              InviteButton(
                onTap: () {
                  Navigator.pushNamed(context, AppRouter.about);
                },
                text: 'About App', //  ->',
                textColor: Colors.white,
                buttonColor: mainBlue,
              ),
              InviteButton(
                onTap: () {},
                text: 'Privacy Policy', //  ->',
                textColor: Colors.white,
                buttonColor: mainBlue,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

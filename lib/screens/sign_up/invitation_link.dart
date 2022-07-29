import 'package:bluetick/components/app_theme.dart';
import 'package:bluetick/screens/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/widgets/widgets.dart';
import '../home/home_tabs.dart';
import 'staff_sign_up.dart';

class InvitationLink extends StatefulWidget {
  const InvitationLink({Key? key}) : super(key: key);

  @override
  State<InvitationLink> createState() => _InvitationLinkState();
}

class _InvitationLinkState extends State<InvitationLink> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkBlue,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppTheme.darkBlue,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 44.0, vertical: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 25,
            ),
            const GeneralTextField(
              hintText: 'Invitation link',
              textType: TextInputType.name,
            ),
            const SizedBox(
              height: 25,
            ),
            const GeneralTextField(
                hintText: 'Email Address',
                textType: TextInputType.emailAddress),
            SizedBox(
              height: 62,
            ),
            RichText(
                text: TextSpan(
                    text: 'By clicking “Continue”, I agree to the',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.offWhite,
                    ),
                    children: <TextSpan>[
                  TextSpan(
                    text: ' Terms of Service',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.blue2,
                    ),
                  ),
                  TextSpan(
                    text: ' and',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.offWhite,
                    ),
                  ),
                  TextSpan(
                    text: ' Privacy Policy.',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.blue2,
                    ),
                  )
                ])),
            SignUpButton(
              textColor: AppTheme.mainBlue,
              text: 'Continue',
              buttonColor: AppTheme.blue2,
              onTapButton: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) {
                  return StaffSignUp();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}

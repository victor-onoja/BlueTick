import 'package:bluetick/components/app_theme.dart';
import 'package:bluetick/components/config/config_sheet.dart';
import 'package:bluetick/screens/home/home.dart';
import 'package:bluetick/screens/sign_up/email_verification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/widgets/widgets.dart';
import '../home/home_tabs.dart';
import 'staff_sign_up.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkBlue,
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: AppTheme.darkBlue,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 44.0, vertical: 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'Assets/Forgot password.png',
                filterQuality: FilterQuality.high,
                alignment: Alignment.topCenter,
              ),
              Text(
                'Enter  your email Address\nto reset your password',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                    fontSize: 16, fontWeight: FontWeight.w600, color: white),
              ),
              const SizedBox(
                height: 8,
              ),
              const GeneralTextField(
                  hintText: 'Email Address',
                  textType: TextInputType.emailAddress),
              const SizedBox(
                height: 15,
              ),
              SignUpButton(
                textColor: AppTheme.mainBlue,
                text: 'Continue',
                buttonColor: AppTheme.blue2,
                onTapButton: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) {
                    return EmailVerification();
                  }));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

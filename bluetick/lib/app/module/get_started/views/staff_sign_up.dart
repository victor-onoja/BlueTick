import 'package:bluetick/app/module/get_started/views/invitation_link.dart';
import 'package:bluetick/util/app_theme.dart';
import 'package:bluetick/widgets/general_password_text_field.dart';
import 'package:bluetick/widgets/general_text_field.dart';
import 'package:bluetick/widgets/sign_up_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class StaffSignUp extends StatefulWidget {
  const StaffSignUp({Key? key}) : super(key: key);

  @override
  State<StaffSignUp> createState() => _StaffSignUpState();
}

class _StaffSignUpState extends State<StaffSignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkBlue,
      appBar: AppBar(
        backgroundColor: AppTheme.darkBlue,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 44.0, vertical: 24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to SideHustle',
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.offWhite,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'Abcd12300@gmail.com',
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: AppTheme.offWhite,
                ),
                textAlign: TextAlign.center,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 21.0,
                ),
                child: Divider(color: AppTheme.blue2, thickness: 2),
              ),
              Text(
                'You are almost done,\nset up your info',
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppTheme.offWhite,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              const GeneralTextField(
                hintText: 'Full Name',
                textType: TextInputType.name,
              ),
              const SizedBox(
                height: 25,
              ),
              const GeneralTextField(
                  hintText: 'Department', textType: TextInputType.name),
              const SizedBox(
                height: 25,
              ),
              GeneralPasswordTextField(
                hintText: 'Create Password',
                textType: TextInputType.visiblePassword,
                showPassword: true,
              ),
              const SizedBox(
                height: 25,
              ),
              GeneralPasswordTextField(
                hintText: 'Confirm Password',
                textType: TextInputType.visiblePassword,
                showPassword: true,
              ),
              const SizedBox(
                height: 25,
              ),
              SignUpButton(
                textColor: AppTheme.mainBlue,
                text: 'Confirm',
                buttonColor: AppTheme.blue2,
                onTapButton: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const InvitationLink(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

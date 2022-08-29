import 'package:bluetick/components/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/widgets/widgets.dart';
import 'email_verification.dart';

class AdminSignUp extends StatefulWidget {
  const AdminSignUp({Key? key}) : super(key: key);

  @override
  State<AdminSignUp> createState() => _AdminSignUpState();
}

class _AdminSignUpState extends State<AdminSignUp> {
  @override
  Widget build(BuildContext context) {
    final testController = TextEditingController();
    return Scaffold(
      backgroundColor: AppTheme.darkBlue,
      appBar: AppBar(
        backgroundColor: AppTheme.darkBlue,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        iconTheme: IconThemeData(color: AppTheme.offWhite),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 44.0, vertical: 24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const GeneralTextField(
                hintText: 'Email Address',
                textType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 25,
              ),
              const GeneralTextField(
                  hintText: 'Company Name', textType: TextInputType.name),
              const SizedBox(
                height: 25,
              ),
              const GeneralTextField(
                  hintText: 'Phone Number', textType: TextInputType.phone),
              const SizedBox(
                height: 25,
              ),
              GeneralPasswordTextField(
                controller: testController,
                hintText: 'Create Password',
                textType: TextInputType.visiblePassword,
                showPassword: true,
              ),
              const SizedBox(
                height: 25,
              ),
              GeneralPasswordTextField(
                controller: testController,
                hintText: 'Confirm Password',
                textType: TextInputType.visiblePassword,
                showPassword: true,
              ),
              const SizedBox(
                height: 25,
              ),
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
              SizedBox(
                height: 40,
              ),
              SignUpButton(
                textColor: AppTheme.mainBlue,
                text: 'Continue',
                buttonColor: AppTheme.blue2,
                onTapButton: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                            const EmailVerification() // StaffSignUp(),
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

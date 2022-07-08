import 'package:bluetick/screens/sign_up/admin_sign_up.dart';
import 'package:bluetick/components/app_theme.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        key: const Key('login_screen'),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Form(
                //    key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 200),
                        child: GeneralTextField(
                          textType: TextInputType.emailAddress,
                          hintText: 'Email Address',
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: GeneralPasswordTextField(
                              hintText: 'Password',
                              textType: TextInputType.visiblePassword,
                              showPassword: true)),
                      Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: SignUpButton(
                          onTapButton: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const AdminSignUp(),
                              ),
                            );
                          },
                          buttonColor: AppTheme.mainBlue,
                          text: 'Sign in',
                          textColor: AppTheme.white,
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.only(top: 50, bottom: 10),
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            children: [
                              Text(
                                'You have a link? ',
                                style: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: AppTheme.offBlack,
                                ),
                              ),
                              GestureDetector(
                                onTap: () => null,
                                child: Text(
                                  'Join a workspace',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: AppTheme.mainBlue,
                                  ),
                                ),
                              ),
                            ],
                          )),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const AdminSignUp(),
                              ),
                            ),
                            child: Text(
                              'Create a new workspace',
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: AppTheme.mainBlue,
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:bluetick/app/module/get_started/views/admin_sign_up.dart';
import 'package:bluetick/util/app_theme.dart';
import 'package:bluetick/widgets/general_password_text_field.dart';
import 'package:bluetick/widgets/general_text_field.dart';
import 'package:bluetick/widgets/sign_up_button.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                                  'You have a link?',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: AppTheme.mainBlue,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => null,
                                  child: Text(
                                    '\tJoin a workspace',
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: GestureDetector(
                              onTap: () => null,
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
      ),
    );
  }
}

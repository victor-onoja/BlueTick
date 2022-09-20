import 'package:bluetick/components/app_theme.dart';
import 'package:bluetick/components/config/config_sheet.dart';
import 'package:bluetick/components/constants/extensions/notification_extension.dart';
import 'package:bluetick/components/constants/extensions/validation_extension.dart';
import 'package:bluetick/components/services/api_models/admin_signupresponse.dart';
import 'package:bluetick/components/services/api_models/error_model.dart';
import 'package:bluetick/components/services/api_models/forgot_password_body.dart';
import 'package:bluetick/components/services/providers.dart';
import 'package:bluetick/components/widgets/dialogs.dart';
import 'package:bluetick/screens/sign_up/email_verification.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timezone/data/latest.dart' as tz;
import '../../components/widgets/widgets.dart';

class ForgotPassword extends ConsumerStatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends ConsumerState<ForgotPassword> {
  final _formkey = GlobalKey<FormState>();

  void initState() {
    super.initState();
    tz.initializeTimeZones();
  }

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final notifier = ref.read(forgotPasswordProvider.notifier);
    final state = ref.watch(forgotPasswordProvider);
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
          child: Form(
            key: _formkey,
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
                GeneralTextField(
                    validator: context.validateEmailAddress,
                    controller: emailController,
                    hintText: 'Email Address',
                    textType: TextInputType.emailAddress),
                // const SizedBox(
                //   height: 15,
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: state.isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: blue2,
                            valueColor: AlwaysStoppedAnimation(
                                mainBlue.withOpacity(0.8)),
                            backgroundColor: Colors.transparent,
                          ),
                        )
                      : SignUpButton(
                          textColor: AppTheme.mainBlue,
                          text: 'Continue',
                          buttonColor: AppTheme.blue2,
                          onTapButton: () async {
                            if (_formkey.currentState!.validate()) {
                              ForgotPasswordBody forgotPasswordBody =
                                  ForgotPasswordBody(
                                      email: emailController.text);
                              var res = await notifier
                                  .forgotpassrequest(forgotPasswordBody);
                              if (res.isLeft) {
                                ErrorModel errorModel = res.left;
                                showSnackBar(
                                    context, errorModel.message!['message']);
                              } else {
                                AdminSignupresponse adminSignupresponse =
                                    res.right;
                                showSnackBar(
                                    context, adminSignupresponse.message!);
                              }
                              if (res.isRight) {
                                AdminSignupresponse adminSignupresponse =
                                    res.right;
                                if (adminSignupresponse.token != null) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EmailVerification(
                                        emailp: emailController.text,
                                        check: true,
                                      ),
                                    ),
                                  );
                                }
                                if (adminSignupresponse.token != null) {
                                  NotificationExtension().showNotification(
                                      2,
                                      'Reset Password Token',
                                      adminSignupresponse.token!,
                                      3);
                                }
                              }
                            }
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:bluetick/components/app_theme.dart';
import 'package:bluetick/components/config/config_sheet.dart';
import 'package:bluetick/components/constants/extensions/notification_extension.dart';
import 'package:bluetick/components/constants/extensions/validation_extension.dart';
import 'package:bluetick/components/services/api_models/admin_signupbody.dart';
import 'package:bluetick/components/services/api_models/admin_signupresponse.dart';
import 'package:bluetick/components/services/api_models/error_model.dart';
import 'package:bluetick/components/services/providers.dart';
import 'package:bluetick/components/widgets/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../components/widgets/widgets.dart';
import 'email_verification.dart';
import 'package:timezone/data/latest.dart' as tz;

class AdminSignUp extends ConsumerStatefulWidget {
  @override
  _RiverpodAdminSignUpState createState() => _RiverpodAdminSignUpState();
}

class _RiverpodAdminSignUpState extends ConsumerState<AdminSignUp> {
  final _formKey = GlobalKey<FormState>();

  void initState() {
    super.initState();
    tz.initializeTimeZones();
  }

  @override
  Widget build(BuildContext context) {
    final aemailController = TextEditingController();
    final apasswordController = TextEditingController();
    final password2Controller = TextEditingController();
    final phoneController = TextEditingController();
    final workspacenameController = TextEditingController();
    final notifier = ref.read(adminSignupProvider.notifier);
    final state = ref.watch(adminSignupProvider);
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
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                GeneralTextField(
                  validator: context.validateEmailAddress,
                  controller: aemailController,
                  hintText: 'Email Address',
                  textType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 25,
                ),
                GeneralTextField(
                    controller: workspacenameController,
                    validator: context.validateFieldNotEmpty,
                    hintText: 'Company Name',
                    textType: TextInputType.name),
                const SizedBox(
                  height: 25,
                ),
                GeneralTextField(
                    controller: phoneController,
                    validator: context.validatePhoneNumber,
                    hintText: 'Phone Number',
                    textType: TextInputType.phone),
                const SizedBox(
                  height: 25,
                ),
                GeneralPasswordTextField(
                  controller: apasswordController,
                  validator: context.validatePassword,
                  hintText: 'Create Password',
                  textType: TextInputType.visiblePassword,
                  showPassword: true,
                ),
                const SizedBox(
                  height: 25,
                ),
                GeneralPasswordTextField(
                  controller: password2Controller,
                  validator: (value) =>
                      value != apasswordController.text || value!.isEmpty
                          ? 'Confirm your password'
                          : null,
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
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: state.isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: mainBlue,
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
                            if (_formKey.currentState!.validate()) {
                              AdminSignupbody adminSignupbody = AdminSignupbody(
                                  email: aemailController.text,
                                  password1: apasswordController.text,
                                  password2: password2Controller.text,
                                  phone: phoneController.text,
                                  workspaceName: workspacenameController.text);
                              var res = await notifier
                                  .adminSignuprequest(adminSignupbody);
                              if (res.isLeft) {
                                ErrorModel errorMessage = res.left;

                                showSnackBar(
                                    context, errorMessage.message!['message']);
                              } else {
                                AdminSignupresponse adminsignup = res.right;
                                showSnackBar(context, adminsignup.message!);
                              }
                              if (res.isRight) {
                                AdminSignupresponse adminsignup = res.right;

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EmailVerification(
                                            emailw: aemailController.text,
                                            check: false,
                                          ) // StaffSignUp(),
                                      ),
                                );
                                NotificationExtension().showNotification(
                                    1,
                                    'Workspace Verification Token',
                                    adminsignup.token!,
                                    3);
                              } else {}
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

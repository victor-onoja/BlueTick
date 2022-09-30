import 'package:bluetick/components/app_theme.dart';
import 'package:bluetick/components/config/config_sheet.dart';
import 'package:bluetick/components/services/api_models/error_model.dart';
import 'package:bluetick/components/services/api_models/verify_workspacebody.dart';
import 'package:bluetick/components/services/api_models/verify_workspaceresponse.dart';
import 'package:bluetick/components/services/providers.dart';
import 'package:bluetick/components/widgets/dialogs.dart';
import 'package:bluetick/components/widgets/verifyInputField.dart';
import 'package:bluetick/screens/home/home_tabs.dart';
import 'package:bluetick/screens/sign_up/new_password.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../components/widgets/widgets.dart';

class EmailVerification extends ConsumerStatefulWidget {
  ///emailp - email from forgotpassword screen
  final String? emailp;

  ///emailw - email from adminsignup screen
  final String? emailw;

  final bool? check;
  EmailVerification({Key? key, this.emailp, this.emailw, this.check})
      : super(key: key);

  @override
  _RiverpodEmailVerificationState createState() =>
      _RiverpodEmailVerificationState();
}

class _RiverpodEmailVerificationState extends ConsumerState<EmailVerification> {
  late final TextEditingController otpController1;
  late final TextEditingController otpController2;
  late final TextEditingController otpController3;
  late final TextEditingController otpController4;
  late final TextEditingController otpController5;
  late final TextEditingController otpController6;

  @override
  void initState() {
    otpController1 = TextEditingController();
    otpController2 = TextEditingController();
    otpController3 = TextEditingController();
    otpController4 = TextEditingController();
    otpController5 = TextEditingController();
    otpController6 = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    otpController1.dispose();
    otpController2.dispose();
    otpController3.dispose();
    otpController4.dispose();
    otpController5.dispose();
    otpController6.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    final notifier = ref.read(verifyWorkspaceProvider.notifier);
    final state = ref.watch(verifyWorkspaceProvider);
    final notifier2 = ref.read(verifyPasswordProvider.notifier);
    final state2 = ref.watch(verifyPasswordProvider);
    return Scaffold(
      backgroundColor: AppTheme.offWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: BackButton(
            color: darkBlue, onPressed: () => Navigator.pop(context)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(image: AssetImage('Assets/images/Authentication.png')),
              Text(
                'Enter Verification Code',
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.darkBlue2,
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: _formkey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    VeryInputField(controller: otpController1),
                    VeryInputField(controller: otpController2),
                    VeryInputField(controller: otpController3),
                    VeryInputField(controller: otpController4),
                    VeryInputField(controller: otpController5),
                    VeryInputField(controller: otpController6),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: widget.check!
                    ? state2.isLoading
                        ? Center(
                            child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: mainBlue,
                            valueColor: AlwaysStoppedAnimation(
                                mainBlue.withOpacity(0.8)),
                            backgroundColor: Colors.transparent,
                          ))
                        : Center(
                            child: SignUpButton(
                              text: 'Confirm',
                              textColor: AppTheme.white,
                              buttonColor: mainBlue,
                              onTapButton: () async {
                                if (_formkey.currentState!.validate()) {
                                  String otp = otpController1.text +
                                      otpController2.text +
                                      otpController3.text +
                                      otpController4.text +
                                      otpController5.text +
                                      otpController6.text;
                                  int tokin = int.parse(otp);
                                  // print(tokin);
                                  // print(emailp);
                                  VerifyWorkspacebody verifyWorkspacebody =
                                      VerifyWorkspacebody(
                                          token: tokin, email: widget.emailp);
                                  var res =
                                      await notifier2.verifyPasswordrequest(
                                          verifyWorkspacebody);
                                  if (res.isLeft) {
                                    ErrorModel errorModel = res.left;
                                    showSnackBar(
                                        context,
                                        errorModel.message!['message'] +
                                            '. Or re-enter your token');
                                  } else {
                                    VerifyWorkspaceresponse
                                        verifyWorkspaceresponse = res.right;
                                    showSnackBar(context,
                                        verifyWorkspaceresponse.message!);
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => NewPassword(
                                          email: widget.emailp,
                                        ),
                                      ),
                                    );
                                  }
                                  otpController1.clear();
                                  otpController2.clear();
                                  otpController3.clear();
                                  otpController4.clear();
                                  otpController5.clear();
                                  otpController6.clear();
                                  // print(tokenOtp.runtimeType);
                                }
                              },
                            ),
                          )
                    : state.isLoading
                        ? Center(
                            child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: mainBlue,
                            valueColor: AlwaysStoppedAnimation(
                                mainBlue.withOpacity(0.8)),
                            backgroundColor: Colors.transparent,
                          ))
                        : Center(
                            child: SignUpButton(
                              text: 'Confirm',
                              textColor: AppTheme.white,
                              buttonColor: mainBlue,
                              onTapButton: () async {
                                if (_formkey.currentState!.validate()) {
                                  String otp = otpController1.text +
                                      otpController2.text +
                                      otpController3.text +
                                      otpController4.text +
                                      otpController5.text +
                                      otpController6.text;
                                  int tokin = int.parse(otp);

                                  VerifyWorkspacebody verifyWorkspacebody =
                                      VerifyWorkspacebody(
                                          token: tokin, email: widget.emailw);
                                  var res =
                                      await notifier.verifyWorkspacerequest(
                                          verifyWorkspacebody);
                                  if (res.isLeft) {
                                    ErrorModel errorModel = res.left;
                                    showSnackBar(
                                        context,
                                        errorModel.message!['message'] +
                                            '. Or re-enter your token');
                                  } else {
                                    VerifyWorkspaceresponse
                                        verifyWorkspaceresponse = res.right;
                                    showSnackBar(context,
                                        verifyWorkspaceresponse.message!);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => HomeTab(),
                                      ),
                                    );
                                  }
                                  otpController1.clear();
                                  otpController2.clear();
                                  otpController3.clear();
                                  otpController4.clear();
                                  otpController5.clear();
                                  otpController6.clear();
                                  // print(tokenOtp.runtimeType);
                                }
                              },
                            ),
                          ),
              ),
              const SizedBox(
                height: 30, //115,
              ),
              Center(
                child: Text(
                  'Expired Code or Didn\'t Receive?',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.darkBlue2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 11,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Resend',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.mainBlue,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

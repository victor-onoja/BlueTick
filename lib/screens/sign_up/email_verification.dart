import 'package:bluetick/components/app_theme.dart';
import 'package:bluetick/components/config/config_sheet.dart';
import 'package:bluetick/components/services/api_models/error_model.dart';
import 'package:bluetick/components/services/api_models/verify_workspacebody.dart';
import 'package:bluetick/components/services/api_models/verify_workspaceresponse.dart';
import 'package:bluetick/components/services/providers.dart';
import 'package:bluetick/components/widgets/dialogs.dart';
import 'package:bluetick/components/widgets/verifyInputField.dart';
import 'package:bluetick/screens/home/home_tabs.dart';
import 'package:bluetick/screens/sign_in/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../components/widgets/widgets.dart';

final otpController1 = TextEditingController();
final otpController2 = TextEditingController();
final otpController3 = TextEditingController();
final otpController4 = TextEditingController();
final otpController5 = TextEditingController();
final otpController6 = TextEditingController();

final otp = otpController1.text +
    otpController2.text +
    otpController3.text +
    otpController4.text +
    otpController5.text +
    otpController6.text;

int tokenOtp = int.parse(otp);

class EmailVerification extends HookConsumerWidget {
  final String? email;
  const EmailVerification({Key? key, this.email}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(verifyWorkspaceProvider.notifier);
    final state = ref.watch(verifyWorkspaceProvider);
    return Scaffold(
      backgroundColor: AppTheme.offWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: darkBlue,
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen())),
        ),
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
              Row(
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
              // const SizedBox(
              //   height: 18,
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: state.isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: mainBlue,
                        valueColor:
                            AlwaysStoppedAnimation(mainBlue.withOpacity(0.8)),
                        backgroundColor: Colors.transparent,
                      ))
                    : Center(
                        child: SignUpButton(
                          text: 'Confirm',
                          textColor: AppTheme.white,
                          buttonColor: mainBlue,
                          onTapButton: () async {
                            VerifyWorkspacebody verifyWorkspacebody =
                                VerifyWorkspacebody(
                                    token: tokenOtp, email: email);
                            var res = await notifier
                                .verifyWorkspacerequest(verifyWorkspacebody);
                            if (res.isLeft) {
                              ErrorModel errorModel = res.left;
                              showSnackBar(
                                  context, errorModel.message!['message']);
                            } else {
                              VerifyWorkspaceresponse verifyWorkspaceresponse =
                                  res.right;
                              showSnackBar(
                                  context, verifyWorkspaceresponse.message!);

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => HomeTab(),
                                ),
                              );
                            }

                            // print(tokenOtp.runtimeType);
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

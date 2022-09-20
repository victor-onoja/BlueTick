import 'package:bluetick/components/app_theme.dart';
import 'package:bluetick/components/config/config_sheet.dart';
import 'package:bluetick/components/constants/extensions/validation_extension.dart';
import 'package:bluetick/components/services/api_models/error_model.dart';
import 'package:bluetick/components/services/api_models/reset_password_body.dart';
import 'package:bluetick/components/services/api_models/verify_workspaceresponse.dart';
import 'package:bluetick/components/services/providers.dart';
import 'package:bluetick/components/widgets/dialogs.dart';
import 'package:bluetick/screens/sign_in/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../components/widgets/widgets.dart';

class NewPassword extends HookConsumerWidget {
  final String? email;
  NewPassword({Key? key, this.email}) : super(key: key);
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pController = TextEditingController();
    final p2Controller = TextEditingController();

    final notifier = ref.read(resetPasswordProvider.notifier);
    final state = ref.watch(resetPasswordProvider);
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
                Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: Text(
                    'Create Your New Password',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: white),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                GeneralPasswordTextField(
                    showPassword: true,
                    validator: context.validatePassword,
                    controller: pController,
                    hintText: 'New Password',
                    textType: TextInputType.emailAddress),
                const SizedBox(
                  height: 25,
                ),
                GeneralPasswordTextField(
                    showPassword: true,
                    validator: (value) =>
                        value != pController.text || value!.isEmpty
                            ? 'Confirm your password'
                            : null,
                    controller: p2Controller,
                    hintText: 'Confirm password',
                    textType: TextInputType.emailAddress),
                Padding(
                  padding: const EdgeInsets.only(top: 155.0),
                  child: state.isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: offWhite,
                            valueColor: AlwaysStoppedAnimation(
                                mainBlue.withOpacity(0.8)),
                            backgroundColor: Colors.transparent,
                          ),
                        )
                      : SignUpButton(
                          textColor: AppTheme.mainBlue,
                          text: 'Confirm',
                          buttonColor: AppTheme.blue2,
                          // onTapButton: () {
                          //   print(email);
                          // },
                          onTapButton: () async {
                            if (_formkey.currentState!.validate()) {
                              ResetPasswordBody resetPasswordBody =
                                  ResetPasswordBody(
                                      email: email,
                                      password: pController.text,
                                      password2: p2Controller.text);
                              var res = await notifier
                                  .restPasswordrequest(resetPasswordBody);
                              if (res.isLeft) {
                                ErrorModel errorModel = res.left;
                                showSnackBar(
                                    context, errorModel.message!['message']);
                              } else {
                                VerifyWorkspaceresponse
                                    verifyWorkspaceresponse = res.right;
                                showSnackBar(
                                    context, verifyWorkspaceresponse.message!);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => LoginScreen()));
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

import 'package:bluetick/components/app_theme.dart';
import 'package:bluetick/components/services/api_models/error_model.dart';
import 'package:bluetick/components/services/api_models/staff_sign_up_body.dart';
import 'package:bluetick/components/services/api_models/staff_sign_up_response.dart';
import 'package:bluetick/components/services/providers.dart';
import 'package:bluetick/components/services/staff_signup_repo.dart';
import 'package:bluetick/components/widgets/dialogs.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../components/widgets/app_circular_indicator.dart';
import '/components/constants/extensions/validation_extension.dart';
import '../../components/widgets/widgets.dart';
import 'staff_sign_up.dart';

class InvitationLink extends HookConsumerWidget {
  InvitationLink({Key? key}) : super(key: key);

  @override
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final linkController = useTextEditingController();
    final emailController = useTextEditingController();
    final staffSignUpState = ref.watch(staffSignUpProvider);
    final staffSignUpNotifier = ref.read(staffSignUpProvider.notifier);
    return Scaffold(
      backgroundColor: AppTheme.darkBlue,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppTheme.darkBlue,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 44.0, vertical: 24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 25,
              ),
              GeneralTextField(
                hintText: 'Invitation link',
                textType: TextInputType.name,
                validator: context.validateFieldNotEmpty,
                controller: linkController,
              ),
              const SizedBox(
                height: 25,
              ),
              GeneralTextField(
                validator: context.validateEmailAddress,
                hintText: 'Email Address',
                textType: TextInputType.emailAddress,
                controller: emailController,
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
                    ]),
              ),
              const SizedBox(
                height: 20,
              ),
              staffSignUpState.isLoading
                  ? AppCircularIndicator()
                  : SignUpButton(
                      textColor: AppTheme.mainBlue,
                      text: 'Continue',
                      buttonColor: AppTheme.blue2,
                      onTapButton: () async {
                        if (_formKey.currentState!.validate()) {
                          StaffSignUpBody staffSignUpBody = StaffSignUpBody(
                              email: emailController.text,
                              invitationLink: linkController.text);
                          Either result = await staffSignUpNotifier
                              .staffSignUp(staffSignUpBody);

                          if (result.isLeft) {
                            ErrorModel errorModel = result.left;
                            showSnackBar(
                                context, errorModel.message!['message']);
                          } else {
                            StaffSignUpResponse response = result.right;
                            showSnackBar(context, 'Link Correct! Welcome');
                            ref.read(workspaceProvider.notifier).state =
                                response.workspaceName!;

                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (_) {
                              return StaffSignUp(email: emailController.text,);
                            }));
                          }
                        }
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}



import 'package:bluetick/components/app_theme.dart';
import 'package:bluetick/components/services/api_models/error_model.dart';
import 'package:bluetick/components/services/api_models/sign_up_body.dart';
import 'package:bluetick/components/services/api_models/sign_up_response.dart';
import 'package:bluetick/components/services/providers.dart';
import 'package:bluetick/components/services/sign_up_repo.dart';
import 'package:bluetick/components/widgets/app_circular_indicator.dart';
import 'package:bluetick/components/widgets/dialogs.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '/components/constants/extensions/validation_extension.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../components/widgets/widgets.dart';
import '../home/co_wokers/co_wokers_home_tab.dart';

class StaffSignUp extends StatefulHookConsumerWidget {
  final String? email;
  const StaffSignUp({Key? key, this.email}) : super(key: key);

  @override
  ConsumerState<StaffSignUp> createState() => _StaffSignUpState();
}

class _StaffSignUpState extends ConsumerState<StaffSignUp> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final fullNameContoller = useTextEditingController();
    final roleContoller = useTextEditingController();
    final passwordContoller = useTextEditingController();
    final confirmPasswordContoller = useTextEditingController();
    final signUpState = ref.watch(signUpProvider);
    final signUpNotifier = ref.read(signUpProvider.notifier);
    final String? workspaceName = ref.read(workspaceProvider);
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
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to $workspaceName',
                  style: GoogleFonts.montserrat(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.offWhite,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  widget.email ?? 'Abcd12300@gmail.com',
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
                GeneralTextField(
                  hintText: 'Full Name',
                  textType: TextInputType.name,
                  controller: fullNameContoller,
                  validator: context.validateFieldNotEmpty,
                ),
                const SizedBox(
                  height: 25,
                ),
                GeneralTextField(
                    hintText: 'Role',
                    textType: TextInputType.name,
                    controller: roleContoller,
                    validator: context.validateFieldNotEmpty),
                const SizedBox(
                  height: 25,
                ),
                GeneralPasswordTextField(
                  controller: passwordContoller,
                  validator: context.validateFieldNotEmpty,
                  hintText: 'Create Password',
                  textType: TextInputType.visiblePassword,
                  showPassword: true,
                ),
                const SizedBox(
                  height: 25,
                ),
                GeneralPasswordTextField(
                  controller: confirmPasswordContoller,
                  hintText: 'Confirm Password',
                  textType: TextInputType.visiblePassword,
                  showPassword: true,
                  validator: (String? value) {
                    if (value != passwordContoller.text) {
                      return 'passwords must match';
                    }
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                signUpState.isLoading
                    ? AppCircularIndicator()
                    : SignUpButton(
                        textColor: AppTheme.mainBlue,
                        text: 'Confirm',
                        buttonColor: AppTheme.blue2,
                        onTapButton: () async {
                          if (_formKey.currentState!.validate()) {
                            SignUpBody signUpBody = SignUpBody(
                              email: widget.email,
                              fullName: fullNameContoller.text,
                              password1: passwordContoller.text,
                              password2: confirmPasswordContoller.text,
                              role: roleContoller.text,
                            );
                            Either result =
                                await signUpNotifier.signUp(signUpBody);

                            if (result.isLeft) {
                              ErrorModel error = result.left;
                              showSnackBar(context, error.message!['message']);
                            } else {
                              SignUpResponse response = result.right;
                              showSnackBar(context, response.message!);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const CoWorkerHomeTab(),
                                ),
                              );
                            }
                          }
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

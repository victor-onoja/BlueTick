import 'dart:convert';

import 'package:bluetick/components/constants/app_router/app_router.dart';
import 'package:bluetick/components/services/api_models/error_model.dart';
import 'package:bluetick/components/services/api_models/login.dart';
import 'package:bluetick/components/services/login_repo.dart';
import 'package:bluetick/components/widgets/dialogs.dart';

import 'package:bluetick/screens/sign_up/admin_sign_up.dart';
import 'package:bluetick/components/app_theme.dart';
import "package:flutter/material.dart";
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../components/services/api_models/signup_api_model.dart';
import '../../components/services/providers.dart';

import '../../components/widgets/widgets.dart';

import '../sign_up/invitation_link.dart';

final SignInProviderData = FutureProvider<List>((ref) async {
  return ref.watch(signInProvider).signIn(email: 'rh', password: 'hd');
});

// final emailController = useTextEditingController();
//final passwordControllerOne = useTextEditingController();

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///  final signInResponse = ref.watch(SignInProviderData);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
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
                      Image.asset('Assets/BTlogo.png'),
                      Padding(
                          padding: const EdgeInsets.only(top: 100),
                          child: TextField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'Email Address',
                              labelStyle: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppTheme.blue2,
                              ),
                              //const TextStyle(color: AppTheme.blue2),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 16),
                              fillColor: AppTheme.offWhite,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  color: AppTheme.mainBlue,
                                  width: 2,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  color: AppTheme.mainBlue,
                                  width: 2,
                                ),
                              ),
                            ),
                          )

                          ///to use
                          // GeneralTextField(
                          //   textType: TextInputType.emailAddress,
                          //   hintText: 'Email Address',
                          // ),

                          ),
                      Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: GeneralPasswordTextField(
                              controller: passwordController,
                              hintText: 'Password',
                              textType: TextInputType.visiblePassword,
                              showPassword: true)),
                      SizedBox(
                        height: 11,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            child: Text(
                              'Forgot Password',
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: AppTheme.mainBlue,
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamed(
                                  context, AppRouter.forgotPassword);
                            },
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 78),
                        child: SignUpButton(
                          onTapButton: () async {
                            _LogInUser(context);
                            if (emailController.text.isEmpty ||
                                passwordController.text.isEmpty) {
                              showSnackBar(
                                  context, 'Input fields can not be empty');
                            } else {
                              final signInResponse =
                                  ref.watch(SignInProviderData);
                              signInResponse.when(
                                  data: (data) =>
                                      showSnackBar(context, data[0].message),
                                  error: (error, s) =>
                                      showSnackBar(context, error.toString()),
                                  loading: () => CircularProgressIndicator());
                              // signInResponse.when(
                              //   data: (data) async {
                              //     final test = SignInServices();
                              //     await test.signIn(
                              //         email: emailController.text.trim(),
                              //         password: passwordController.text);
                              //
                              //     showSnackBar(context, data[0].message);
                              //     // return Text(data[0].message);
                              //   },
                              //   error: (error, stackTrace) => Text(
                              //     '${error.toString()} and its coming from ${stackTrace}',
                              //   ),
                              //   loading: () => Center(
                              //     child: CircularProgressIndicator(),
                              //   ),
                              // );

                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (_) => const HomeTab(),
                              //   ),
                              // );
                              // emailController.clear();
                              /// passwordController.clear();
                            }
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
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            InvitationLink())),
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

void _LogInUser(context) async {
  Login login = const Login(email: "chaierr@gmail.com", password: "123435");

  var result = await LoginRepo().loginRequest(login);

  if (result.isLeft) {
    Error errorMessage = result.left;

    showSnackBar(context, errorMessage.message!['message']);
    print('''
    This is the error message
    ${errorMessage.message!}
   Test trial
   Thank you
       ${errorMessage.message!['message']}     
    ''');
  } else {
    Welcome login = result.right;

    print('''
    success
    message is
    ${login.message},
    token is 
    ${login.token},
    ''');
  }
}

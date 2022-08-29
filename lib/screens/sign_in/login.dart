import 'package:bluetick/components/constants/app_router/app_router.dart';
import 'package:bluetick/components/widgets/dialogs.dart';
import 'package:bluetick/screens/home/home_tabs.dart';
import 'package:bluetick/screens/sign_up/admin_sign_up.dart';
import 'package:bluetick/components/app_theme.dart';
import "package:flutter/material.dart";
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../components/services/api_models/signup_api_model.dart';
import '../../components/services/providers.dart';
import '../../components/services/signin_services.dart';
import '../../components/widgets/widgets.dart';
import '../home/home.dart';
import '../sign_up/invitation_link.dart';

final SignInProviderData = FutureProvider<List<Welcome>>((ref) async {
  return ref
      .watch(signInProvider)
      .signIn(email: emailController.text, password: passwordController.text);
});

final emailController = useTextEditingController();
final passwordController = useTextEditingController();

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final singInResponse = ref.watch(SignInProviderData);
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
                            if (emailController.text.isEmpty ||
                                passwordController.text.isEmpty) {
                              showSnackBar(
                                  context, 'Input fields can not be empty');
                            } else {
                              singInResponse.when(
                                data: (data) async {
                                  final test = SignInServices();
                                  await test.signIn(
                                      email: emailController.text.trim(),
                                      password: passwordController.text);

                                  return Text(data[0].message);
                                },
                                error: (error, stackTrace) => Text(
                                  '${error.toString()} and its coming from ${stackTrace}',
                                ),
                                loading: () => Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );

                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (_) => const HomeTab(),
                              //   ),
                              // );
                              // emailController.clear();
                              passwordController.clear();
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

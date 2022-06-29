import 'package:bluetick/screens/sign_up/staff_sign_up.dart';
import 'package:bluetick/components/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../components/widgets/widgets.dart';

class AdminSignUp extends StatefulWidget {
  const AdminSignUp({Key? key}) : super(key: key);

  @override
  State<AdminSignUp> createState() => _AdminSignUpState();
}

class _AdminSignUpState extends State<AdminSignUp> {
  @override
  Widget build(BuildContext context) {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const GeneralTextField(
                hintText: 'Email Address',
                textType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 25,
              ),
              const GeneralTextField(
                  hintText: 'Company Name', textType: TextInputType.name),
              const SizedBox(
                height: 25,
              ),
              const GeneralTextField(
                  hintText: 'Phone Number', textType: TextInputType.phone),
              const SizedBox(
                height: 25,
              ),
              GeneralPasswordTextField(
                hintText: 'Create Password',
                textType: TextInputType.visiblePassword,
                showPassword: true,
              ),
              const SizedBox(
                height: 25,
              ),
              GeneralPasswordTextField(
                hintText: 'Confirm Password',
                textType: TextInputType.visiblePassword,
                showPassword: true,
              ),
              const SizedBox(
                height: 25,
              ),
              SignUpButton(
                textColor: AppTheme.mainBlue,
                text: 'Confirm',
                buttonColor: AppTheme.blue2,
                onTapButton: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const StaffSignUp(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

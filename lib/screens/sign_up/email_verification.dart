import 'package:bluetick/components/app_theme.dart';
import 'package:bluetick/components/config/config_sheet.dart';
import 'package:bluetick/screens/home/home_tabs.dart';
import 'package:bluetick/screens/sign_in/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/widgets/widgets.dart';

final otpController = TextEditingController();

class EmailVerification extends StatelessWidget {
  const EmailVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  InputField(),
                  InputField(),
                  InputField(),
                  InputField(),
                  InputField(),
                  InputField(),
                ],
              ),
              const SizedBox(
                height: 38,
              ),
              Center(
                child: SignUpButton(
                  text: 'Confirm',
                  textColor: AppTheme.white,
                  buttonColor: mainBlue,
                  onTapButton: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => HomeTab(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 115,
              ),
              Center(
                child: Text(
                  'Expired Code or Didn’t Receive?',
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

  Container InputField() {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          border: Border.all(
            width: 2,
            color: AppTheme.darkBlue,
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 6),
              blurRadius: 12,
              color: Color.fromRGBO(22, 40, 80, 0.4),
            ),
          ]),
      alignment: Alignment.center,
      child: Center(
        child: Builder(builder: (context) {
          return TextField(
            //   controller: otpController,
            onChanged: (val) {
              if (val.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            autofocus: true,

            onSubmitted: (val) {
              print(
                  'The value of the pin is $val...and controller is ${otpController.text}');
            },
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            cursorColor: AppTheme.darkBlue,
            style: TextStyle(fontSize: 20),
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: InputDecoration(
              helperMaxLines: 1,
              errorMaxLines: 1,
              hintMaxLines: 1,
            ),
          );
        }),
      ),
    );
  }
}

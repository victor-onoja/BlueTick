import 'package:bluetick/components/app_theme.dart';
import 'package:bluetick/components/config/config_sheet.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpButton extends StatelessWidget {
  final String text;
  final Color buttonColor;
  final Color textColor;
  final onTapButton;
  const SignUpButton({
    Key? key,
    required this.text,
    required this.buttonColor,
    required this.textColor,
    required this.onTapButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12),
      child: ElevatedButton(
        onPressed: onTapButton,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(150, 53),
          //side: BorderSide(),
          shadowColor: mainBlue.withOpacity(0.5),
          elevation: 6,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          primary: buttonColor,
        ),
        child: Text(
          text,
          style: GoogleFonts.montserrat(
              fontSize: 24, fontWeight: FontWeight.w600, color: textColor),
        ),
      ),
    );
  }
}

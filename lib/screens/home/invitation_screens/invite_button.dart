import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../components/config/config_sheet.dart';

class InviteButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color buttonColor;
  final VoidCallback onTap;

  const InviteButton({
    Key? key,
    required this.text,
    required this.textColor,
    required this.buttonColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: ElevatedButton(
          onPressed: onTap,
          style: ButtonStyle(
            shape: MaterialStateProperty.resolveWith(
              (states) => const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(24.0),
                ),
              ),
            ),
            shadowColor: MaterialStateProperty.all(
              Color(0xff122771).withOpacity(0.4),
            ),
            elevation: MaterialStateProperty.all(16),
            backgroundColor:
                MaterialStateColor.resolveWith((states) => buttonColor),
            fixedSize: MaterialStateProperty.resolveWith(
              (states) => const Size(396, 63),
            ),
          ),
          child: Text(
            text,
            style: GoogleFonts.montserrat(
                color: textColor, fontSize: 24, fontWeight: FontWeight.w600),
          ),
        ));
  }
}

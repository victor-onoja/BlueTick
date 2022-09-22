import 'package:bluetick/components/config/config_sheet.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_theme.dart';

void showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    duration: const Duration(milliseconds: 2000),
    elevation: 10,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(10),
        topLeft: Radius.circular(10),
      ),
    ),
    backgroundColor: mainBlue,
    content: Text(
      message,
      textAlign: TextAlign.center,
      style: GoogleFonts.montserrat(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppTheme.blue2,
      ),
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

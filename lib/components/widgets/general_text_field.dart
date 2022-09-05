import 'package:bluetick/components/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/config_sheet.dart';

class GeneralTextField extends StatelessWidget {
  //final TextEditingController controller;
  final String hintText;
  final TextInputType textType;
  final String? Function(String?)? validator;
  const GeneralTextField({
    Key? key,
    required this.hintText,
    required this.textType,
    this.validator,
    //required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      keyboardType: textType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.montserrat(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppTheme.blue2,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
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
          borderSide: BorderSide(
            color: AppTheme.mainBlue,
            width: 2,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: warningRed,
            width: 2,
          ),
        ),
      ),
    );
  }
}

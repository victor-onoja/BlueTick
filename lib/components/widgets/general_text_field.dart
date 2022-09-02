import 'package:bluetick/components/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GeneralTextField extends StatelessWidget {
  //final TextEditingController controller;
  final String hintText;
  final TextInputType textType;
  const GeneralTextField({
    Key? key,
    required this.hintText,
    required this.textType,
    //required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textType,
      decoration: InputDecoration(
        labelText: hintText,
        labelStyle: GoogleFonts.montserrat(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppTheme.blue2,
        ),
        //const TextStyle(color: AppTheme.blue2),
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
          borderSide: const BorderSide(
            color: AppTheme.mainBlue,
            width: 2,
          ),
        ),
      ),
    );
  }
}

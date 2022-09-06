import 'package:bluetick/components/app_theme.dart';
import 'package:bluetick/components/config/config_sheet.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GeneralPasswordTextField extends StatefulWidget {
  final String hintText;
  final TextInputType textType;
  final TextEditingController controller;
  bool showPassword = false;
  String? Function(String?)? validator;
  GeneralPasswordTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.textType,
    this.validator,
    required this.showPassword,
  }) : super(key: key);

  @override
  State<GeneralPasswordTextField> createState() =>
      _GeneralPasswordTextFieldState();
}

class _GeneralPasswordTextFieldState extends State<GeneralPasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      keyboardType: widget.textType,
      obscureText: widget.showPassword,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: GoogleFonts.montserrat(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppTheme.blue2,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(vertical: .200),
          child: IconButton(
            onPressed: () {
              setState(() {
                widget.showPassword = !widget.showPassword;
              });
            },
            icon: widget.showPassword
                ? const Icon(
                    Icons.visibility,
                    color: AppTheme.mainBlue,
                  )
                : const Icon(
                    Icons.visibility_off,
                    color: AppTheme.mainBlue,
                  ),
          ),
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
          borderSide: const BorderSide(
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

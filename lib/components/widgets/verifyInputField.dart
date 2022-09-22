import 'package:bluetick/components/app_theme.dart';
import 'package:bluetick/components/constants/extensions/validation_extension.dart';
import 'package:flutter/material.dart';

class VeryInputField extends StatelessWidget {
  final TextEditingController controller;
  const VeryInputField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        child: TextFormField(
          validator: context.validateFieldNotEmpty,
          controller: controller,
          onChanged: (val) {
            if (val.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
          // autofocus: true,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          cursorColor: AppTheme.darkBlue,
          style: TextStyle(fontSize: 20),
          // inputFormatters: [
          //   LengthLimitingTextInputFormatter(1),
          //   FilteringTextInputFormatter.digitsOnly
          // ],
          decoration: InputDecoration(
            helperMaxLines: 1,
            errorMaxLines: 1,
            hintMaxLines: 1,
          ),
        ),
      ),
    );
  }
}

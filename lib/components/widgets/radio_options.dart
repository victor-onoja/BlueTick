import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/config_sheet.dart';

class BTRadioOption<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final String label;
  final String text;
  final ValueChanged<T?> onChanged;

  const BTRadioOption(
      {required this.value,
      required this.groupValue,
      required this.label,
      required this.text,
      required this.onChanged});

  Widget _buildLabel() {
    final bool isSelected = value == groupValue;

    return Container(
      width: 24,
      height: 24,
      margin: const EdgeInsets.only(right: 15),
      decoration: ShapeDecoration(
          color: isSelected ? mainBlue : offWhite,
          shape: CircleBorder(side: BorderSide(color: offWhite, width: 3.0))),
    );
  }

  Widget _buildText() {
    return Text(
      text,
      style: GoogleFonts.montserrat(
          color: offWhite, fontSize: 16, fontWeight: FontWeight.w500),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      horizontalTitleGap: 5,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      visualDensity: VisualDensity.compact,
      onTap: () => onChanged(value),
      leading: _buildLabel(),
      title: _buildText(),
    );
  }
}

import 'package:flutter/material.dart';

const double fillStopBlue2 = 54.93 /100;
const double fillStopOffWhite = 15.27 /100;

const List<double> linearWhiteStops = [ 0.0, fillStopOffWhite,  fillStopBlue2];

final List<Color> _linearWhite = [Colors.white,offWhite, blue2];

Gradient linearWhiteGradient = LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter,stops: linearWhiteStops,colors: _linearWhite);

const Color _white =  Color(0xFFFFFFFF);
const Color _offWhite = Color(0xFFF3F6FF);

const Color _mainBlue = Color(0xFF2C4FA0);
const Color _blue2 = Color(0xFF96A7D0);
const Color _linearBlue1 = Color(0xFF244BA9);
const Color _darkBlue = Color(0xFF162850);
const Color _darkBlue2 = Color(0xFF091020);

const Color _offBlack = Color(0xFF1E1E1E);
const Color _blackerBlack = Color(0xFF000000);
const Color _warningRed = Color(0xFFD6240C);


Color get white => _white;
Color get offWhite => _offWhite;

Color get mainBlue => _mainBlue;
Color get blue2 => _blue2;
Color get linearBlue1 => _linearBlue1;
Color get darkBlue => _darkBlue;
Color get darkBlue2 => _darkBlue2;

Color get offBlack => _offBlack;
Color get blackerBlack => _blackerBlack;
Color get warningRed => _warningRed;

final TextStyle _style1 = TextStyle(
    fontSize: 16, fontWeight: FontWeight.w600, color: mainBlue);

final TextStyle _style2 = TextStyle(
    fontSize: 16, fontWeight: FontWeight.w600, color: blue2);

final TextStyle _style3 = TextStyle(fontSize: 16,
    fontWeight: FontWeight.w700,
    color: darkBlue2);

final TextStyle _style4 = TextStyle(fontSize: 16,
    fontWeight: FontWeight.w700,
    color: mainBlue);

const TextStyle _style5 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 24);

final TextStyle _style6 = TextStyle(color: mainBlue,
    fontWeight: FontWeight.w600,
    fontSize: 24);

TextStyle get style1 => _style1;
TextStyle get style2 => _style2;
TextStyle get style3 => _style3;
TextStyle get style4 => _style4;
TextStyle get style5 => _style5;
TextStyle get style6 => _style6;





int get  fontSize => 16;
String get fontFamily => 'Montserrat';







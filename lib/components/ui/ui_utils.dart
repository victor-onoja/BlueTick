import 'package:flutter/material.dart';
import 'package:bluetick/components/config/config_sheet.dart';
import 'package:passwordfield/passwordfield.dart';

InputBorder formOutlineBorder({Color? color}) {
  if (color == null) {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)));
  }
  return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(color: color));
}

InputBorder createScreenBorder() {
  return OutlineInputBorder(
      borderSide: BorderSide(color: blue2),
      borderRadius: const BorderRadius.all(Radius.circular(3.99)));
}

PasswordBorder passwordBorder() {
  return PasswordBorder(
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(color: mainBlue),
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: mainBlue)),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(
            style: BorderStyle.solid, width: 2, color: Colors.red.shade200),
      ));
}

Widget generalBottomNavigationBar() {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    iconSize: 31.62,
    unselectedFontSize: 11.98,
    unselectedItemColor: offWhite,
    selectedItemColor: offWhite,
    showUnselectedLabels: true,
    showSelectedLabels: true,
    backgroundColor: mainBlue,
    items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          label: 'Home',
          icon: IconButton(
              color: offWhite,
              onPressed: () => null,
              icon: const ImageIcon(AssetImage('assets/icons/home.png')))),
      BottomNavigationBarItem(
          label: 'Notification',
          icon: IconButton(
            color: offWhite,
            onPressed: () => null,
            icon: const ImageIcon(AssetImage('assets/icons/notification.png')),
          )),
      BottomNavigationBarItem(
          label: 'Broadcast',
          icon: IconButton(
            color: offWhite,
            onPressed: () => null,
            icon: const ImageIcon(AssetImage('assets/icons/broadcast.png')),
          )),
      BottomNavigationBarItem(
          label: 'Messages',
          icon: IconButton(
            color: offWhite,
            onPressed: () => null,
            icon: const ImageIcon(AssetImage('assets/icons/messages.png')),
          ))
    ],
  );
}

Widget homeBottomNavigationBar() {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    iconSize: 31.62,
    unselectedFontSize: 11.98,
    unselectedItemColor: offWhite,
    selectedItemColor: offWhite,
    showUnselectedLabels: true,
    showSelectedLabels: true,
    backgroundColor: mainBlue,
    items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          label: 'Home',
          icon: IconButton(
              color: offWhite,
              onPressed: () => null,
              icon: const ImageIcon(AssetImage('Assets/icons/home.png')))),
      BottomNavigationBarItem(
          label: 'Notification',
          icon: IconButton(
            color: offWhite,
            onPressed: () => null,
            icon: const ImageIcon(AssetImage('Assets/icons/notification.png')),
          )),
      BottomNavigationBarItem(
          label: 'Co-Workers',
          icon: IconButton(
            color: offWhite,
            onPressed: () => null,
            icon: const ImageIcon(
                AssetImage('Assets/icons/clarity_group-line.png')),
          )),
      BottomNavigationBarItem(
          label: 'Messages',
          icon: IconButton(
            color: offWhite,
            onPressed: () => null,
            icon: const ImageIcon(AssetImage('Assets/icons/messages.png')),
          ))
    ],
  );
}

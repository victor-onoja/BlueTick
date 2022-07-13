import 'package:flutter/material.dart';

import '../config/config_sheet.dart';

class GeneralAppBar extends StatelessWidget {
  const GeneralAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.0, 68.11],
                colors: [linearBlue1, darkBlue])),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: const ImageIcon(AssetImage('Assets/images/Group 7.png')),
        onPressed: () => null,
      ),
      title: const Text(
        'BlueTick',
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 23.96),
      ),
      actions: [
        GestureDetector(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.asset(
              'Assets/images/Ellipse 20.png',
              fit: BoxFit.contain,
            ),
          ),
          //     const CircleAvatar(
          //   backgroundImage: AssetImage(''),
          // ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:bluetick/util/app_theme.dart';

class groupChatscreen extends StatefulWidget {
  const groupChatscreen({Key? key}) : super(key: key);

  @override
  State<groupChatscreen> createState() => _groupChatscreenState();
}

class _groupChatscreenState extends State<groupChatscreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.darkBlue,
      ),
    );
  }
}

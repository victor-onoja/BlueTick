import 'package:bluetick/components/app_theme.dart';
import 'package:flutter/material.dart';

class callScreen extends StatelessWidget {
  const callScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.darkBlue,
        appBar: AppBar(
          backgroundColor: AppTheme.offWhite,
          title: Row(
            children: [
              Icon(Icons.arrow_back),
              SizedBox(width: 40,),
              Text("John Mac"),
            ],
          ),
        ),
      ),
    );
  }
}

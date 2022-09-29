import 'package:flutter/material.dart';

import '../config/config_sheet.dart';

class AppCircularIndicator extends StatelessWidget {
  const AppCircularIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: mainBlue,
          valueColor:
              AlwaysStoppedAnimation(mainBlue.withOpacity(0.8)),
          backgroundColor: Colors.transparent,
        ),
      );
  }
}
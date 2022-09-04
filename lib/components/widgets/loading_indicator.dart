import 'package:bluetick/components/config/config_sheet.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(mainBlue.withOpacity(0.5)),
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}

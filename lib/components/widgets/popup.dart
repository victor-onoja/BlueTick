import 'package:bluetick/components/config/config_sheet.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:google_fonts/google_fonts.dart';

class popUp extends StatelessWidget {
  const popUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          // margin: const EdgeInsets.only(top: 50, bottom: 20),
          height: 275.92,
          width: 341,
          // padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 79),
          decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                    inset: true,
                    color: darkBlue,
                    blurRadius: 8,
                    offset: const Offset(8, 8)),
                BoxShadow(
                    inset: true,
                    color: darkBlue,
                    blurRadius: 8,
                    offset: const Offset(-8, -8))
              ],
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              border: Border.all(
                  color: darkBlue, width: 3, style: BorderStyle.solid),
              gradient: RadialGradient(
                  colors: [offWhite, blue2], stops: const [0.0, 84.21])),
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.cancel_outlined,
                      color: darkBlue,
                    )),
              ),
              Align(
                  alignment: AlignmentDirectional.center,
                  child: Image.asset('Assets/popup.png'))
            ],
          ),
        ),
      ])),
    );
  }
}

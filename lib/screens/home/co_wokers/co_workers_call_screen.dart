import 'package:bluetick/components/config/config_sheet.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import '../../../components/app_theme.dart';
import 'co_worker_add_to_call.dart';

class CoWorkersCallScreen extends StatefulWidget {
  const CoWorkersCallScreen({Key? key}) : super(key: key);

  @override
  State<CoWorkersCallScreen> createState() => _CoWorkersCallScreenState();
}

class _CoWorkersCallScreenState extends State<CoWorkersCallScreen> {
  bool muted = true;
  bool endCall = true;
  bool rec = true;
  bool speaker = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.darkBlue,
        appBar: AppBar(
          //systemOverlayStyle: SystemUiOverlayStyle(systemStatusBarContrastEnforced: true, statusBarColor: Colors.white),
          elevation: 0,
          toolbarOpacity: 1,
          toolbarHeight: 49,
          backgroundColor: AppTheme.offWhite,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back,
                color: AppTheme.blackerBlack,
              )),
          centerTitle: true,
          title: Text(
            'John Mac',
            style: GoogleFonts.montserrat(
              textStyle: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.blackerBlack),
            ),
          ),

          actions: [
            //IconButton(onPressed: () => null, icon: const Icon(Icons.check))
            GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => CoWorkerAddToCall())),
                child: Image.asset("Assets/icons/add to call.png"))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: AlignmentDirectional.center,
                height: 24,
                //margin: const EdgeInsets.only(right:0.0, left: 0.0 ),
                decoration: BoxDecoration(color: AppTheme.blue2),
                child: Text(
                  "Ringing",
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600)),
                ),
              ),
              FittedBox(
                child: Image.asset('Assets/icons/john mark.png'),
                fit: BoxFit.contain,
              ),
              //Image.asset("assets/images/Image.png"),
              SizedBox(
                height: 13,
              ),
              Divider(
                thickness: 2,
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          muted = !muted;
                        });
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: muted ? mainBlue : Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          gradient: LinearGradient(
                            colors: muted
                                ? [
                                    Color(0xff5F8CF2),
                                    Color(0xff162850),
                                  ]
                                : [
                                    Color(0xff96A7D0),
                                    Color(0xffFBFBFB),
                                    Colors.white,
                                  ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          border: Border.all(
                              color: muted
                                  ? Color(0xff5F8CF2)
                                  : Color(0xffFBFBFB)
                                      .withOpacity(0.5), //Color(0xff96A7D0),
                              width: 3),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(149, 177, 244, 0.25),
                              blurRadius: 4,
                              offset: const Offset(-4, -8),
                              // blurStyle: BlurStyle.inner,
                              inset: true,
                            ),
                            BoxShadow(
                              color: Color.fromRGBO(44, 79, 160, 0.45),
                              blurRadius: 4,
                              offset: const Offset(4, 8),
                              inset: true,
                            ),
                          ],
                        ),
                        child: Image.asset(
                          muted
                              ? 'Assets/icons/muted.png'
                              : 'Assets/icons/min.png', //'Assets/icons/unmute voice.png',
                          color: muted ? Colors.white : mainBlue,
                        ),
                        //  color: imageColor,
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        setState(() {
                          endCall = !endCall;
                        });
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: endCall ? Colors.white : mainBlue,
                            borderRadius: BorderRadius.circular(100),
                            gradient: LinearGradient(
                              colors: endCall
                                  ? [
                                      Colors.white,
                                      Colors.white,
                                    ]
                                  : [
                                      Color(0xff5F8CF2),
                                      Color(0xff162850),
                                    ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: endCall
                                    ? Color(0xffF28F8F)
                                    : Color(0xff5F8CF2), // Color(0xff5F8CF2),
                                blurRadius: 4,
                                offset: const Offset(-4, -8),
                                blurStyle: BlurStyle.solid,
                                inset: true,
                              ),
                            ],
                            border: Border.all(
                              color: endCall
                                  ? Color(0xffD6240C)
                                  : Color(0xff5F8CF2),
                              width: 3,
                            )),
                        child: Image.asset(
                          'Assets/icons/end call.png',
                          color:
                              endCall ? Color(0xffD6240C) : Color(0xff5F8CF2),
                        ),
                        //  color: imageColor,
                      ),
                    ),

                    // Image.asset("assets/images/Component 3.png"),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          rec = !rec;
                        });
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: rec ? mainBlue : Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          gradient: LinearGradient(
                            colors: rec
                                ? [
                                    Color(0xff5F8CF2),
                                    Color(0xff162850),
                                  ]
                                : [
                                    Color(0xff96A7D0),
                                    Color(0xffFBFBFB),
                                    Colors.white,
                                  ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          border: Border.all(
                              color: rec
                                  ? Color(0xff5F8CF2)
                                  : Color(0xffFBFBFB).withOpacity(0.5),
                              width: 3),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(149, 177, 244, 0.25),
                              blurRadius: 4,
                              offset: const Offset(-4, -8),
                              // blurStyle: BlurStyle.inner,
                              inset: true,
                            ),
                            BoxShadow(
                              color: Color.fromRGBO(44, 79, 160, 0.45),
                              blurRadius: 4,
                              offset: const Offset(4, 8),
                              // blurStyle: BlurStyle.inner,
                              inset: true,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'REC',
                            style: GoogleFonts.montserrat(
                              fontSize: 19,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                              letterSpacing: 0.7,
                              color: rec ? Color(0xffD6240C) : mainBlue,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        //  color: imageColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          speaker = !speaker;
                        });
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: speaker ? mainBlue : Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          gradient: LinearGradient(
                            colors: speaker
                                ? [
                                    Color(0xff5F8CF2),
                                    Color(0xff162850),
                                  ]
                                : [
                                    Color(0xff96A7D0),
                                    Color(0xffFBFBFB),
                                    Colors.white,
                                  ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          border: Border.all(
                              color: speaker
                                  ? Color(0xff5F8CF2)
                                  : Color(0xffFBFBFB).withOpacity(0.5),
                              width: 3),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(149, 177, 244, 0.25),
                              blurRadius: 4,
                              offset: const Offset(-4, -8),
                              // blurStyle: BlurStyle.inner,
                              inset: true,
                            ),
                            BoxShadow(
                              color: Color.fromRGBO(44, 79, 160, 0.45),
                              blurRadius: 4,
                              offset: const Offset(4, 8),
                              // blurStyle: BlurStyle.inner,
                              inset: true,
                            ),
                          ],
                        ),
                        child: Image.asset(
                          'Assets/icons/speaker.png',
                          color: speaker ? Colors.white : mainBlue,
                        ),
                        //  color: imageColor,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 2,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container CallButton({
    required String imagePath,
    required Color imageColor,
  }) {
    return Container(
      height: 80,
      width: 80,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: mainBlue,
        borderRadius: BorderRadius.circular(100),
        gradient: LinearGradient(
          colors: [
            Color(0xff5F8CF2),
            Color(0xff162850),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        // image: DecorationImage(
        //   image: AssetImage('',
        //
        //   )
        // ),
        boxShadow: [
          BoxShadow(
            color: Color(0xff5F8CF2),
            blurRadius: 3,
            blurStyle: BlurStyle.inner,
            inset: true,
          ),
        ],
      ),
      child: Image.asset(imagePath),
      //  color: imageColor,
    );
  }
}

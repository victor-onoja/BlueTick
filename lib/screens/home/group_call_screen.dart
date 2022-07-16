import 'package:bluetick/screens/home/todo_scree.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import '../../components/app_theme.dart';
import '../../components/config/config_sheet.dart';
import 'co_wokers/co_worker_add_to_call.dart';

class GroupCallScreen extends StatefulWidget {
  const GroupCallScreen({Key? key}) : super(key: key);

  @override
  State<GroupCallScreen> createState() => _GroupCallScreenState();
}

class _GroupCallScreenState extends State<GroupCallScreen> {
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
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppTheme.offWhite,
            systemNavigationBarColor: AppTheme.offWhite,
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.0, 68.11],
                    colors: [linearBlue1, darkBlue])),
          ),
          centerTitle: true,
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Design group 2',
            style: GoogleFonts.montserrat(
                fontSize: 23.96, fontWeight: FontWeight.w500),
          ),
          actions: [
            GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TodoScreen())),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  "Assets/icons/add to call.png",
                  color: AppTheme.white,
                ),
              ),
            )
          ],
        ),
        //GeneralAppBar(),
        body: Stack(
          fit: StackFit.expand,
          //alignment: Alignment.center,
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(),
              child: Image.asset(
                'Assets/images/chatbg_blue 2.png',
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                alignment: AlignmentDirectional.center,
                height: 24,
                //margin: const EdgeInsets.only(right:0.0, left: 0.0 ),
                decoration: BoxDecoration(color: AppTheme.blue2),
                child: Text(
                  "10.23",
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500)),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ProfilePic(
                        imagePath: 'Assets/images/profilePic.png',
                        profileName: 'John Mac'),
                    ProfilePic(
                        imagePath: 'Assets/images/profilePic1.png',
                        profileName: 'Bethie drey'),
                    ProfilePic(
                        imagePath: 'Assets/images/profilePic2.png',
                        profileName: 'Vera McBerth'),
                  ],
                ),
                ProfilePic(
                    imagePath: 'Assets/images/profilePic3.png',
                    profileName: 'Tim So'),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                    color: AppTheme.darkBlue, // linearBlue2,
                    border: Border.all(
                      color: blue2,
                      width: 2,
                      style: BorderStyle.solid,
                    )),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                muted = !muted;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: muted
                                      ? Alignment.topCenter
                                      : Alignment.topLeft,
                                  end: muted
                                      ? Alignment.bottomCenter
                                      : Alignment.bottomRight,
                                  stops: [0.35, 0.85],
                                  colors: muted
                                      ? [
                                          Color(0xff5F8CF2),
                                          Color(0xff162850),
                                        ]
                                      : [
                                          Color(0xff96A7D0),
                                          Color(0xffFBFBFB),
                                        ],
                                ),
                                shape: BoxShape.circle,
                              ),
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
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          Color.fromRGBO(149, 177, 244, 0.25),
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
                          ),

                          GestureDetector(
                            onTap: () {
                              setState(() {
                                endCall = !endCall;
                              });
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: endCall
                                      ? Alignment.topCenter
                                      : Alignment.topLeft,
                                  end: endCall
                                      ? Alignment.bottomCenter
                                      : Alignment.bottomRight,
                                  stops: [0.35, 0.85],
                                  colors: endCall
                                      ? [
                                          Color(0xffD6240C),
                                          Color(0xffD6240C)
                                          // Color(0xff5F8CF2),
                                          // Color(0xff162850),
                                        ]
                                      : [
                                          // Color(0xff5F8CF2),
                                          // Color(0xff162850),
                                          Color(0xff96A7D0),
                                          Color(0xffFBFBFB),
                                        ],
                                ),
                                shape: BoxShape.circle,
                              ),
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
                                            : Color(
                                                0xff5F8CF2), // Color(0xff5F8CF2),
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
                                  color: endCall
                                      ? Color(0xffD6240C)
                                      : Color(0xff5F8CF2),
                                ),
                                //  color: imageColor,
                              ),
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
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: rec
                                      ? Alignment.topCenter
                                      : Alignment.topLeft,
                                  end: rec
                                      ? Alignment.bottomCenter
                                      : Alignment.bottomRight,
                                  stops: [0.35, 0.85],
                                  colors: rec
                                      ? [
                                          Color(0xff5F8CF2),
                                          Color(0xff162850),
                                        ]
                                      : [
                                          Color(0xff96A7D0),
                                          Color(0xffFBFBFB),
                                        ],
                                ),
                                shape: BoxShape.circle,
                              ),
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
                                  border: rec
                                      ? Border.lerp(
                                          Border.all(
                                              color: Color(0xff5F8CF2)
                                                  .withOpacity(0.3),
                                              width: 3),
                                          Border.all(
                                            color: Color(0xff162850)
                                                .withOpacity(0.7),
                                            width: 3,
                                          ),
                                          -0.7)
                                      : Border.lerp(
                                          Border.all(
                                              color: Color(0xff96A7D0)
                                                  .withOpacity(.23),
                                              width: 3),
                                          Border.all(
                                            color: Color(0xffFBFBFB)
                                                .withOpacity(0.77),
                                            width: 3,
                                          ),
                                          -0.7),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          Color.fromRGBO(149, 177, 244, 0.25),
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
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                speaker = !speaker;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: speaker
                                      ? Alignment.topCenter
                                      : Alignment.topLeft,
                                  end: speaker
                                      ? Alignment.bottomCenter
                                      : Alignment.bottomRight,
                                  stops: [0.35, 0.85],
                                  colors: speaker
                                      ? [
                                          Color(0xff5F8CF2),
                                          Color(0xff162850),
                                        ]
                                      : [
                                          Color(0xff96A7D0),
                                          Color(0xffFBFBFB),
                                        ],
                                ),
                                shape: BoxShape.circle,
                              ),
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
                                  border: speaker
                                      ? Border.lerp(
                                          Border.all(
                                              color: Color(0xff5F8CF2)
                                                  .withOpacity(0.3),
                                              width: 3),
                                          Border.all(
                                            color: Color(0xff162850)
                                                .withOpacity(0.7),
                                            width: 3,
                                          ),
                                          -0.7)
                                      : Border.lerp(
                                          Border.all(
                                              color: Color(0xff96A7D0)
                                                  .withOpacity(.23),
                                              width: 3),
                                          Border.all(
                                            color: Color(0xffFBFBFB)
                                                .withOpacity(0.77),
                                            width: 3,
                                          ),
                                          -0.7),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          Color.fromRGBO(149, 177, 244, 0.25),
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
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column ProfilePic({required String imagePath, required String profileName}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imagePath),
        Text(
          profileName,
          style:
              GoogleFonts.montserrat(fontSize: 12, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

import 'package:bluetick/screens/home/sub_home/co_worker_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../components/app_theme.dart';
import '../home/home_tabs.dart';
import 'groupchatTwo.dart';

class groupChatscreen extends StatefulWidget {
  const groupChatscreen({Key? key}) : super(key: key);

  @override
  State<groupChatscreen> createState() => _groupChatscreenState();
}

class _groupChatscreenState extends State<groupChatscreen> {
  @override
  Widget build(BuildContext context) {
    const gcdp = 'Assets/groupchatdp.png';
    const msg1 = 'Assets/message1.png';
    const msg2 = 'Assets/message2.png';
    const msg3 = 'Assets/message3.png';
    const msg4 = 'Assets/message4.png';
    const msg5 = 'Assets/message5.png';
    const gcbg = 'Assets/groupchatbg.png';

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: AppTheme.offBlack),
            backgroundColor: AppTheme.offWhite,
            elevation: 0.0,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
            ),
            title: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => GroupChat()));
                  },
                  child: const Image(
                    image: AssetImage(gcdp),
                    height: kToolbarHeight,
                    width: 48,
                  ),
                ),
                SizedBox(
                  width: 40, //65,
                ),
                Text(
                  'Design Group 2',
                  style: GoogleFonts.montserrat(color: AppTheme.offBlack),
                ),
              ],
            ),
            centerTitle: false,
            actions: [
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.call,
                      color: AppTheme.offBlack,
                    ),
                  )),
            ],
            leading: BackButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const HomeTab()));
              },
            ),
          ),
          body: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill, image: AssetImage(gcbg))),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 33.0,
                    ),
                    child: Column(children: <Widget>[
                      Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Container(
                          child: const Image(image: AssetImage(msg1)),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Container(
                          child: Image(image: AssetImage(msg2)),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Align(
                          alignment: AlignmentDirectional.topEnd,
                          child: Container(
                            child: Image(image: AssetImage(msg3)),
                          )),
                      SizedBox(
                        height: 8,
                      ),
                      Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Container(
                            child: Image(image: AssetImage(msg4)),
                          )),
                      SizedBox(
                        height: 8,
                      ),
                      Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Container(
                            child: Image(image: AssetImage(msg5)),
                          )),
                    ])),
              ),
              Container(
                width: double.infinity,
                height: 20,
                color: AppTheme.blue2,
                child: Center(
                  child: Text(
                    'Vera McBerth, John Mac is typing',
                    style: GoogleFonts.montserrat(
                        color: AppTheme.offBlack, fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, 1.0),
                child: Container(
                    width: double.infinity,
                    height: 32.0,
                    color: AppTheme.offWhite,
                    child: Row(
                      children: <Widget>[
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.attach_file,
                              color: AppTheme.offBlack,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.emoji_emotions_outlined,
                              color: AppTheme.offBlack,
                            )),
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                              color: AppTheme.mainBlue,
                              borderRadius: BorderRadius.circular(5.0)),
                          height: 28,
                          child: TextField(
                            style: const TextStyle(color: AppTheme.offWhite),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                hintText: 'send message',
                                hintStyle: GoogleFonts.montserrat(
                                  color: AppTheme.offWhite,
                                )),
                          ),
                        )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.mic_none,
                              color: AppTheme.offBlack,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.send_outlined,
                              color: AppTheme.offBlack,
                            )),
                      ],
                    )),
              )
            ],
          )),
    );
  }
}

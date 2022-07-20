import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../components/app_theme.dart';
import '../home/co_wokers/co_workers_call_screen.dart';
import '../home/home_tabs.dart';

class Chatscreen extends StatefulWidget {
  const Chatscreen({Key? key}) : super(key: key);

  @override
  State<Chatscreen> createState() => _ChatscreenState();
}

class _ChatscreenState extends State<Chatscreen> {
  @override
  Widget build(BuildContext context) {
    const cdp = 'Assets/chatdp.png';
    const c1 = 'Assets/chat1.png';

    const c3 = 'Assets/chat3.png';
    const c4 = 'Assets/chat4.png';
    const vn = 'Assets/vn.png';
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
            leading: BackButton(
              onPressed: () => Navigator.pop(context),
            ),
            title: Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const Image(
                    image: AssetImage(cdp),
                    height: kToolbarHeight,
                    width: 48,
                  ),
                ),
                SizedBox(
                  width: 40, //65,
                ),
                Text(
                  'John Mac',
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
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => CoWorkersCallScreen()));
                    },
                    icon: Icon(
                      Icons.call,
                      color: AppTheme.offBlack,
                    ),
                  )),
            ],
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
                          child: const Image(image: AssetImage(c1)),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Container(
                          child: Image(image: AssetImage(c1)),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Align(
                          alignment: AlignmentDirectional.topEnd,
                          child: Container(
                            child: Image(image: AssetImage(c3)),
                          )),
                      SizedBox(
                        height: 8,
                      ),
                      Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Container(
                            child: Image(image: AssetImage(c4)),
                          )),
                      SizedBox(
                        height: 8,
                      ),
                      Align(
                          alignment: AlignmentDirectional.topEnd,
                          child: Container(
                            child: Image(image: AssetImage(vn)),
                          )),
                    ])),
              ),
              Container(
                width: double.infinity,
                height: 20,
                color: AppTheme.blue2,
                child: Center(
                  child: Text(
                    'Product Manager',
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

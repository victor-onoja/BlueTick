import 'package:flutter/material.dart';
import 'package:bluetick/util/app_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class groupChatscreen extends StatefulWidget {
  const groupChatscreen({Key? key}) : super(key: key);

  @override
  State<groupChatscreen> createState() => _groupChatscreenState();
}

class _groupChatscreenState extends State<groupChatscreen> {
  @override
  Widget build(BuildContext context) {
    const gcdp = 'assets/groupchatdp.png';

    return SafeArea(
      child: Scaffold(
          backgroundColor: AppTheme.darkBlue,
          appBar: AppBar(
              backgroundColor: AppTheme.offWhite,
              elevation: 0.0,
              title: Text(
                'Design Group 2',
                style: GoogleFonts.montserrat(color: AppTheme.offBlack),
              ),
              centerTitle: true,
              actions: const [
                Icon(
                  Icons.call,
                  color: AppTheme.offBlack,
                )
              ],
              leading: Image(image: AssetImage(gcdp))),
          body: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 13.0,
                  ),
                  child: Column(
                    children: <Widget>[],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 20,
                color: AppTheme.blue2,
                child: Center(
                  child: Text(
                    'Vera McBerth, John Mac is typing',
                    style: GoogleFonts.montserrat(color: AppTheme.offBlack),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, 0.98),
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
                                contentPadding:
                                    EdgeInsets.only(left: 15, bottom: 17),
                                hintText: 'send message',
                                hintStyle: GoogleFonts.montserrat(
                                    color: AppTheme.offWhite)),
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

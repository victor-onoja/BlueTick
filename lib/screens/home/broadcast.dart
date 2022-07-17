import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/app_theme.dart';

class BroadcastScreen extends StatefulWidget {
  const BroadcastScreen({Key? key}) : super(key: key);

  @override
  State<BroadcastScreen> createState() => _BroadcastScreenState();
}

class _BroadcastScreenState extends State<BroadcastScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("Assets/groupchatbg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            iconTheme: IconThemeData(color: AppTheme.offBlack),
            backgroundColor: AppTheme.offWhite,
            elevation: 0.0,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {},
            ),
            automaticallyImplyLeading: false,
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.call))],
            title: Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const Image(
                    image: AssetImage('Assets/brdcsticn.png'),
                    // height: kToolbarHeight,
                    // width: 48,
                  ),
                ),
                SizedBox(
                  width: 40, //65,
                ),
                Text(
                  'Send Broadcast',
                  style: GoogleFonts.montserrat(
                      color: AppTheme.offBlack, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            centerTitle: false,
          ),
          body: Column(
            children: [
              Container(
                width: double.infinity,
                height: 20,
                color: AppTheme.blue2,
                child: Center(
                  child: Text(
                    'Zicco, Yungzel, Omoye, Lade, Muiz, Tomi, Olla, Subomi,.... ',
                    style: GoogleFonts.montserrat(
                        color: AppTheme.offBlack, fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              Expanded(child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                return Container();
              })),
              Container(
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
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppTheme.mainBlue,
                            borderRadius: BorderRadius.circular(5.0)),
                        // height: 28,
                        child: TextField(
                          textCapitalization: TextCapitalization.sentences,
                          style: const TextStyle(color: AppTheme.offWhite),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.only(right: 7, top: 4, bottom: 4),
                              hintText: 'send message',
                              hintStyle: GoogleFonts.montserrat(
                                color: AppTheme.offWhite,
                              )),
                        ),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

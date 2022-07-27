import 'package:bluetick/components/models/groupchatMessage_models.dart';
import 'package:bluetick/screens/home/co_wokers/co_worker_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../components/app_theme.dart';
import '../home/group_call_screen.dart';
import '../home/home_tabs.dart';
import 'groupchatTwo.dart';

class GroupChatScreen extends StatefulWidget {
  const GroupChatScreen({Key? key}) : super(key: key);

  @override
  State<GroupChatScreen> createState() => _GroupChatScreenState();
}

class _GroupChatScreenState extends State<GroupChatScreen> {
  @override
  Widget build(BuildContext context) {
    const gcdp = 'Assets/groupchatdp.png';

    const gcbg = 'Assets/groupchatbg.png';

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(gcbg), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
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
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            centerTitle: false,
            actions: [
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (_) => GroupCallScreen(),
                        ),
                        (route) => true,
                      );
                    },
                    icon: Icon(
                      Icons.call,
                      color: AppTheme.offBlack,
                    ),
                  )),
            ],
          ),
          body: Column(
            children: [
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
              Expanded(
                  child: GroupedListView<GCMessage, DateTime>(
                elements: gcmsg,
                groupBy: (gcmsg) => DateTime(2022),
                padding: EdgeInsets.all(16),
                groupHeaderBuilder: (GCMessage gcmsg) => SizedBox(),
                itemBuilder: (context, GCMessage gcmsg) => Align(
                  alignment: gcmsg.isSentByMe
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Padding(
                    padding: gcmsg.isSentByMe
                        ? const EdgeInsets.only(bottom: 8.0, left: 140)
                        : const EdgeInsets.only(bottom: 8.0, right: 90),
                    child: gcmsg.messageTypeAudio
                        ? Container(
                            decoration: BoxDecoration(
                                color: gcmsg.isSentByMe
                                    ? AppTheme.blue2
                                    : AppTheme.offWhite,
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                                padding: EdgeInsets.all(8),
                                child: gcmsg.isSentByMe
                                    ? Row(
                                        children: [
                                          IconButton(
                                              onPressed: () {},
                                              icon:
                                                  Icon(Icons.play_arrow_sharp)),
                                          Spacer(),
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.delete))
                                        ],
                                      )
                                    : Stack(children: [
                                        Container(
                                            padding: EdgeInsets.only(
                                                left: 60, top: 20),
                                            child: Row(
                                              children: [
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(Icons
                                                        .play_arrow_sharp)),
                                                Spacer(),
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(Icons.delete))
                                              ],
                                            )),
                                        Container(
                                          padding: EdgeInsets.only(
                                            left: 60,
                                          ),
                                          child: Text(
                                            gcmsg.senderName,
                                            style: GoogleFonts.montserrat(
                                                color: AppTheme.mainBlue,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                        Container(
                                          height: 32.0,
                                          width: 32.0,
                                          color: Colors.transparent,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        gcmsg.senderDp)),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(4.0))),
                                          ),
                                        )
                                      ])))
                        : Container(
                            decoration: BoxDecoration(
                                color: gcmsg.isSentByMe
                                    ? AppTheme.blue2
                                    : AppTheme.offWhite,
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: gcmsg.media != null
                                  ? gcmsg.isSentByMe
                                      ? Column(
                                          children: [
                                            Text(gcmsg.text!),
                                            Image.asset(gcmsg.media!)
                                          ],
                                        )
                                      : Stack(children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: 60, top: 20),
                                            child: Column(
                                              children: [
                                                Text(gcmsg.text!),
                                                Image.asset(gcmsg.media!)
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                              left: 60,
                                            ),
                                            child: Text(
                                              gcmsg.senderName,
                                              style: GoogleFonts.montserrat(
                                                  color: AppTheme.mainBlue,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                          Container(
                                            height: 32.0,
                                            width: 32.0,
                                            color: Colors.transparent,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          gcmsg.senderDp)),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              4.0))),
                                            ),
                                          )
                                        ])
                                  : gcmsg.isSentByMe
                                      ? Column(
                                          children: [Text(gcmsg.text!)],
                                        )
                                      : Stack(children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: 60, top: 20),
                                            child: Text(gcmsg.text!),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                              left: 60,
                                            ),
                                            child: Text(
                                              gcmsg.senderName,
                                              style: GoogleFonts.montserrat(
                                                  color: AppTheme.mainBlue,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                          Container(
                                            height: 32.0,
                                            width: 32.0,
                                            color: Colors.transparent,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          gcmsg.senderDp)),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              4.0))),
                                            ),
                                          )
                                        ]),
                            )),
                  ),
                ),
              )),
              Container(
                width: double.infinity,
                height: 32,
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
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Container(
                          decoration: BoxDecoration(
                              color: AppTheme.mainBlue,
                              borderRadius: BorderRadius.circular(5.0)),
                          child: TextField(
                            textCapitalization: TextCapitalization.sentences,
                            style: const TextStyle(color: AppTheme.offWhite),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.only(left: 8, bottom: 10.5),
                              hintText: 'send message',
                              hintStyle: GoogleFonts.montserrat(
                                color: AppTheme.offWhite,
                              ),
                            ),
                          )),
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
                        ))
                  ],
                ),
              )
            ],
          ),
          // ),
        ),
      ),
    );
  }
}

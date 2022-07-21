import 'package:bluetick/components/models/broadcastMessage_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../components/app_theme.dart';

class AdminBroadcastScreen extends StatefulWidget {
  const AdminBroadcastScreen({Key? key}) : super(key: key);

  @override
  State<AdminBroadcastScreen> createState() => _AdminBroadcastScreenState();
}

class _AdminBroadcastScreenState extends State<AdminBroadcastScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('Assets/groupchatbg.png'),
                  fit: BoxFit.cover)),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              iconTheme: IconThemeData(color: AppTheme.offBlack),
              backgroundColor: AppTheme.offWhite,
              elevation: 0.0,
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
              ),
              leading:
                  IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
              automaticallyImplyLeading: false,
              actions: [IconButton(onPressed: () {}, icon: Icon(Icons.call))],
              title: Row(
                children: [
                  Image(image: AssetImage('Assets/brdcsticn.png')),
                  SizedBox(
                    width: 40,
                  ),
                  Text('Send Broadcast',
                      style: GoogleFonts.montserrat(
                          color: AppTheme.offBlack,
                          fontWeight: FontWeight.w500)),
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
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.5, vertical: 2),
                        child: Text(
                          'Zicco, Yungzel, Omoye, Lade, Muiz, Tomi, Olla, Subomi, ...',
                          style: GoogleFonts.montserrat(
                              color: AppTheme.offBlack,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    )),
                Expanded(
                  child: GroupedListView<BCMessage, DateTime>(
                    elements: broadcastmsg,
                    groupBy: (broadcastmsg) => DateTime(2022),
                    padding: EdgeInsets.all(16),
                    groupHeaderBuilder: (BCMessage broadcastmsg) => Container(),
                    itemBuilder: (context, BCMessage broadcastmsg) => Padding(
                        padding: const EdgeInsets.only(bottom: 8, left: 140),
                        child: broadcastmsg.messageTypeAudio
                            ? Container(
                                decoration: BoxDecoration(
                                    color: AppTheme.blue2,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.play_arrow_sharp)),
                                      Spacer(),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.delete))
                                    ],
                                  ),
                                ),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                    color: AppTheme.blue2,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: broadcastmsg.media != null
                                      ? Column(
                                          children: [
                                            Text(broadcastmsg.text),
                                            Image.asset(broadcastmsg.media!)
                                          ],
                                        )
                                      : Column(
                                          children: [Text(broadcastmsg.text)],
                                        ),
                                ),
                              )),
                  ),
                ),
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
          )),
    );
  }
}

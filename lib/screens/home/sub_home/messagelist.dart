import 'package:bluetick/components/app_theme.dart';
import 'package:bluetick/components/constants/app_router/app_router.dart';
import 'package:bluetick/screens/groupchat/groupchatTwo.dart';
import 'package:bluetick/screens/home/home.dart';
import 'package:bluetick/screens/home/homeE.dart';
import 'package:bluetick/screens/home/home_tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../components/config/config_sheet.dart';
import '../../../components/models/broadcast_models.dart';

import '../../chatScreen/chatScreen.dart';

class MessageList extends StatefulWidget {
  const MessageList({Key? key}) : super(key: key);

  @override
  MessageListState createState() => MessageListState();
}

class MessageListState extends State<MessageList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue2,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: mainBlue,
        foregroundColor: offWhite,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => const HomeTab())),
            icon: const Icon(Icons.arrow_back)),
        title: Text(
          'Messages',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: offWhite,
            fontWeight: FontWeight.w500,
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 50),
        child: SizedBox(
          height: 550,
          child: ListView.builder(
              itemCount: messageListItem.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  height: 67,
                  decoration: BoxDecoration(color: mainBlue),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        //  AppRouter.coWorkersAddToCall,
                        MaterialPageRoute(
                          builder: (_) => const Chatscreen(),
                        ),
                        //    AppRouter.chatScreen,
                      );
                      // Navigator.push(
                      // context,

                      /// AppRouter.todoScreen,
                      //  (route) => true,
                      //);
                    },
                    child: ListTile(
                      // onTap: () {
                      //   Navigator.pushNamed(
                      //     context,
                      //     AppRouter.todoScreen,
                      //     //  (route) => true,
                      //   );
                      // },
                      horizontalTitleGap: 30,
                      leading: CircleAvatar(
                          backgroundImage: AssetImage(
                        messageListItem['id$index']['profile_pic'],
                      )),
                      title: Text(
                        messageListItem['id$index']['name'],
                        style: TextStyle(
                            color: offWhite,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        messageListItem['id$index']['message'],
                        style: TextStyle(
                            color: offWhite,
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      ),
                      trailing: Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 4,
                        children: [
                          Text(
                            adminStatus(messageListItem, index),
                            style: TextStyle(
                                color: offWhite,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                          messageListItem['id$index']['isCheck']
                              ? Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: offWhite,
                                  ),
                                  child: Center(
                                    child: Text(
                                      messageListItem['id$index']['alert']
                                          .toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: AppTheme.darkBlue,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12),
                                    ),
                                  ),
                                )
                              : Text(
                                  '',
                                ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}

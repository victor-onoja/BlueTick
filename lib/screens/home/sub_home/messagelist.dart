import 'package:bluetick/screens/home/home.dart';
import 'package:bluetick/screens/home/home_tabs.dart';
import 'package:flutter/material.dart';
import '../../../components/config/config_sheet.dart';
import '../../../components/models/broadcast_models.dart';
import '../../../components/ui/ui_utils.dart';

class MessageList extends StatefulWidget {
  const MessageList({Key? key}) : super(key: key);

  @override
  MessageListState createState() => MessageListState();
}

class MessageListState extends State<MessageList> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
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
                  child: ListTile(
                    horizontalTitleGap: 30,
                    leading: CircleAvatar(
                        backgroundImage: AssetImage(
                            messageListItem['id$index']['profile_pic'])),
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
                      spacing: 12,
                      children: [
                        Text(
                          adminStatus(messageListItem, index),
                          style: TextStyle(
                              color: offWhite,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                        FormField(
                          builder: (FormFieldState<dynamic> field) {
                            return GestureDetector(
                                onTap: () => setState(() {
                                      messageListItem['id$index']['isCheck'] =
                                          !messageListItem['id$index']
                                              ['isCheck'];
                                    }),
                                child: Container(
                                  alignment: Alignment.topCenter,
                                  height: 16,
                                  width: 16,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: offWhite),
                                      color: messageListItem['id$index']
                                              ['isCheck']
                                          ? darkBlue
                                          : offWhite),
                                ));
                          },
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    ));
  }
}

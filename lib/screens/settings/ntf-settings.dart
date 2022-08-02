import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/config/config_sheet.dart';
import '../../components/ui/ui_utils.dart';
import '../../components/models/ntf-settings_models.dart';
import '../../components/widgets/radio_options.dart';

class NotificationSettingsStaff extends StatefulWidget {
  const NotificationSettingsStaff({Key? key}) : super(key: key);

  @override
  NotificationSettingsStaffState createState() =>
      NotificationSettingsStaffState();
}

class NotificationSettingsStaffState extends State {
  bool check1 = false; //Conversation Notification Switch
  bool check2 = false; //Use High Priority Notification

  Container settingsHeader(String name) {
    return Container(
      height: 38,
      width: 428,
      padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 16),
      color: offWhite,
      child: Text(
        name,
        style: GoogleFonts.montserrat(
            fontSize: 16, fontWeight: FontWeight.w500, color: darkBlue),
      ),
    );
  }

  ValueChanged<String?> _valueChangedHandler<String>(
      {required String category, required String title}) {
    return (value) {
      setState(() {
        nSettingItems[category]![title][1] = value!;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    List? nMsgSetting = nSettingItems['Messages']?.keys.toList();
    List? nCallSetting = nSettingItems['Calls']?.keys.toList();

    return Scaffold(
      backgroundColor: blue2,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: mainBlue,
          foregroundColor: offWhite,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
          title: Text(
            'Notifications Settings',
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500, fontSize: 24),
          ),
          centerTitle: true),
      bottomNavigationBar: homeBottomNavigationBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 52,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 25, bottom: 5),
                child: ListTile(
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    minVerticalPadding: 10,
                    horizontalTitleGap: 2,
                    tileColor: mainBlue,
                    title: Text(
                      'Conversation Notification',
                      style: GoogleFonts.montserrat(
                          color: offWhite,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    subtitle: Text('Play tones for messages',
                        style: GoogleFonts.montserrat(
                            color: offWhite,
                            fontWeight: FontWeight.w500,
                            fontSize: 12)),
                    trailing: SizedBox(
                        width: 36,
                        height: 16,
                        child: Transform.scale(
                            scale: 0.7,
                            child: CupertinoSwitch(
                              trackColor: offBlack,
                              activeColor: Colors.green,
                              thumbColor: MaterialStateColor.resolveWith(
                                  (states) => offWhite),
                              value: check1,
                              onChanged: (bool value) {
                                setState(() {
                                  check1 = value;
                                });
                              },
                            ))))),
            settingsHeader('Messages'),
            Container(
              margin: const EdgeInsets.only(top: 5),
              height: 300,
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: nMsgSetting!.length,
                  itemBuilder: (BuildContext context, int index) {
                    var dropItems =
                        nSettingItems['Messages']?[nMsgSetting[index]][0];
                    bool UHPN = index == nMsgSetting.length - 1;

                    return Container(
                        height: 47,
                        width: 428,
                        margin: const EdgeInsets.only(bottom: 2),
                        alignment: Alignment.center,
                        color: mainBlue,
                        child: ListTile(
                            minVerticalPadding: 10,
                            dense: true,
                            visualDensity: VisualDensity.compact,
                            title: Text(
                              nMsgSetting[index],
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: offWhite),
                            ),
                            subtitle: Text(
                              UHPN
                                  ? nSettingItems['Messages']![
                                      nMsgSetting[index]]
                                  : nSettingItems['Messages']
                                      ?[nMsgSetting[index]][1],
                              style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: offWhite),
                            ),
                            trailing: index != nMsgSetting.length - 1
                                ? null
                                : SizedBox(
                                    width: 36,
                                    height: 16,
                                    child: Transform.scale(
                                      scale: 0.7,
                                      child: CupertinoSwitch(
                                        trackColor: offBlack,
                                        activeColor: Colors.green,
                                        thumbColor:
                                            MaterialStateColor.resolveWith(
                                                (states) => offWhite),
                                        value: check2,
                                        onChanged: (bool value) {
                                          setState(() {
                                            check2 = value;
                                          });
                                        },
                                      ),
                                    )),
                            onTap: index == nMsgSetting.length - 1
                                ? null
                                : () => showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Dialog(
                                            alignment: Alignment.center,
                                            backgroundColor: mainBlue,
                                            child: ListView(
                                                shrinkWrap: true,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10),
                                                children: dropItems.map<Widget>(
                                                    (String items) {
                                                  return BTRadioOption<String>(
                                                      value: items,
                                                      groupValue: nSettingItems[
                                                              'Messages']?[
                                                          nMsgSetting[
                                                              index]][1],
                                                      label: items,
                                                      text: items,
                                                      onChanged:
                                                          _valueChangedHandler(
                                                              category:
                                                                  'Messages',
                                                              title:
                                                                  nMsgSetting[
                                                                      index]));
                                                }).toList()));
                                      },
                                    )));
                  }),
            ),
            settingsHeader('Calls'),
            Container(
                margin: const EdgeInsets.only(top: 5),
                height: 210,
                child: ListView.builder(
                    //physics: const NeverScrollableScrollPhysics(),
                    itemCount: nCallSetting!.length,
                    itemBuilder: (BuildContext context, int index) {
                      var dropItems =
                          nSettingItems['Calls']?[nCallSetting[index]][0];
                      return Container(
                          height: 47,
                          width: 428,
                          margin: index == nCallSetting.length
                              ? null
                              : const EdgeInsets.only(bottom: 2),
                          alignment: Alignment.center,
                          color: mainBlue,
                          child: ListTile(
                            minVerticalPadding: 10,
                            dense: true,
                            visualDensity: VisualDensity.compact,
                            title: Text(
                              nCallSetting[index],
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: offWhite),
                            ),
                            subtitle: Text(
                              nSettingItems['Calls']?[nCallSetting[index]][1],
                              style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: offWhite),
                            ),
                            onTap: () => showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                      alignment: Alignment.center,
                                      backgroundColor: mainBlue,
                                      child: ListView(
                                          shrinkWrap: true,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          children: dropItems
                                              .map<Widget>((String items) {
                                            return BTRadioOption(
                                                value: items,
                                                groupValue: nSettingItems[
                                                        'Calls']
                                                    ?[nCallSetting[index]][1],
                                                label: items,
                                                text: items,
                                                onChanged: _valueChangedHandler(
                                                    category: 'Calls',
                                                    title:
                                                        nCallSetting[index]));
                                          }).toList()));
                                }),
                          ));
                    }))
          ],
        ),
      ),
    );
  }
}

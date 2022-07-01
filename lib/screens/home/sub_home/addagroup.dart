import 'package:flutter/material.dart';

import '../../../components/config/config_sheet.dart';
import '../../../components/models/broadcast_models.dart';
import '../../../components/ui/ui_utils.dart';

class AddGroup extends StatefulWidget {
  const AddGroup({Key? key}) : super(key: key);

  @override
  AddGroupState createState() => AddGroupState();
}

class AddGroupState extends State<AddGroup> {
  AddGroupState();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          //systemOverlayStyle: SystemUiOverlayStyle(systemStatusBarContrastEnforced: true, statusBarColor: Colors.white),
          elevation: 0,
          toolbarOpacity: 1,
          toolbarHeight: 44,
          backgroundColor: mainBlue,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back)),
          centerTitle: true,
          title: const Text(
            'Add a Group',
            style: TextStyle(fontSize: 24),
          ),

          actions: [
            IconButton(onPressed: () => null, icon: const Icon(Icons.check))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
                alignment: AlignmentDirectional.center,
                height: 49,
                margin: const EdgeInsets.only(bottom: 40),
                decoration: BoxDecoration(color: blue2),
                child: ListTile(
                  horizontalTitleGap: 2,
                  contentPadding: const EdgeInsets.only(right: 2, left: 20),
                  dense: true,
                  trailing: IconButton(
                      color: Colors.black,
                      onPressed: () => null,
                      icon: ImageIcon(
                        const AssetImage('Assets/icons/Vector.png'),
                        color: blackerBlack,
                      )),
                  title: TextField(
                      //showCursor: false,
                      cursorHeight: 12,
                      style: const TextStyle(fontSize: 12),
                      decoration: InputDecoration(
                          constraints: const BoxConstraints.tightFor(
                              width: 336, height: 28),
                          contentPadding:
                              const EdgeInsets.only(left: 10, bottom: 2),
                          hintText: 'Search for a staff',
                          hintStyle: TextStyle(
                              color: blue2,
                              fontWeight: FontWeight.w600,
                              fontSize: 11.98),
                          fillColor: Colors.white,
                          filled: true,
                          border: createScreenBorder(),
                          focusedBorder: createScreenBorder(),
                          enabledBorder: createScreenBorder())),
                )),
            SizedBox(
                height: 550,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: profileItems.length,
                    itemBuilder: (context, index) {
                      return Container(
                          alignment: const Alignment(0, -4),
                          height: 58,
                          margin: const EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                              color: profileItems['id$index']['isColor']
                                  ? mainBlue
                                  : blue2),
                          child: ListTile(
                              minVerticalPadding: -4,
                              visualDensity: VisualDensity.compact,
                              dense: true,
                              leading: CircleAvatar(
                                  maxRadius: 15,
                                  backgroundImage: AssetImage(
                                      profileItems['id$index']['profile_pic'])),
                              //child: profileItems['id$index']['profile_pic']),
                              title: Text(
                                profileItems['id$index']['profile_name'],
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                              subtitle: Text(profileItems['id$index']['status'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: Colors.white)),
                              trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      adminStatus(profileItems, index),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12),
                                    ),
                                    FormField(
                                      builder: (FormFieldState<dynamic> field) {
                                        return Checkbox(
                                            //fillColor: MaterialStateProperty.resolveWith((states) => null),
                                            activeColor: Colors.transparent,
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(2))),
                                            side: MaterialStateBorderSide
                                                .resolveWith((states) =>
                                                    const BorderSide(
                                                        width: 2,
                                                        color: Colors.white)),
                                            value: profileItems['id$index']
                                                ['check'],
                                            onChanged: (value) {
                                              setState(() {
                                                profileItems['id$index']
                                                    ['check'] = value;
                                              });
                                            });
                                      },
                                    ),
                                  ])));
                    }))
          ]),
        ),
      ),
    );
  }
}

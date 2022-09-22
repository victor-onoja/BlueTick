import 'package:bluetick/components/constants/app_router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:textfield_tags/textfield_tags.dart';

import '../../../components/config/config_sheet.dart';
import 'invite_button.dart';

class InvitationB1 extends StatefulWidget {
  const InvitationB1({Key? key}) : super(key: key);

  @override
  State<InvitationB1> createState() => _InvitationB1State();
}

class _InvitationB1State extends State<InvitationB1> {
  late double _distanceToField;
  // late TextfieldTagsController tagController;

  @override
  void didChangeDependencies() {
    _distanceToField = MediaQuery.of(context).size.width;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // tagController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // tagController = TextfieldTagsController();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
        title: Text(
          'Invite Member',
          style: GoogleFonts.montserrat(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: offWhite,
          ),
        ),
        centerTitle: true,
        backgroundColor: mainBlue,
      ),
      //bottomNavigationBar: generalBottomNavigationBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 50, horizontal: 100),
              child: Text(
                'The employee(s) will be sent exclusive invite now!',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                    color: darkBlue, fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: 64,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              color: mainBlue,
              // child: TextFieldTags(
              //   textfieldTagsController: tagController,
              //   textSeparators: [' ', ','],
              //   letterCase: LetterCase.normal,
              //   validator: (String tag) {
              //     if (tagController.getTags!.contains(tag.trim())) {
              //       return 'You already entered that';
              //     }
              //     if (tagController.getTags!.contains(tag.toString()) ==
              //         false) {
              //       return null;
              //     } else {
              //       return null;
              //     }
              //   },
              //   inputfieldBuilder:
              //       (context, tec, fn, error, onChanged, onSubmitted) {
              //     return ((context, sc, tags, onTagDelete) {
              //       return TextField(
              //         controller: tec,
              //         focusNode: fn,
              //         cursorColor: mainBlue,
              //         decoration: InputDecoration(
              //           isDense: true,
              //           filled: true,
              //           fillColor: Colors.white,
              //           labelText: 'Email Address',
              //           hintStyle: GoogleFonts.montserrat(
              //               color: blue2,
              //               fontSize: 16,
              //               fontWeight: FontWeight.w600),
              //           labelStyle: GoogleFonts.montserrat(
              //               color: blue2,
              //               fontSize: 16,
              //               fontWeight: FontWeight.w600),
              //           hintText:
              //               tagController.hasTags ? '' : 'Email Address...',
              //           errorText: error,
              //           prefixIconConstraints:
              //               BoxConstraints(maxWidth: _distanceToField * 0.74),
              //           floatingLabelBehavior: FloatingLabelBehavior.never,
              //           focusedBorder: OutlineInputBorder(
              //               borderSide: BorderSide(color: mainBlue),
              //               borderRadius:
              //                   const BorderRadius.all(Radius.circular(10.0))),
              //           enabledBorder: OutlineInputBorder(
              //             borderSide: BorderSide(color: mainBlue),
              //             borderRadius: const BorderRadius.all(
              //               Radius.circular(10.0),
              //             ),
              //           ),
              //           prefixIcon: tags.isNotEmpty
              //               ? SingleChildScrollView(
              //                   controller: sc,
              //                   child: Wrap(
              //                     children: tags
              //                         .map((String tag) => Container(
              //                               decoration: BoxDecoration(
              //                                 borderRadius:
              //                                     BorderRadius.circular(30),
              //                                 color: offWhite,
              //                               ),
              //                               margin: const EdgeInsets.symmetric(
              //                                   vertical: 5),
              //                               padding: const EdgeInsets.symmetric(
              //                                   vertical: 5, horizontal: 10),
              //                               child: Wrap(
              //                                 children: [
              //                                   InkWell(
              //                                     child: Text(
              //                                       tag,
              //                                       style:
              //                                           GoogleFonts.montserrat(
              //                                               color: offBlack,
              //                                               fontSize: 12,
              //                                               fontWeight:
              //                                                   FontWeight
              //                                                       .w600),
              //                                     ),
              //                                     onTap: () {
              //                                       print('$tag selected');
              //                                     },
              //                                   ),
              //                                   const SizedBox(
              //                                     width: 4,
              //                                   ),
              //                                   InkWell(
              //                                     child: Icon(
              //                                       Icons.cancel,
              //                                       size: 14,
              //                                       color: blackerBlack,
              //                                     ),
              //                                     onTap: () {
              //                                       onTagDelete(tag);
              //                                     },
              //                                   ),
              //                                 ],
              //                               ),
              //                             ))
              //                         .toList(),
              //                   ),
              //                 )
              //               : null,
              //         ),
              //         onSubmitted: onSubmitted,
              //         onChanged: onChanged,
              //       );
              //     });
              //   },
              // ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
              child: Text(
                'Note: Separate multiple email addresses with commas or space',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: darkBlue,
                ),
              ),
            ),
            InviteButton(
              onTap: () {
                Navigator.pushNamed(context, AppRouter.invitationSent);
              },
              text: 'Send Invite (s)',
              textColor: Colors.white,
              buttonColor: mainBlue,
            ),
          ],
        ),
      ),
    );
  }
}

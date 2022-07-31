import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../components/config/config_sheet.dart';
import '../../../components/ui/ui_utils.dart';
import 'invite_button.dart';

class InvitationSent extends StatefulWidget {
  const InvitationSent({Key? key}) : super(key: key);

  @override
  State<InvitationSent> createState() => _InvitationSentState();
}

class _InvitationSentState extends State<InvitationSent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop,
            icon: const Icon(Icons.arrow_back)),
        title: Text(
          'Invite Sent',
          style: GoogleFonts.montserrat(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: offWhite,
          ),
        ),
        centerTitle: true,
        backgroundColor: mainBlue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
                right: 100,
                left: 100,
              ),
              child: Text(
                'Awesome!\nYour invitation was sent successfully.',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                    color: darkBlue, fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Image.asset('Assets/images/Invite_sent.png'),
            InviteButton(
              onTap: () {},
              text: 'Send More',
              textColor: Colors.white,
              buttonColor: mainBlue,
            ),
            InviteButton(
              onTap: () {},
              text: 'Home',
              textColor: mainBlue,
              buttonColor: Colors.white,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

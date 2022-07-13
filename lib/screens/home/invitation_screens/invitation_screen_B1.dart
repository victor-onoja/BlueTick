import 'package:bluetick/components/app_theme.dart';
import 'package:bluetick/components/config/config_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class InvitationScreenB1 extends StatefulWidget {
  const InvitationScreenB1({Key? key}) : super(key: key);

  @override
  State<InvitationScreenB1> createState() => _InvitationScreenB1State();
}

class _InvitationScreenB1State extends State<InvitationScreenB1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.offWhite,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppTheme.offWhite.withOpacity(0.7)),
        backgroundColor: AppTheme.mainBlue,
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Invite Member',
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'The employee(s) will be sent\n exclusive invite now!',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 16,
                    color: darkBlue2,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            Container(
              // margin: const EdgeInsets.only(top: 24, bottom: 8),
              padding: const EdgeInsets.all(8),
              height: 64,
              color: AppTheme.mainBlue,
              alignment: Alignment.center,
              child: TextField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: 'Email Address',
                  hintStyle: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.blue2,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  fillColor: AppTheme.offWhite,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: AppTheme.mainBlue,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: AppTheme.mainBlue,
                      width: 2,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

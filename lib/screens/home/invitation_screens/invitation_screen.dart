import 'package:bluetick/components/app_theme.dart';
import 'package:bluetick/components/config/config_sheet.dart';
import 'package:bluetick/components/constants/app_router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class InvitationScreen extends StatefulWidget {
  const InvitationScreen({Key? key}) : super(key: key);

  @override
  State<InvitationScreen> createState() => _InvitationScreenState();
}

class _InvitationScreenState extends State<InvitationScreen> {
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
        padding: const EdgeInsets.symmetric(horizontal: 34.0, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Select a role for new employees and\n define what they are allowed to\n  view and manage ',
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
              height: 80,
            ),

            ///This feature has been removed for now
            // GestureDetector(
            //   onTap: () {
            //     Navigator.pushNamed(context, AppRouter.invitationB1);
            //     //  Navigator.push(context,
            //     //    MaterialPageRoute(builder: (_) => InvitationB1()));
            //   },
            //   child: InvitationCard(
            //       imagePath: 'Assets/icons/admin_invite_photo.png',
            //       cardLabel: 'Manage employees\n and workspace',
            //       cardStatus: 'Admin'),
            // ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, AppRouter.invitationB1),
              child: InvitationCard(
                  cardStatus: 'Staff',
                  cardLabel: 'View staff members\n in your team',
                  imagePath: 'Assets/icons/staff_invite_photo.png'),
            ),
          ],
        ),
      ),
    );
  }
}

class InvitationCard extends StatelessWidget {
  final String imagePath;
  final String cardStatus;
  final String cardLabel;
  const InvitationCard({
    Key? key,
    required this.imagePath,
    required this.cardLabel,
    required this.cardStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
      height: 105,
      width: 360,
      decoration: BoxDecoration(
        color: AppTheme.mainBlue,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(imagePath),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cardStatus,
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 27,
                    color: offWhite,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                textAlign: TextAlign.start,
              ),
              Text(
                cardLabel,
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 16,
                    color: offWhite,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          Image.asset('Assets/icons/arrow_right_B.png'),
        ],
      ),
    );
  }
}

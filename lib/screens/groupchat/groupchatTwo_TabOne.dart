import 'package:bluetick/components/app_theme.dart';
import 'package:bluetick/screens/home/sub_home/co_worker_profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home/sub_home/staff_profile_admin.dart';

class MemberTab extends StatelessWidget {
  const MemberTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(mainAxisSize: MainAxisSize.max, children: [
        const SizedBox(
          height: 20.17,
        ),
        Divider(
          thickness: 2,
          color: Colors.white,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => StaffProfileAdmin()));
          },
          child: GestureDetector(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => WorkerScreen())),
            child: onlineStaff(
              name: 'John Mac',
            ),
          ),
        ),
        onlineeStaff(
          name: 'Bethie Drey',
        ),
        onlineeStaff(
          name: 'Lisa Mo',
        ),
        onlineeStaff(
          name: 'Vera McBerth',
        ),
        onlineeStaff(
          name: 'Tim So',
        ),
        offlineStaff(
          name: 'Dera Seth',
        ),
        offlineStaff(
          name: 'Oh Chin',
        ),
        offlineStaff(
          name: 'Garry Tia',
        ),
      ]),
    );
  }
}

Container onlineStaff({required String name}) {
  return Container(
    margin: const EdgeInsets.only(top: 4),
    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
    height: 51.97,
    color: AppTheme.offWhite,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                //top: 2, bottom: 2,
                right: 25.96,
              ),
              child: Container(
                height: 31.95,
                width: 31.96,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'Assets/sample_pic.png',
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    color: AppTheme.blackerBlack,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Online',
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    color: AppTheme.blackerBlack,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
        Text(
          'Admin',
          style: GoogleFonts.montserrat(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
            color: AppTheme.blackerBlack,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

Container onlineeStaff({required String name}) {
  return Container(
    margin: const EdgeInsets.only(top: 4),
    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
    height: 51.97,
    color: AppTheme.offWhite,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                //top: 2, bottom: 2,
                right: 25.96,
              ),
              child: Container(
                height: 31.95,
                width: 31.96,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'Assets/sample_pic.png',
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    color: AppTheme.blackerBlack,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Online',
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    color: AppTheme.blackerBlack,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

Container offlineStaff({required String name}) {
  return Container(
      margin: const EdgeInsets.only(top: 4),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      height: 51.97,
      color: AppTheme.offWhite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              //top: 2, bottom: 2,
              right: 25.96,
            ),
            child: Container(
              height: 31.95,
              width: 31.96,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'Assets/sample_pic.png',
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  color: AppTheme.blackerBlack,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'Offline',
                style: GoogleFonts.montserrat(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  color: AppTheme.blackerBlack,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ));
}

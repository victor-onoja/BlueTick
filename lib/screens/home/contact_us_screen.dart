import 'package:bluetick/components/widgets/invite_button.dart';
import 'package:bluetick/components/widgets/popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../components/app_theme.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  int initialPage = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppTheme.blue2,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppTheme.white),
        backgroundColor: AppTheme.mainBlue,
        elevation: 0.0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back)),
        title: Text(
          'Contact Us',
          style: GoogleFonts.montserrat(
              color: AppTheme.offWhite,
              fontWeight: FontWeight.w600,
              fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 24, right: 23),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'How can we help?',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    color: AppTheme.mainBlue,
                    fontSize: 24),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                    color: AppTheme.white,
                    borderRadius: BorderRadius.circular(3.5)),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Email Address',
                      hintStyle: TextStyle(color: AppTheme.blue2),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppTheme.mainBlue))),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                    color: AppTheme.white,
                    borderRadius: BorderRadius.circular(3.5)),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Full Name',
                      hintStyle: TextStyle(color: AppTheme.blue2),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppTheme.mainBlue))),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                    color: AppTheme.white,
                    borderRadius: BorderRadius.circular(3.5)),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Subject',
                      hintStyle: TextStyle(color: AppTheme.blue2),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppTheme.mainBlue))),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 192,
                decoration: BoxDecoration(
                    color: AppTheme.white,
                    borderRadius: BorderRadius.circular(3.5)),
                child: TextField(
                  //expands: true,
                  maxLines: 8,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'More Details...',
                      hintStyle: TextStyle(color: AppTheme.blue2),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppTheme.mainBlue))),
                ),
              ),
              SizedBox(
                height: 36,
              ),
              InviteButton(
                text: 'Send',
                textColor: AppTheme.white,
                buttonColor: AppTheme.mainBlue,
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => const popUp());
                },
              ),
              SizedBox(
                height: 48,
              ),
              Center(
                child: Text(
                  'Or connect with us',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      color: AppTheme.mainBlue,
                      fontSize: 24),
                ),
              ),
              Center(
                child: Text(
                  'on our other platforms',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      color: AppTheme.mainBlue,
                      fontSize: 24),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              InviteButton(
                text: 'Connect',
                textColor: AppTheme.white,
                buttonColor: AppTheme.mainBlue,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: Container(
      //   decoration: const BoxDecoration(
      //     gradient: LinearGradient(
      //       colors: [
      //         Color(0xff244BA9),
      //         Color(0xff162850),
      //       ],
      //       begin: Alignment.topCenter,
      //       end: Alignment.bottomCenter,
      //     ),
      //   ),
      //   height: 70,
      //   child: CupertinoTabBar(
      //     currentIndex: initialPage,
      //     backgroundColor:
      //         const Color(0xff162850).withOpacity(0.1), //Color(0xff244BA9),
      //     // Color(0xff162850),
      //
      //     // onTap: onClicked,
      //
      //     items: [
      //       BottomNavigationBarItem(
      //         icon: Column(
      //           mainAxisSize: MainAxisSize.min,
      //           children: [
      //             Image.asset(
      //               'Assets/home.png',
      //             ),
      //             const SizedBox(
      //               height: 5,
      //             ),
      //             Text(
      //               'Home',
      //               style: GoogleFonts.montserrat(
      //                   fontSize: 11,
      //                   fontWeight: FontWeight.w600,
      //                   fontStyle: FontStyle.normal,
      //                   color: AppTheme.offWhite,
      //                   letterSpacing: 0.8),
      //               textAlign: TextAlign.center,
      //             )
      //           ],
      //         ),
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Column(
      //           mainAxisSize: MainAxisSize.min,
      //           children: [
      //             Image.asset(
      //               'Assets/notification.png',
      //             ),
      //             const SizedBox(
      //               height: 5,
      //             ),
      //             Text(
      //               'Notification',
      //               style: GoogleFonts.montserrat(
      //                 fontSize: 11,
      //                 fontWeight: FontWeight.w600,
      //                 fontStyle: FontStyle.normal,
      //                 color: AppTheme.offWhite,
      //                 letterSpacing: 0.8,
      //               ),
      //               textAlign: TextAlign.center,
      //             )
      //           ],
      //         ),
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Column(
      //           mainAxisSize: MainAxisSize.min,
      //           children: [
      //             Image.asset(
      //               'Assets/icons/broadcast.png',
      //               scale: 0.8,
      //               fit: BoxFit.cover,
      //             ),
      //             Text(
      //               'Broadcast',
      //               style: GoogleFonts.montserrat(
      //                   fontSize: 11,
      //                   fontWeight: FontWeight.w600,
      //                   fontStyle: FontStyle.normal,
      //                   color: AppTheme.offWhite,
      //                   letterSpacing: 0.8),
      //               textAlign: TextAlign.center,
      //             ),
      //           ],
      //         ),
      //       ),
      //       BottomNavigationBarItem(
      //         icon:
      //             // Image.asset('name'),
      //             Column(
      //           mainAxisSize: MainAxisSize.min,
      //           children: [
      //             Image.asset('Assets/message.png'),
      //             const SizedBox(
      //               height: 5,
      //             ),
      //             Text(
      //               'Messages',
      //               style: GoogleFonts.montserrat(
      //                   fontSize: 11,
      //                   fontWeight: FontWeight.w600,
      //                   fontStyle: FontStyle.normal,
      //                   color: AppTheme.offWhite,
      //                   letterSpacing: 0.8),
      //               textAlign: TextAlign.center,
      //             )
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    ));
  }
}

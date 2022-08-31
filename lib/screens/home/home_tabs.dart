import 'package:bluetick/screens/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/app_theme.dart';
import '../../components/config/config_sheet.dart';
import 'notifications.dart';
import 'sub_home/createbroadcast.dart';
import 'sub_home/messagelist.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final pageController = PageController();
  int initialPage = 0;

  final pages = [
    HomeScreen(),
    Notifications(),
    CreateBroadcast(),
    MessageList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[initialPage],

      //     PageView(
      //   children: [
      //     HomeScreen(),
      //     Notifications(),
      //     CreateBroadcast(),
      //     MessageList(),
      //   ],
      //   onPageChanged: onPageClicked,
      //   controller: pageController,
      // ),
      bottomNavigationBar: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff244BA9), //.withOpacity(0.09),
                Color(0xff162850) //.withOpacity(0.69),
              ],
              stops: [.1, 0.77],
              tileMode: TileMode.mirror,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          height: 60,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            iconSize: 20.62,
            unselectedFontSize: 10,
            unselectedItemColor: offWhite,
            selectedItemColor: white,
            selectedLabelStyle: GoogleFonts.montserrat(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
                color: AppTheme.offWhite,
                letterSpacing: 0.8),
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: onPageClicked,
            currentIndex: initialPage,
            //elevation: 0,
            //   enableFeedback: true,
            backgroundColor: mainBlue.withOpacity(0.1),

            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                label: 'Home',
                icon:
                    //Icon(Icons.message),
                    IconButton(
                  color: offWhite,
                  onPressed: () {
                    setState(() {
                      initialPage = 0;
                    });
                  },
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity(vertical: -4, horizontal: -4),
                  icon:
                      //Icon(Icons.message),
                      const ImageIcon(
                    AssetImage('Assets/icons/bx_home.png'),
                  ),
                  iconSize: 22,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Notification',
                icon:
                    //Icon(Icons.notifications),
                    IconButton(
                  color: offWhite,
                  visualDensity: VisualDensity(vertical: -4, horizontal: -4),
                  iconSize: 22,
                  onPressed: () {
                    setState(() {
                      initialPage = 1;
                    });
                  },
                  padding: EdgeInsets.zero,
                  icon:
                      //Icon(Icons.notifications),
                      const ImageIcon(
                          AssetImage('Assets/icons/bx_notification.png')),
                ),
              ),
              BottomNavigationBarItem(
                label: 'Broadcast',
                icon:
                    //Icon(Icons.star),
                    IconButton(
                  iconSize: 22,
                  visualDensity: VisualDensity(vertical: -4, horizontal: -4),
                  color: offWhite,
                  onPressed: () {
                    setState(() {
                      initialPage = 2;
                    });
                  },
                  icon:
                      //Icon(Icons.star),
                      ImageIcon(AssetImage('Assets/icons/bx_broadcast.png')),
                  padding: EdgeInsets.zero,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Messages',
                icon:
                    //Icon(Icons.message),
                    IconButton(
                  iconSize: 22,
                  splashRadius: 1,
                  visualDensity: VisualDensity(vertical: -4, horizontal: -4),
                  color: offWhite,
                  onPressed: () {
                    setState(() {
                      initialPage = 3;
                    });
                  },
                  icon:
                      //Icon(Icons.message),
                      ImageIcon(
                    AssetImage('Assets/icons/bx_message.png'),
                    color: offWhite, //Colors.white,
                  ),
                  padding: EdgeInsets.zero,
                ),
              )
            ],
          )

          // CupertinoTabBar(
          //   currentIndex: initialPage,
          //   backgroundColor:
          //       const Color(0xff162850).withOpacity(0.1), //Color(0xff244BA9),
          //   // Color(0xff162850),
          //
          //   onTap: onClicked,
          //
          //   items: [
          //     BottomNavigationBarItem(
          //       icon: Column(
          //         mainAxisSize: MainAxisSize.min,
          //         children: [
          //           Image.asset(
          //             'Assets/home.png',
          //           ),
          //           const SizedBox(
          //             height: 5,
          //           ),
          //           Text(
          //             'Home',
          //             style: GoogleFonts.montserrat(
          //                 fontSize: 11,
          //                 fontWeight: FontWeight.w600,
          //                 fontStyle: FontStyle.normal,
          //                 color: AppTheme.offWhite,
          //                 letterSpacing: 0.8),
          //             textAlign: TextAlign.center,
          //           )
          //         ],
          //       ),
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Column(
          //         mainAxisSize: MainAxisSize.min,
          //         children: [
          //           Image.asset('Assets/notification.png'),
          //           const SizedBox(
          //             height: 5,
          //           ),
          //           Text(
          //             'Notification',
          //             style: GoogleFonts.montserrat(
          //               fontSize: 11,
          //               fontWeight: FontWeight.w600,
          //               fontStyle: FontStyle.normal,
          //               color: AppTheme.offWhite,
          //               letterSpacing: 0.8,
          //             ),
          //             textAlign: TextAlign.center,
          //           )
          //         ],
          //       ),
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Column(
          //         mainAxisSize: MainAxisSize.min,
          //         children: [
          //           Image.asset('Assets/broadcast.png'),
          //           Text(
          //             'Broadcast',
          //             style: GoogleFonts.montserrat(
          //                 fontSize: 11,
          //                 fontWeight: FontWeight.w600,
          //                 fontStyle: FontStyle.normal,
          //                 color: AppTheme.offWhite,
          //                 letterSpacing: 0.8),
          //             textAlign: TextAlign.center,
          //           ),
          //         ],
          //       ),
          //     ),
          //     BottomNavigationBarItem(
          //       icon:
          //           // Image.asset('name'),
          //           Column(
          //         mainAxisSize: MainAxisSize.min,
          //         children: [
          //           Image.asset('Assets/message.png'),
          //           const SizedBox(
          //             height: 5,
          //           ),
          //           Text(
          //             'Messages',
          //             style: GoogleFonts.montserrat(
          //                 fontSize: 11,
          //                 fontWeight: FontWeight.w600,
          //                 fontStyle: FontStyle.normal,
          //                 color: AppTheme.offWhite,
          //                 letterSpacing: 0.8),
          //             textAlign: TextAlign.center,
          //           )
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
          ),
    );
  }

  onClicked(int value) {
    pageController.animateToPage(
      value,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeIn,
    );
  }

  void onPageClicked(int value) {
    setState(() {
      initialPage = value;
    });
  }
}

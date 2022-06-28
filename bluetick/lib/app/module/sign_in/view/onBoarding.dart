import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:bluetick/widgets/sign_up_button.dart';
import 'package:bluetick/util/app_theme.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    const lg = 'assets/logo.png';
    return Scaffold(
        backgroundColor: AppTheme.offWhite,
        body: Stack(
          children: [
            PageView(
              controller: _controller,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topCenter,
                          child: Container(
                            child: Image.asset(lg),
                          ),
                        ),
                        Align(
                          alignment: Alignment(0, -0.30),
                          child: Container(
                            child: Text(
                              'BlueTick',
                              style: GoogleFonts.montserrat(
                                  color: AppTheme.mainBlue,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 80),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(0, -0.08),
                          child: Container(
                            child: Text(
                              'Closer Than You Think',
                              style: GoogleFonts.montserrat(
                                  color: AppTheme.mainBlue,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(),
                Container()
              ],
            ),
            Container(
              alignment: Alignment(0, 0.50),
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                onDotClicked: (index) {},
                effect: WormEffect(
                    spacing: 10,
                    radius: 10,
                    dotWidth: 10,
                    dotHeight: 10,
                    dotColor: AppTheme.blue2),
              ),
            ),
            Container(
              alignment: Alignment(0, 0.80),
              child: SignUpButton(
                onTapButton: () {},
                buttonColor: AppTheme.mainBlue,
                text: 'Continue',
                textColor: AppTheme.white,
              ),
            )
          ],
        ));
  }
}

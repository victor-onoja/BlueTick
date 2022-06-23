import 'package:flutter/material.dart';
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
    const pc = 'assets/startup.png';
    return Scaffold(
        backgroundColor: AppTheme.offWhite,
        body: Stack(
          children: [
            PageView(
              controller: _controller,
              children: [
                Container(
                    child: Center(
                        child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Image.asset(pc),
                ))),
                Container(),
                Container()
              ],
            ),
            Container(
              alignment: Alignment(0, 0.60),
              child: SmoothPageIndicator(controller: _controller, count: 3),
            ),
            Container(
              alignment: Alignment(0, 0.75),
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

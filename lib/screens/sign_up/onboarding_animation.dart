import 'package:bluetick/screens/sign_in/login.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../components/app_theme.dart';
import '../../components/widgets/widgets.dart';

class OnBoardingScreenAnimation extends StatefulWidget {
  const OnBoardingScreenAnimation({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreenAnimation> createState() =>
      _OnBoardingScreenAnimationState();
}

class _OnBoardingScreenAnimationState extends State<OnBoardingScreenAnimation> {
  final OnBoardingImages = [
    'Assets/splash1.png',
    'Assets/splash2.png',
    'Assets/splash3.png',
  ];
  int initValue = 0;
  final lg = 'Assets/logo.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.offWhite,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider.builder(
              itemCount: OnBoardingImages.length,
              itemBuilder: (context, index, realIndex) {
                index = initValue;
                final onBImages = OnBoardingImages[index];
                return OnBoardingScreens(onBImages, index);
              },
              options: CarouselOptions(
                  height: 450,
                  viewportFraction: 1,
                  autoPlay: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.scale,
                  enlargeCenterPage: true,
                  autoPlayAnimationDuration: const Duration(seconds: 1),
                  onPageChanged: (index, reason) {
                    setState(() {
                      initValue = index;
                    });
                  }),
            ),
            Container(
              child: AnimatedSmoothIndicator(
                activeIndex: initValue,
                count: OnBoardingImages.length,
                duration: const Duration(milliseconds: 500),
                onDotClicked: (index) {
                  setState(() {
                    initValue = index;
                  });
                },
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
                onTapButton: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => const LoginScreen()));
                },
                buttonColor: AppTheme.mainBlue,
                text: 'Continue',
                textColor: AppTheme.white,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget OnBoardingScreens(String onBImages, int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      color: Colors.transparent,
      child: Image.asset(
        onBImages,
      ),
    );
  }
}

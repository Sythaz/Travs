import 'package:animate_do/animate_do.dart' as animate_do;
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:travs/routes/app_route.dart';
import '../themes/app_assets.dart';
import '../themes/text_style_helper.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(AppAssets.bgSplashScreen, fit: BoxFit.cover),
          Align(
            // Alignment ini mirip dengan center namun bisa diatur horizontal dan vertikalnya
            alignment: Alignment(0, -0.8),
            child: SizedBox(
              width: 255,
              child: AnimatedTextKit(
                isRepeatingAnimation: false,
                animatedTexts: [
                  TypewriterAnimatedText(
                    "TRAVS",
                    speed: const Duration(milliseconds: 300),
                    textStyle: TextStyleHelper.getTextStyle(
                      context,
                      'mExtraBold64',
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 16,
            bottom: 80,
            child: animate_do.FadeInLeft(
              delay: Duration(milliseconds: 600),
              duration: const Duration(milliseconds: 1300),
              child: Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Let’s Explore\nThe World',
                    style:
                        TextStyleHelper.getTextStyle(context, 'mExtraBold24'),
                  ),
                  Text(
                    'Embark on new adventures and\nmake every journey unforgettable!',
                    style: TextStyleHelper.getTextStyle(context, 'rRegular14'),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 16,
            bottom: 100,
            child: Bounce(
              scaleFactor: 0.8,
              onTap: () => Get.toNamed(AppRoutes.home),
              child: SvgPicture.asset(AppAssets.onboardingNextIcon),
            ),
          ),
        ],
      ),
    );
  }
}

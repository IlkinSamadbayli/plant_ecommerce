import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_ecommerce/constants/sizedbox.dart';
import 'package:plant_ecommerce/styles/global_assets/global_assets.dart';
import 'package:plant_ecommerce/styles/styles/text_style.dart';
import 'package:plant_ecommerce/ui/screens/onboard/enterance_screen.dart';
import 'package:plant_ecommerce/ui/global_widgets/global_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../styles/colors/app_colors.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({Key? key}) : super(key: key);

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  late final PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (int index) {
          currentIndex = index;
          setState(() {});
        },
        children: [
          centerPage(
            Image.asset(GlobalAssets.onboard_1),
            'We provide high quality plants just for you',
          ),
          centerPage(
            Image.asset(GlobalAssets.onboard_2),
            "Your satisfaction is our number one priority",
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: centerPage(
              Image.asset(GlobalAssets.onboard_3),
              "Let's Shop Your Fovarite Plants With Patea Now",
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        padding: AppSize.paddingH8,
        height: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: SlideEffect(activeDotColor: AppColor.primaryColor),
              ),
            ),
            AppSize.sizeHeight16,
            GlobalButton(
              text: currentIndex == 2 ? "Get Started" : "Next",
              onTap: () => currentIndex == 2
                  ? Get.to(() => const EnterancePage())
                  : _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut),
            ),
          ],
        ),
      ),
    );
  }
}

Widget centerPage(Image image, String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 60,
      vertical: 80,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppSize.sizeHeight8,
        image,
        AppSize.sizeHeight60,
        Text(
          text,
          style: CustomTextStyle.standardStyleItalic,
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

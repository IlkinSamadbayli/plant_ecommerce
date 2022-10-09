import 'package:flutter/material.dart';
import 'package:plant_ecommerce/styles/text_style/text_style.dart';
import 'package:plant_ecommerce/ui/screens/onboard_screen_2.dart';
import 'package:plant_ecommerce/ui/widgets/global_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constants/routes/global_routes.dart';
import '../../styles/colors/app_colors.dart';

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
            Image.asset('./assets/images/onboard_1.png'),
            'We provide high quality plants just for you',
          ),
          centerPage(
            Image.asset('./assets/images/onboard_2.png'),
            "Your satisfaction is our number one priority",
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: centerPage(
              Image.asset('./assets/images/onboard_3.png'),
              "Let's Shop Your Fovarite Plants With Patea Now",
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
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
            const SizedBox(
              height: 16,
            ),
            globalButton(
              text: currentIndex == 2 ? "Get Started" : "Next",
              isIcon: false,
              clicked: true,
              onTap: () => currentIndex == 2
                  ? GlobalRoutes.to(context, const EnterancePage())
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
        const SizedBox(height: 8),
        image,
        const SizedBox(height: 60),
        Text(
          text,
          style: CustomTextStyle.standardStyleItalic,
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

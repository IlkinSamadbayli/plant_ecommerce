import 'package:flutter/material.dart';
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('./assets/images/onboard_1.png'),
              const Text(
                'We provide high quality plants just for you',
                style: TextStyle(fontSize: 40),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 64),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Image.asset('./assets/images/onboard_2.png'),
                const Text(
                  "Your satisfaction is our number one priority",
                  style: TextStyle(fontSize: 41),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('./assets/images/onboard_3.png'),
              const Text(
                "Let's Shop Your Fovarite Plants With Patea Now",
                style: TextStyle(fontSize: 41),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
            ],
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
                effect: SlideEffect(activeDotColor: AppColor.mainColor),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: AppColor.mainColor,
              ),
              child: TextButton(
                child: currentIndex == 2
                    ? GestureDetector(
                        onTap: () {
                          GlobalRoutes.to(context, const OnboardPage());
                        },
                        child: Text(
                          'Get stated',
                          style: TextStyle(
                            color: AppColor.versionColorWhite,
                          ),
                        ),
                      )
                    : Text(
                        'Next',
                        style: TextStyle(color: AppColor.versionColorWhite),
                      ),
                onPressed: () {
                  if (currentIndex < 2) {
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

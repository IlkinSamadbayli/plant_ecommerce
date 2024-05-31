import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:plant_ecommerce/constants/sizedbox.dart';
import 'package:plant_ecommerce/global/global_assets/global_assets.dart';
import 'package:plant_ecommerce/presentation/global_widgets/global_input.dart';
import 'package:plant_ecommerce/presentation/screens/home/components/home_provider.dart';
import 'package:plant_ecommerce/styles/colors/app_colors.dart';
import 'package:plant_ecommerce/styles/styles/text_style.dart';

import 'cards_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late FocusNode filterFocus;
  late TextEditingController filterController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    filterFocus = FocusNode();
    filterController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    filterFocus.dispose();
    filterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: Container(
          margin: AppSize.padding8x6x6,
          child: Image.asset(GlobalAssets.avatar),
        ),
        title: Row(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Good Morning",
                      style: CustomTextStyle.moreTinyStyleGray,
                    ),
                    AppSize.sizeWidth8,
                    Icon(
                      Icons.back_hand,
                      size: 20,
                      color: AppColor.lightGreenColor,
                      //  Colors.yellow,
                    )
                  ],
                ),
                Text(
                  "Ilkin Samadbayli",
                  style: CustomTextStyle.tinyStyleBold,
                )
              ],
            )
          ],
        ),
        actions: [
          Container(
            width: 90,
            margin: AppSize.paddingRight12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Consumer<HomeProvider>(
                  builder: (context, value, child) => GestureDetector(
                      onTap: () {
                        value.notificationAppbar;
                      },
                      child: value.isNotificationOpen
                          ? const Icon(Icons.notifications, size: 32)
                          : const Icon(Icons.notifications_none_sharp,
                              size: 32)),
                ),
                Consumer<HomeProvider>(
                  builder: (context, appProvider, child) => GestureDetector(
                    onTap: () {
                      appProvider.addFavor;
                    },
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Icon(
                          Icons.favorite,
                          size: 32,
                          color: AppColor.versionColorWhite,
                        ),
                        appProvider.favorCards.isNotEmpty
                            ? Positioned(
                                right: -2,
                                top: -2,
                                child: ClipOval(
                                  child: Container(
                                    width: 14,
                                    height: 14,
                                    decoration: BoxDecoration(
                                      color: AppColor.errorColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Text(
                                      appProvider.favorCards.length.toString(),
                                      style: const TextStyle(fontSize: 12),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: Form(
        key: formKey,
        child: GestureDetector(
          onTap: () {
            if (filterFocus.hasFocus) {
              filterFocus.unfocus();
            }
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                // AppSize.sizeHeight10,
                CarouselSlider.builder(
                  itemCount: 3,
                  itemBuilder: (context, i, realIndex) => Stack(
                    children: [
                      Image.asset("./assets/images/carusel_${i + 1}.png"),
                      Positioned(
                        bottom: 16,
                        left: 70,
                        child: Text(
                          "Amount %20",
                          style: CustomTextStyle.standardStyleBold,
                        ),
                      ),
                    ],
                  ),
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 4 / 3,
                  ),
                ),
                AppSize.sizeHeight10,
                GlobalInput(
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const Icon(Icons.format_list_bulleted_sharp),
                  hintText: "Search",
                  isPassword: false,
                  keyboardType: TextInputType.name,
                  isCorrect: true,
                  onChanged: (v) {},
                  controller: filterController,
                  textFocus: filterFocus,
                  enabled: true,
                ),
                AppSize.sizeHeight10,
                Padding(
                  padding: AppSize.paddingH35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Special offers',
                        style: CustomTextStyle.littleStyleBold,
                      ),
                      Text(
                        'See all',
                        style: CustomTextStyle.tinyStyleGreenBold,
                      ),
                    ],
                  ),
                ),

                const CardsWidget(),
              ],
            ),
            // AppSize.sizeHeight10,
          ),
        ),
      ),
    );
  }
}

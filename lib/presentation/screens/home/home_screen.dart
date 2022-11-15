// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:plant_ecommerce/constants/sizedbox.dart';
import 'package:plant_ecommerce/data/product_data.dart';
import 'package:plant_ecommerce/global/global_assets/global_assets.dart';
import 'package:plant_ecommerce/presentation/global_widgets/global_input.dart';
import 'package:plant_ecommerce/providers/provider.dart';
import 'package:plant_ecommerce/styles/colors/app_colors.dart';
import 'package:plant_ecommerce/styles/styles/text_style.dart';

import 'components/card_widget.dart';

class HomeScreen extends StatefulWidget {
  // int index;
  const HomeScreen({
    Key? key,
    // required this.index,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductData data = ProductData();
  late FocusNode filterFocus;
  late TextEditingController filterController;
  @override
  void initState() {
    filterFocus = FocusNode();
    filterController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Consumer<AppProvider>(
                  builder: (context, value, child) => GestureDetector(
                      onTap: () {
                        value.notificationAppbar;
                      },
                      child: value.isNotificationOpen
                          ? const Icon(Icons.notifications, size: 32)
                          : const Icon(Icons.notifications_none_sharp,
                              size: 32)),
                ),
                AppSize.sizeWidth16,
                Consumer<AppProvider>(
                  builder: (context, appProvider, child) => GestureDetector(
                    onTap: () {
                      appProvider.likedAppbarHome;
                    },
                    child: Stack(
                      children: [
                        Icon(
                          Icons.favorite,
                          size: 32,
                          color: appProvider.isLiked
                              ? AppColor.errorColor
                              : AppColor.versionColorWhite,
                        ),
                        Positioned(
                          right: -1,
                          top: 0,
                          child: ClipOval(
                            child: Container(
                              width: 14,
                              height: 14,
                              decoration: BoxDecoration(
                                color: AppColor.errorColor,
                                shape: BoxShape.circle,
                              ),
                              child: const Text(
                                "21",
                                style: TextStyle(fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppSize.sizeHeight10,
            Column(
              children: [
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
              ],
            ),
            // CarouselSlider(

            //   items: [ExactAssetImage('images/06.jpg')],
            // ),
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
            cardList(-1),
            AppSize.sizeHeight10,
            cardList(2),
            AppSize.sizeHeight10,
            cardList(5),
            AppSize.sizeHeight10,
          ],
        ),
      ),
    );
  }

  Widget cardList(index) {
    return Padding(
      padding: AppSize.paddingH15,
      child: SizedBox(
        height: 240,
        child: Expanded(
          child: ListView.separated(
            // padding: AppSize.paddingH15,
            separatorBuilder: (context, _) => AppSize.sizeWidth10,
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, _) {
              index++;
              // return const SizedBox();
              return CardWidget(
                item: ProductData.items[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
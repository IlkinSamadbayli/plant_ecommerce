import 'package:flutter/material.dart';
import 'package:plant_ecommerce/constants/sizedbox.dart';
import 'package:plant_ecommerce/data/product_data.dart';
import 'package:plant_ecommerce/providers/provider.dart';
import 'package:plant_ecommerce/styles/colors/app_colors.dart';

import 'package:plant_ecommerce/global/global_assets/global_assets.dart';
import 'package:plant_ecommerce/styles/styles/text_style.dart';
import 'package:plant_ecommerce/ui/global_widgets/global_input.dart';
import 'package:plant_ecommerce/ui/screens/home/components/card_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
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
          margin: const EdgeInsets.only(
            left: 8,
            top: 6,
            bottom: 6,
          ),
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
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.back_hand,
                      size: 20,
                      color: Colors.yellow,
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
            margin: const EdgeInsets.only(right: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    child: appProvider.isLiked
                        ? Icon(
                            Icons.favorite,
                            size: 32,
                            color: AppColor.errorColor,
                          )
                        : const Icon(Icons.favorite_border, size: 32),
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
            cardList,
            cardList,
            // child: CarouselSlider(
            //   items: [
            //     ExactAssetImage('images/06.jpg')
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  Widget get cardList {
    return SizedBox(
      height: 240,
      child: Expanded(
        child: ListView.separated(
          separatorBuilder: (context, index) => AppSize.sizeWidth10,
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) =>
              CardWidget(item: ProductData.items[index]),
        ),
      ),
    );
  }
}

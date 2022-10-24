import 'package:flutter/material.dart';
import 'package:plant_ecommerce/constants/sizedbox.dart';
import 'package:plant_ecommerce/styles/colors/app_colors.dart';

import 'package:plant_ecommerce/styles/global_assets/global_assets.dart';
import 'package:plant_ecommerce/styles/styles/text_style.dart';
import 'package:plant_ecommerce/ui/widgets/global_input.dart';

import '../widgets/card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLiked = false;
  bool notificationOpen = false;

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
                GestureDetector(
                    onTap: () => setState(() {
                          notificationOpen = !notificationOpen;
                        }),
                    child: notificationOpen
                        ? const Icon(Icons.notifications, size: 32)
                        : const Icon(Icons.notifications_none_sharp, size: 32)),
                const SizedBox(width: 16),
                GestureDetector(
                  onTap: () {
                    setState(() {});
                    isLiked = !isLiked;
                  },
                  child: isLiked
                      ? Icon(
                          Icons.favorite,
                          size: 32,
                          color: AppColor.errorColor,
                        )
                      : const Icon(Icons.favorite_border, size: 32),
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
              padding: const EdgeInsets.symmetric(horizontal: 35),
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
            SizedBox(
              height: 300,
              child: Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => AppSize.sizeWidth20,
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => CardWidget(
                    image: Image.asset(GlobalAssets.card_1),
                    price: "12",
                    rated: "4.6",
                    text: "Rubber fig Plant",
                  ),
                ),
              ),
            ),
            // Widget slide() {
            // return
            SizedBox(
              height: MediaQuery.of(context).size.width / 4,
              width: MediaQuery.of(context).size.width * 1,
              // child: CarouselSlider(
              //   items: [
              //     ExactAssetImage("images/01.jpg"),
              //     ExactAssetImage("images/02.jpg"),
              //     ExactAssetImage('images/03.jpg'),
              //     ExactAssetImage("images/04.jpg"),
              //     ExactAssetImage("images/05.jpg"),
              //     ExactAssetImage('images/06.jpg')
              //   ],
              // ),
            )
          ],
        ),
      ),
    );
  }
}

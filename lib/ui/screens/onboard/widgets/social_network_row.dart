import 'package:flutter/material.dart';
import 'package:plant_ecommerce/constants/sizedbox.dart';

import '../../../../styles/colors/app_colors.dart';
import '../../../../global/global_assets/global_assets.dart';

class SocialNetwork extends StatelessWidget {
  const SocialNetwork({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        socialNetworkRow(
          widget: Icon(
            Icons.facebook_rounded,
            color: AppColor.focusColor,
            size: 36,
          ),
          onTap: () {},
        ),
        socialNetworkRow(
          widget: Image.asset(GlobalAssets.google),
          onTap: () {},
        ),
        socialNetworkRow(
          widget: Icon(
            Icons.apple,
            size: 36,
            color: AppColor.textColor,
          ),
          onTap: () {},
        ),
      ],
    );
  }
}

Widget socialNetworkRow({void Function()? onTap, required Widget widget}) {
  return Expanded(
    child: Padding(
      padding: AppSize.paddingAll3,
      child: OutlinedButton(
        onPressed: onTap,
        child: widget,
      ),
    ),
  );
}

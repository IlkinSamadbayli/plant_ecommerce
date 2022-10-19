import 'package:flutter/material.dart';

class SocialNetwork extends StatelessWidget {
  const SocialNetwork({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

Widget socialNetworkRow({void Function()? onTap, required Widget widget}) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.all(3.0),
      child: OutlinedButton(
        onPressed: onTap,
        child: widget,
      ),
    ),
  );
}

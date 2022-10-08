import 'package:flutter/material.dart';

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

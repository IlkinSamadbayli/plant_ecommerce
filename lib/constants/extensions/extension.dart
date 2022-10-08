import 'package:flutter/material.dart';

extension Contex on BuildContext {
  dynamic get snackbarErrorMessage =>
      ScaffoldMessenger.of(this).showSnackBar(snackBar);

  dynamic get snackBar => SnackBar(
        content: const Text("Error"),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {},
        ),
      );
}

import 'package:flutter/material.dart';

/// Deniz ShowSnackBar
abstract class Snackbar {
  /// Be Default shows *[Connection Error SnackBar]*
  static void show(
    BuildContext? context, {
    SnackBar? snackBar,
  }) {
    if (context != null) {
      snackBar ??= SnackBar(
        content: const Text('Connection Error'),
        action: SnackBarAction(
          label: 'Okay',
          onPressed: () {},
        ),
      );

      final messenger = ScaffoldMessenger.of(context);

      messenger.hideCurrentSnackBar();
      messenger.showSnackBar(snackBar);
    }
  }
}

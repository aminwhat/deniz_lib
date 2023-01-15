import 'package:deniz_lib/src/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

part 'string.dart';

abstract class DenizExtensions {
  static Future<void> urlLauncher(String url, {BuildContext? context}) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      if (context != null) {
        Snackbar.show(
          context,
          snackBar: SnackBar(
            content: SnackBar(
              content: Text('Couldn\'t open $uri'),
              action: SnackBarAction(
                label: 'Okay',
                onPressed: () {},
              ),
            ),
          ),
        );
      } else {
        Fluttertoast.showToast(
          msg: "Could not open $url ",
        );
      }
    }
  }
}

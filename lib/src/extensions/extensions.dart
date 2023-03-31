import 'package:deniz_lib/src/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

part 'string.dart';

abstract class DenizExtensions {
  static Future<void> urlLauncher(
    String url, {
    BuildContext? context,
    Function(Uri uri)? onError,
  }) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      if (context != null) {
        onError?.call(uri) ??
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

  static Future<void> emailLauncher(
    String email,
    String subject,
    String body, {
    BuildContext? context,
    Function(Uri uri)? onError,
  }) async {
    await urlLauncher(
      'mailto:$email?subject=$subject&body=$body',
      context: context,
      onError: onError,
    );
  }

  static Future<void> telLauncher(
    String phoneNumber, {
    BuildContext? context,
    Function(Uri uri)? onError,
  }) async {
    await urlLauncher(
      'tel:$phoneNumber',
      context: context,
      onError: onError,
    );
  }

  static Future<void> smsLauncher(
    String phoneNumber, {
    BuildContext? context,
    Function(Uri uri)? onError,
  }) async {
    await urlLauncher(
      'sms:$phoneNumber',
      context: context,
      onError: onError,
    );
  }

  static Future<void> fileLauncher(
    String path, {
    BuildContext? context,
    Function(Uri uri)? onError,
  }) async {
    await urlLauncher(
      'file:$path',
      context: context,
      onError: onError,
    );
  }
}

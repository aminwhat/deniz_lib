import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:window_manager/window_manager.dart';

class Init {
  static void setMobileVertical() {
    if (Platform.isAndroid || Platform.isIOS) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
  }

  static Future<void> setWindowsSize({
    Size minSize = const Size(1200, 600),
    Size maxSize = const Size(1200, 600),
  }) async {
    if (Platform.isWindows) {
      await windowManager.ensureInitialized();
      WindowManager.instance.setMinimumSize(minSize);
      WindowManager.instance.setMaximumSize(maxSize);
    }
  }

  static void ensureInitialized() {
    WidgetsFlutterBinding.ensureInitialized();
  }
}

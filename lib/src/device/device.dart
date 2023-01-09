import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';

typedef DeviceInfo = Map<String, dynamic>;

extension AminAndroidBuildVersion on AndroidBuildVersion {
  Map<String, dynamic> asMap() {
    return {
      'baseOS': baseOS,
      'sdkInt': sdkInt,
      'release': release,
      'codename': codename,
      'incremental': incremental,
      'previewSdkInt': previewSdkInt,
      'securityPatch': securityPatch,
    };
  }
}

extension AminIosUtsname on IosUtsname {
  Map<String, dynamic> asMap() {
    return {
      'machine': machine,
      'nodename': nodename,
      'release': release,
      'sysname': sysname,
      'version': version,
    };
  }
}

abstract class Device {
  static Future<DeviceInfo> getDeviceInfo() async {
    late final Map<String, dynamic> value;
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      value = {
        'Platform': 'Android',
        'Collected': {
          'Board': androidInfo.board,
          'BootLoader': androidInfo.bootloader,
          'Brand': androidInfo.brand,
          'Device': androidInfo.device,
          'Display': androidInfo.display,
          'DisplayMetrics': androidInfo.displayMetrics.toMap(),
          'Fingerprint': androidInfo.fingerprint,
          'Hardware': androidInfo.hardware,
          'Host': androidInfo.host,
          'DeviceId': androidInfo.id,
          'IsPhysicalDevice': androidInfo.isPhysicalDevice,
          'Manufacturer': androidInfo.manufacturer,
          'Model': androidInfo.model,
          'Product': androidInfo.product,
          'Supported32BitAbis': androidInfo.supported32BitAbis,
          'Supported64BitAbis': androidInfo.supported64BitAbis,
          'SupportedAbis': androidInfo.supportedAbis,
          'SystemFeatures': androidInfo.systemFeatures,
          'Tags': androidInfo.tags,
          'Type': androidInfo.type,
          'AndroidBuildVersion': androidInfo.version.asMap(),
        },
        'Data': androidInfo.data,
      };
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      value = {
        'Platform': 'Ios',
        'Collected': {
          'IdentifierForVendor': iosInfo.identifierForVendor,
          'IsPhysicalDevice': iosInfo.isPhysicalDevice,
          'LocalizedModel': iosInfo.localizedModel,
          'Model': iosInfo.model,
          'Name': iosInfo.name,
          'SystemName': iosInfo.systemName,
          'SystemVersion': iosInfo.systemVersion,
          'Utsname': iosInfo.utsname.asMap(),
        },
        'Data': iosInfo.data,
      };
    } else {
      final allInfo = await deviceInfo.deviceInfo;
      value = {
        'Platform': 'Unknown',
        'Data': allInfo.data,
      };
    }

    return value;
  }
}

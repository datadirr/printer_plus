import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'printer_plus_platform_interface.dart';

/// An implementation of [PrinterPlusPlatform] that uses method channels.
class MethodChannelPrinterPlus extends PrinterPlusPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('printer_plus');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }
}

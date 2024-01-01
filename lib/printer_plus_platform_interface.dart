import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'printer_plus_method_channel.dart';

abstract class PrinterPlusPlatform extends PlatformInterface {
  /// Constructs a PrinterPlusPlatform.
  PrinterPlusPlatform() : super(token: _token);

  static final Object _token = Object();

  static PrinterPlusPlatform _instance = MethodChannelPrinterPlus();

  /// The default instance of [PrinterPlusPlatform] to use.
  ///
  /// Defaults to [MethodChannelPrinterPlus].
  static PrinterPlusPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PrinterPlusPlatform] when
  /// they register themselves.
  static set instance(PrinterPlusPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}

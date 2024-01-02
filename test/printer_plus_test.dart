import 'package:flutter_test/flutter_test.dart';
import 'package:printer_plus/printer_plus.dart';
import 'package:printer_plus/printer_plus_platform_interface.dart';
import 'package:printer_plus/printer_plus_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPrinterPlusPlatform
    with MockPlatformInterfaceMixin
    implements PrinterPlusPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PrinterPlusPlatform initialPlatform = PrinterPlusPlatform.instance;

  test('$MethodChannelPrinterPlus is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPrinterPlus>());
  });

  test('getPlatformVersion', () async {
    PrinterPlus printerPlusPlugin = PrinterPlus();
    MockPrinterPlusPlatform fakePlatform = MockPrinterPlusPlatform();
    PrinterPlusPlatform.instance = fakePlatform;

    expect(await printerPlusPlugin.getPlatformVersion(), '42');
  });
}

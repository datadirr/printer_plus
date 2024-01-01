
import 'printer_plus_platform_interface.dart';

class PrinterPlus {
  Future<String?> getPlatformVersion() {
    return PrinterPlusPlatform.instance.getPlatformVersion();
  }
}

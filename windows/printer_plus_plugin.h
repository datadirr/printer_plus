#ifndef FLUTTER_PLUGIN_PRINTER_PLUS_PLUGIN_H_
#define FLUTTER_PLUGIN_PRINTER_PLUS_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace printer_plus {

class PrinterPlusPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  PrinterPlusPlugin();

  virtual ~PrinterPlusPlugin();

  // Disallow copy and assign.
  PrinterPlusPlugin(const PrinterPlusPlugin&) = delete;
  PrinterPlusPlugin& operator=(const PrinterPlusPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace printer_plus

#endif  // FLUTTER_PLUGIN_PRINTER_PLUS_PLUGIN_H_

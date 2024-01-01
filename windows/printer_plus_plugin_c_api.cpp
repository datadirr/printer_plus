#include "include/printer_plus/printer_plus_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "printer_plus_plugin.h"

void PrinterPlusPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  printer_plus::PrinterPlusPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}

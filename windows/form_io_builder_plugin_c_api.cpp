#include "include/form_io_builder/form_io_builder_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "form_io_builder_plugin.h"

void FormIoBuilderPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  form_io_builder::FormIoBuilderPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}

//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <file_selector_windows/file_selector_windows.h>
#include <form_io_builder/form_io_builder_plugin_c_api.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  FileSelectorWindowsRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FileSelectorWindows"));
  FormIoBuilderPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FormIoBuilderPluginCApi"));
}

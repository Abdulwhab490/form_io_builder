#ifndef FLUTTER_PLUGIN_FORM_IO_BUILDER_PLUGIN_H_
#define FLUTTER_PLUGIN_FORM_IO_BUILDER_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace form_io_builder {

class FormIoBuilderPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  FormIoBuilderPlugin();

  virtual ~FormIoBuilderPlugin();

  // Disallow copy and assign.
  FormIoBuilderPlugin(const FormIoBuilderPlugin&) = delete;
  FormIoBuilderPlugin& operator=(const FormIoBuilderPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace form_io_builder

#endif  // FLUTTER_PLUGIN_FORM_IO_BUILDER_PLUGIN_H_

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'form_io_builder_method_channel.dart';

abstract class FormIoBuilderPlatform extends PlatformInterface {
  /// Constructs a FormIoBuilderPlatform.
  FormIoBuilderPlatform() : super(token: _token);

  static final Object _token = Object();

  static FormIoBuilderPlatform _instance = MethodChannelFormIoBuilder();

  /// The default instance of [FormIoBuilderPlatform] to use.
  ///
  /// Defaults to [MethodChannelFormIoBuilder].
  static FormIoBuilderPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FormIoBuilderPlatform] when
  /// they register themselves.
  static set instance(FormIoBuilderPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}

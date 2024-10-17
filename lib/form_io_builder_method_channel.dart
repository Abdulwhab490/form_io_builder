import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'form_io_builder_platform_interface.dart';

/// An implementation of [FormIoBuilderPlatform] that uses method channels.
class MethodChannelFormIoBuilder extends FormIoBuilderPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('form_io_builder');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}

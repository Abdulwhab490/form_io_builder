import 'package:flutter_test/flutter_test.dart';
import 'package:form_io_builder/form_io_builder.dart';
import 'package:form_io_builder/form_io_builder_platform_interface.dart';
import 'package:form_io_builder/form_io_builder_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFormIoBuilderPlatform
    with MockPlatformInterfaceMixin
    implements FormIoBuilderPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FormIoBuilderPlatform initialPlatform = FormIoBuilderPlatform.instance;

  test('$MethodChannelFormIoBuilder is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFormIoBuilder>());
  });

  test('getPlatformVersion', () async {
    FormIoBuilder formIoBuilderPlugin = FormIoBuilder('','');
    MockFormIoBuilderPlatform fakePlatform = MockFormIoBuilderPlatform();
    FormIoBuilderPlatform.instance = fakePlatform;

    expect(await formIoBuilderPlugin.getPlatformVersion(), '42');
  });
}

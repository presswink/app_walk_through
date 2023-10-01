import 'package:flutter_test/flutter_test.dart';
import 'package:app_walk_through/app_walk_through.dart';
import 'package:app_walk_through/app_walk_through_platform_interface.dart';
import 'package:app_walk_through/app_walk_through_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAppWalkThroughPlatform
    with MockPlatformInterfaceMixin
    implements AppWalkThroughPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AppWalkThroughPlatform initialPlatform = AppWalkThroughPlatform.instance;

  test('$MethodChannelAppWalkThrough is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAppWalkThrough>());
  });

  test('getPlatformVersion', () async {
    AppWalkThrough appWalkThroughPlugin = AppWalkThrough();
    MockAppWalkThroughPlatform fakePlatform = MockAppWalkThroughPlatform();
    AppWalkThroughPlatform.instance = fakePlatform;

    expect(await appWalkThroughPlugin.getPlatformVersion(), '42');
  });
}

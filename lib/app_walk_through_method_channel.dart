import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'app_walk_through_platform_interface.dart';

/// An implementation of [AppWalkThroughPlatform] that uses method channels.
class MethodChannelAppWalkThrough extends AppWalkThroughPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('app_walk_through');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}

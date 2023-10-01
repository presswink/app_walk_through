import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'app_walk_through_method_channel.dart';

abstract class AppWalkThroughPlatform extends PlatformInterface {
  /// Constructs a AppWalkThroughPlatform.
  AppWalkThroughPlatform() : super(token: _token);

  static final Object _token = Object();

  static AppWalkThroughPlatform _instance = MethodChannelAppWalkThrough();

  /// The default instance of [AppWalkThroughPlatform] to use.
  ///
  /// Defaults to [MethodChannelAppWalkThrough].
  static AppWalkThroughPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AppWalkThroughPlatform] when
  /// they register themselves.
  static set instance(AppWalkThroughPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}

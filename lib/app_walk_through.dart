
import 'app_walk_through_platform_interface.dart';

class AppWalkThrough {
  Future<String?> getPlatformVersion() {
    return AppWalkThroughPlatform.instance.getPlatformVersion();
  }
}

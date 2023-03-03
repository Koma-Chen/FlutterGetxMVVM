import 'package:flutterdemo/config/EnvConfig.dart';
import 'package:flutter/foundation.dart' as Foundation;

class Config {
  /// 当前是否是debug模式
  static bool isDebug =
      Foundation.kDebugMode || EnvConfig.BUILD_TYPE == BuildType.dev.value;
}

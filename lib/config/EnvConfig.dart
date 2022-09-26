class EnvConfig {
  /// flutter build apk/run --dart-define=BUILD_TYPE=prod
  static const BUILD_TYPE =
      String.fromEnvironment('BUILD_TYPE', defaultValue: "dev");
}

enum BuildType { dev, test, prod }

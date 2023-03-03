/// flutter build apk/run --dart-define=BUILD_TYPE=prod
class EnvConfig {
  static const BUILD_TYPE =
      String.fromEnvironment('BUILD_TYPE', defaultValue: "dev");
}

enum BuildType {
  dev(value: "dev"),
  prod(value: "prod");

  final String value;

  const BuildType({
    required this.value,
  });
}

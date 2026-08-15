class AppConfig {
  static const String backendUrl = String.fromEnvironment(
    'Backend_URL',
    defaultValue: 'http://192.168.1.37:8000',
  );
}

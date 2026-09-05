import 'environment.dart';
import 'flavor.dart';

class AppConfig {
  const AppConfig({
    required this.environment,
    required this.flavor,
    required this.baseUrl,
    required this.aiBaseUrl,
  });

  final Environment environment;
  final Flavor flavor;
  final String baseUrl;
  final String aiBaseUrl;

  static const String _environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: 'development',
  );

  static const String _apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://jpb8m13w-8002.inc1.devtunnels.ms/api/v1',
  );

  static const String _aiBaseUrl = String.fromEnvironment(
    'AI_BASE_URL',
    defaultValue: 'https://5fvxbpgr-8000.inc1.devtunnels.ms',
  ); // when change, run:  --dart-define=AI_BASE_URL=https://your-ai-production-url

  static AppConfig get current {
    final environment = Environment.fromString(_environment);

    return AppConfig(
      environment: environment,
      flavor: _flavorFromEnvironment(environment),
      baseUrl: _apiBaseUrl,
      aiBaseUrl: _aiBaseUrl,
    );
  }

  static Flavor _flavorFromEnvironment(Environment environment) {
    switch (environment) {
      case Environment.development:
        return Flavor.development;

      case Environment.staging:
        return Flavor.staging;

      case Environment.production:
        return Flavor.production;
    }
  }

  bool get isDevelopment => environment == Environment.development;

  bool get isStaging => environment == Environment.staging;

  bool get isProduction => environment == Environment.production;
}

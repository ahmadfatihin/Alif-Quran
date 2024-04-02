import 'package:envied/envied.dart';
import 'package:injectable/injectable.dart';

part 'env.g.dart';

///Required Environment
///Available env params:
/// - `prod` for production
/// - `dev` for development
/// - `staging` for testing
const currentEnv = Environment.dev;

@Envied(
    path: currentEnv == "prod"
        ? '.env.production'
        : currentEnv == "dev"
            ? '.env.dev'
            : '.env.staging')
abstract class Env {
  @EnviedField(obfuscate: true, varName: 'BASE_ENDPOINT')
  static String baseEndpoint = _Env.baseEndpoint;
  @EnviedField(obfuscate: true, varName: 'API_KEY')
  static String apiKey = _Env.apiKey;
  @EnviedField(obfuscate: true, varName: 'SHOW_DEBUG_INFO')
  static bool showDebugInfo = _Env.showDebugInfo;
}

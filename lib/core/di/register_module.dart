import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

//Module required to register that our service depends on
@module
abstract class RegisterModule {
  Connectivity get connectivity => Connectivity();
  Logger get logger => Logger();
}

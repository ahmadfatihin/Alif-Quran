import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../env/env.dart';

//Module required to register that our service depends on
@module
abstract class RegisterModule {
  Geolocator get geolocation => Geolocator();
  Connectivity get connectivity => Connectivity();
  Logger get logger => Logger();

  //HTTP
  @Named('base')
  Dio dio() => Dio(BaseOptions(baseUrl: Env.baseEndpoint));
  @Named('client')
  Dio dioClient() => Dio(BaseOptions(baseUrl: Env.baseEndpoint));

  @Named("show_debug")
  bool get showDebug => Env.showDebugInfo;
}

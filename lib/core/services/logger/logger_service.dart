import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import '../../env/env.dart';

abstract class LoggerService {
  void debug({required String message});
  void error({required dynamic error, required StackTrace stackTrace});
  void info({required String message});
  void trace({required String message});
  void warning({required String message});
}

@LazySingleton(as: LoggerService)
class LoggerServiceImpl implements LoggerService {
  final Logger logger;
  final bool _showDebug;

  LoggerServiceImpl(
      {required this.logger, @Named("show_debug") bool? showDebug})
      : _showDebug = showDebug ?? Env.showDebugInfo;

  @override
  void debug({required String message}) {
    if (_showDebug) {
      logger.d(message);
    }
  }

  @override
  void error({required dynamic error, required StackTrace stackTrace}) {
    if (_showDebug) {
      logger.e(error.toString(), error: error, stackTrace: stackTrace);
    }
  }

  @override
  void info({required String message}) {
    if (_showDebug) {
      logger.i(message);
    }
  }

  @override
  void trace({required String message}) {
    if (_showDebug) {
      logger.t(message);
    }
  }

  @override
  void warning({required String message}) {
    if (_showDebug) {
      logger.w(message);
    }
  }
}

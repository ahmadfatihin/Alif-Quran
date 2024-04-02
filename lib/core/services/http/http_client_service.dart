import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../env/env.dart';
import '../../exceptions/app_exceptions.dart';
import '../logger/logger_service.dart';
import 'internet_connection_service.dart';

abstract class HttpClientService {
  Future<Response> get({
    required String path,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });
  Future<Response> post({
    required String path,
    required dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });
  Future<Response> put({
    required String path,
    required dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });
  Future<Response> patch({
    required String path,
    required dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });
  Future<Response> delete({
    required String path,
    required dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });
}

@Named('base')
@LazySingleton(as: HttpClientService)
class HttpClientServiceImpl implements HttpClientService {
  final Dio dio;
  final InternetConnectionService internetConnectionService;
  final LoggerService loggerService;

  HttpClientServiceImpl({
    @Named('base') required this.dio,
    required this.internetConnectionService,
    required this.loggerService,
  }) {
    if (Env.showDebugInfo) {
      dio.interceptors.addAll([
        PrettyDioLogger(
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          requestHeader: true,
          compact: false,
        )
      ]);
    }
  }

  @override
  Future<Response> delete({
    required String path,
    required data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      await internetConnectionService.checkConnectivityState();

      final response = await dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

      return response;
    } on InternetConnectionException catch (e, trace) {
      loggerService.error(error: e, stackTrace: trace);
      rethrow;
    } on DioException catch (e, trace) {
      loggerService.error(error: e, stackTrace: trace);
      throw ServerException(
        message: (e.response?.statusCode).toString(),
        code: e.toString(),
        error: e.response?.data,
      );
    }
  }

  @override
  Future<Response> get({
    required String path,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      await internetConnectionService.checkConnectivityState();

      final response = await dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );

      return response;
    } on InternetConnectionException catch (e, trace) {
      loggerService.error(error: e, stackTrace: trace);
      rethrow;
    } on DioException catch (e, trace) {
      loggerService.error(error: e, stackTrace: trace);
      throw ServerException(
        message: (e.response?.statusCode).toString(),
        code: e.toString(),
        error: e.response?.data,
      );
    }
  }

  @override
  Future<Response> patch({
    required String path,
    required data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      await internetConnectionService.checkConnectivityState();

      final response = await dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

      return response;
    } on InternetConnectionException catch (e, trace) {
      loggerService.error(error: e, stackTrace: trace);
      rethrow;
    } on DioException catch (e, trace) {
      loggerService.error(error: e, stackTrace: trace);
      throw ServerException(
        message: (e.response?.statusCode).toString(),
        code: e.toString(),
        error: e.response?.data,
      );
    }
  }

  @override
  Future<Response> post({
    required String path,
    required data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      await internetConnectionService.checkConnectivityState();

      final response = await dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

      return response;
    } on InternetConnectionException catch (e, trace) {
      loggerService.error(error: e, stackTrace: trace);
      rethrow;
    } on DioException catch (e, trace) {
      loggerService.error(error: e, stackTrace: trace);

      throw ServerException(
        code: '${e.response?.statusCode ?? ''}',
        error: e.response?.data,
      );
    }
  }

  @override
  Future<Response> put({
    required String path,
    required data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      await internetConnectionService.checkConnectivityState();

      final response = await dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

      return response;
    } on InternetConnectionException catch (e, trace) {
      loggerService.error(error: e, stackTrace: trace);
      rethrow;
    } on DioException catch (e, trace) {
      loggerService.error(error: e, stackTrace: trace);
      throw ServerException(
        message: (e.response?.statusCode).toString(),
        code: e.toString(),
        error: e.response?.data,
      );
    }
  }
}

@Named('client')
@LazySingleton(as: HttpClientService)
class HttpClientServiceImplClient extends HttpClientServiceImpl {
  HttpClientServiceImplClient({
    @Named('client') required super.dio,
    required super.internetConnectionService,
    required super.loggerService,
  });
}

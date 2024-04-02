import 'package:equatable/equatable.dart';

abstract class AppException extends Equatable implements Exception {
  final String code;
  final String message;

  const AppException({required this.code, required this.message});

  @override
  List<Object> get props => [code, message];
}

class DefaultAppException extends AppException {
  const DefaultAppException({
    super.message = '',
    super.code = 'DEFAULT_APP_EXCEPTION',
  });
}

class InternetConnectionException extends AppException {
  const InternetConnectionException({
    super.message = 'INTERNET_CONNECTION_ERROR',
    super.code = 'INTERNET_CONNECTION_EXCEPTION',
  });
}

class ServerException extends AppException {
  final dynamic error;
  const ServerException({
    super.message = 'SERVER_ERROR',
    super.code = 'SERVER_EXCEPTION',
    this.error,
  });
}

class LocalStorageException extends AppException {
  const LocalStorageException({
    super.message = 'LOCAL_STORAGE_ERROR',
    super.code = 'LOCAL_STORAGE_EXCEPTION',
  });
}

class FiscalException extends AppException {
  const FiscalException({
    super.message = 'FISCAL_ERROR',
    super.code = 'FISCALIZATION_EXCEPTION',
  });
}

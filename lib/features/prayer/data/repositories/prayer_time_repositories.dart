import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/core.dart';
import '../datasources/prayer_time_datasources.dart';
import '../models/prayer_time_model.dart';

abstract class PrayerTimeRepositories {
  Future<Either<AppException, PrayerTimeModel>> getPrayerTimes(
      String city, String country);
}

@LazySingleton(as: PrayerTimeRepositories)
class PrayerTimeRepositoriesImpl implements PrayerTimeRepositories {
  final PrayerTimeDatasources remoteDataSource;

  PrayerTimeRepositoriesImpl(this.remoteDataSource);

  @override
  Future<Either<AppException, PrayerTimeModel>> getPrayerTimes(
      String city, String country) async {
    try {
      final result = await remoteDataSource.getPrayerTimes(city, country);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerException(code: e.code, message: e.message));
    } on InternetConnectionException catch (e) {
      return Left(
          InternetConnectionException(code: e.code, message: e.message));
    } on DefaultAppException catch (e) {
      return Left(DefaultAppException(code: e.code, message: e.message));
    } catch (e) {
      return Left(
          DefaultAppException(message: 'An unexpected error occurred: $e'));
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/core.dart';
import '../../data/models/prayer_time_model.dart';
import '../../data/repositories/prayer_time_repositories.dart';

@lazySingleton
class GetPrayerTimes {
  final PrayerTimeRepositories repository;
  GetPrayerTimes(this.repository);
  Future<Either<AppException, PrayerTimeModel>> call(
      String city, String country) {
    return repository.getPrayerTimes(city, country);
  }
}

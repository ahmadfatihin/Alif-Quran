import 'package:injectable/injectable.dart';
import '../../../../core/core.dart';
import '../models/prayer_time_model.dart';

abstract class PrayerTimeDatasources {
  Future<PrayerTimeModel> getPrayerTimes(String city, String country);
}

@LazySingleton(as: PrayerTimeDatasources)
class PrayerTimeDatasourcesImpl implements PrayerTimeDatasources {
  final HttpClientService httpClientService;

  PrayerTimeDatasourcesImpl({@Named('base') required this.httpClientService});

  @override
  Future<PrayerTimeModel> getPrayerTimes(String city, String country) async {
    try {
      final response = await httpClientService.get(
        path:
            'https://api.aladhan.com/v1/timingsByCity?city=$city&country=$country',
      );

      return PrayerTimeModel.fromJson(response.data);
    } catch (e) {
      throw ServerException(
        error: e.toString(),
        message: 'An error occurred: $e',
      );
    }
  }
}

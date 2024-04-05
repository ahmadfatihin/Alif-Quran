import 'package:alif_quran/core/services/geolocation/city_detail_object.dart';
import 'package:alif_quran/core/services/geolocation/geolocation_service.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';

@lazySingleton
class GetLocationData {
  final GeolocationService geoService;

  GetLocationData({required this.geoService});

  Future<Either<AppException, CityDetail>> call() async {
    try {
      final currentPosition = await geoService.getCurrentPosition();

      final result = await geoService.getCityDetails(currentPosition);

      return Right(result);
    } on AppException catch (ex) {
      return Left(ex);
    }
  }
}

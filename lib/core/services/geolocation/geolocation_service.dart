import 'dart:async';

import 'package:alif_quran/core/exceptions/app_exceptions.dart';
import 'package:alif_quran/core/services/geolocation/city_detail_object.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: GeolocationService)
class GeolocationServiceImpl implements GeolocationService {
  @override
  Future<Position> getCurrentPosition() async {
    try {
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    } on TimeoutException catch (e) {
      throw DefaultAppException(
        message: 'TimeoutException: ${e.message}',
      );
    } catch (_) {
      throw const DefaultAppException();
    }
  }

  @override
  Future<CityDetail> getCityDetails(Position position) async {
    try {
      final List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      Placemark place = placemarks[0];
      return CityDetail(
          subAdministrativeArea: place.subAdministrativeArea ?? "-",
          locality: place.locality ?? "-");
    } on TimeoutException catch (e) {
      throw DefaultAppException(
        message: 'TimeoutException: ${e.message}',
      );
    } catch (_) {
      throw const DefaultAppException();
    }
  }
}

abstract class GeolocationService {
  Future<Position> getCurrentPosition();
  Future<CityDetail> getCityDetails(Position position);
}

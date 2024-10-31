import 'dart:async';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

import 'package:intl/intl.dart';

import '../../core.dart';
import 'city_detail.dart';

@LazySingleton(as: GeolocationService)
class GeolocationServiceImpl implements GeolocationService {
  @override
  Future<Position> getCurrentPosition() async {
    try {
      LocationSettings locationSettings = const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      );

      return await Geolocator.getCurrentPosition(
        locationSettings: locationSettings,
      );
    } on TimeoutException catch (e) {
      throw DefaultAppException(
        message: 'TimeoutException: ${e.message}',
      );
    } catch (e) {
      throw DefaultAppException(
          message: 'Error retrieving location: ${e.toString()}');
    }
  }

  @override
  Future<CityDetail> getCityDetails(Position position) async {
    try {
      final List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isEmpty) {
        throw const DefaultAppException(message: 'No placemarks found');
      }

      final Placemark place = placemarks[0];
      final String subAdministrativeArea =
          place.subAdministrativeArea ?? "Unknown Area";
      final String locality = place.locality ?? "Unknown Location";
      final String country = place.country ?? "Unknown Country";

      if (locality.isEmpty) {
        throw const DefaultAppException(message: 'Locality is empty');
      }

      // Ambil tanggal saat ini
      final now = DateTime.now();
      final formattedDate = DateFormat('dd').format(now);
      final formattedMonth = DateFormat('MMMM').format(now);
      final formattedYear = DateFormat('yyyy').format(now);

      return CityDetail(
        subAdministrativeArea: subAdministrativeArea,
        locality: locality,
        country: country,
        date: formattedDate,
        month: formattedMonth,
        year: formattedYear,
      );
    } on TimeoutException catch (e) {
      throw DefaultAppException(
        message: 'TimeoutException: ${e.message}',
      );
    } catch (e) {
      throw DefaultAppException(
          message: 'Error retrieving city details: ${e.toString()}');
    }
  }
}

abstract class GeolocationService {
  Future<Position> getCurrentPosition();
  Future<CityDetail> getCityDetails(Position position);
}

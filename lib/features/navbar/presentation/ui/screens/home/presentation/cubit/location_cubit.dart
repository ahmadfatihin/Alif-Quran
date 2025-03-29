import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../core/core.dart';
import '../../domain/usecases/get_location_data.dart';
import '../../../../../../../../core/services/geolocation/city_detail.dart';

part 'location_state.dart';
part 'location_cubit.freezed.dart';

@singleton
class LocationCubit extends Cubit<LocationState> {
  final GetLocationData getLocationData;
  CityDetail? _cachedCityDetail;

  LocationCubit({required this.getLocationData})
      : super(const LocationState.initial());

  Future<void> fetchLocation() async {
    if (_cachedCityDetail != null) {
      emit(LocationState.success(_cachedCityDetail!));
      return; // Mengembalikan data dari cache jika tersedia
    }

    emit(const LocationState.loading());

    final result = await getLocationData();

    result.fold(
      (error) {
        emit(LocationState.error(error));
      },
      (cityDetail) {
        _cachedCityDetail = cityDetail; // Simpan data ke cache
        emit(LocationState.success(cityDetail));
      },
    );
  }

  // Tambahkan metode untuk menghapus cache jika diperlukan
  void clearCache() {
    _cachedCityDetail = null;
  }
}

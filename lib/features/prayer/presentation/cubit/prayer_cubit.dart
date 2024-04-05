import 'package:alif_quran/core/services/geolocation/city_detail_object.dart';
import 'package:alif_quran/features/prayer/domain/usecases/get_location_data.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'prayer_state.dart';
part 'prayer_cubit.freezed.dart';

class PrayerCubit extends Cubit<PrayerState> {
  late GetLocationData getLocationData;
  PrayerCubit({
    required this.getLocationData,
  }) : super(const PrayerState.initial());

  void getLocation() async {
    emit(const PrayerState.loading());
    final result = await getLocationData();
    result.fold(
      (error) => emit(const PrayerState.error()),
      (result) => emit(PrayerState.success(cityDetail: result)),
    );
  }
}

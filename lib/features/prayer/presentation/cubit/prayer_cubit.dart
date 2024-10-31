import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/core.dart';
import '../../../../core/services/geolocation/geolocation_service.dart';
import '../../data/models/prayer_time_model.dart';
import '../../domain/usecases/get_prayer_time.dart';

part 'prayer_state.dart';
part 'prayer_cubit.freezed.dart';

@singleton
class PrayerCubit extends Cubit<PrayerState> {
  final GetPrayerTimes getPrayerTimes;
  final GeolocationService geolocationService;
  bool _isDataFetched = false;

  PrayerCubit(
    this.geolocationService, {
    required this.getPrayerTimes,
  }) : super(const PrayerState.initial());

  void fetchPrayerTime() async {
    if (_isDataFetched) return;

    emit(const PrayerState.loading());

    try {
      final position = await geolocationService.getCurrentPosition();
      final cityDetail = await geolocationService.getCityDetails(position);
      final prayerTimeResult = await getPrayerTimes(
        cityDetail.locality,
        cityDetail.country,
      );

      prayerTimeResult.fold(
        (error) => emit(PrayerState.error(error: error)),
        (prayerTime) {
          _isDataFetched = true; // Tandai data sudah diambil
          emit(PrayerState.success(prayerTime: prayerTime));
        },
      );
    } catch (error) {
      emit(PrayerState.error(
          error: DefaultAppException(message: error.toString())));
    }
  }

  void resetData() {
    _isDataFetched = false;
  }
}

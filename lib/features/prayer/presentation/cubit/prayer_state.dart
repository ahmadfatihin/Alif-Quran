part of 'prayer_cubit.dart';

@freezed
class PrayerState with _$PrayerState {
  const factory PrayerState.initial() = _Initial;
  const factory PrayerState.loading() = _Loading;
  const factory PrayerState.success({required CityDetail cityDetail}) =
      _Success;
  const factory PrayerState.error() = _Error;
}

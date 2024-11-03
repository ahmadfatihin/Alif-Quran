part of 'location_cubit.dart';

@freezed
class LocationState with _$LocationState {
  const factory LocationState.initial() = _Initial;
  const factory LocationState.loading() = _Loading;
  const factory LocationState.success(CityDetail cityDetail) = _Success;
  const factory LocationState.error(AppException error) = _Error;
}

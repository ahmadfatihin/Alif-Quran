part of 'quran_cubit.dart';

@freezed
class QuranState with _$QuranState {
  const factory QuranState.initial() = _Initial;
  const factory QuranState.loading() = _Loading;
  const factory QuranState.success({required SurahModel surahModel}) = _Success;
  const factory QuranState.error({required AppException error}) = _Error;
}

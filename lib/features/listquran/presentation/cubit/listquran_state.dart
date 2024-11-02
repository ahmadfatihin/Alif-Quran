part of 'listquran_cubit.dart';

@freezed
class ListquranState with _$ListquranState {
  const factory ListquranState.initial() = _Initial;
  const factory ListquranState.loading() = _Loading;
  const factory ListquranState.success({required List<ListAyat> listAyat}) =
      _Success;
  const factory ListquranState.error({required AppException error}) = _Error;
}

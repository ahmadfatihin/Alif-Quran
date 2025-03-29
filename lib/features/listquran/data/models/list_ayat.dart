import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_ayat.freezed.dart';
part 'list_ayat.g.dart';

@freezed
class ListAyat with _$ListAyat {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  const factory ListAyat({
    required int nomor,
    required String nama,
    @JsonKey(name: 'nama_latin') required String namaLatin,
    @JsonKey(name: 'jumlah_ayat') required int jumlahAyat,
    @JsonKey(name: 'tempat_turun') required String tempatTurun,
    required String arti,
    required String deskripsi,
    required String audio,
  }) = _ListAyat;

  factory ListAyat.fromJson(Map<String, dynamic> json) =>
      _$ListAyatFromJson(json);
}

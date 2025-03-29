import 'package:freezed_annotation/freezed_annotation.dart';

import 'ayat_model.dart';

part 'surah_model.freezed.dart';
part 'surah_model.g.dart';

@freezed
class SurahModel with _$SurahModel {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  const factory SurahModel({
    required bool status,
    required int nomor,
    required String nama,
    required String namaLatin,
    required int jumlahAyat,
    required String tempatTurun,
    required String arti,
    required String deskripsi,
    required String audio,
    required List<AyatModel> ayat,
    required dynamic nextAyatModel,
    required dynamic suratSebelumnya,
  }) = _SurahModel;

  factory SurahModel.fromJson(Map<String, dynamic> json) =>
      _$SurahModelFromJson(json);
}

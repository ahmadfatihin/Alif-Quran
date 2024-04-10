import 'package:alif_quran/features/quran/data/models/ayat_model.dart';
import 'package:alif_quran/features/quran/data/models/next_ayat_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
    required int jumlahAyat,
    required String namaLatin,
    required String arti,
    required String tempatTurun,
    required String deskripsi,
    required String audio,
    required List<AyatModel> ayat,
    @JsonKey(name: 'surat_selanjutnya') required NextAyatModel nextAyatModel,
    required dynamic suratSebelumnya,
  }) = _SurahModel;

  factory SurahModel.fromJson(Map<String, dynamic> json) =>
      _$SurahModelFromJson(json);
}

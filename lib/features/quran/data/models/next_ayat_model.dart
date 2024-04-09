import 'package:freezed_annotation/freezed_annotation.dart';

part 'next_ayat_model.freezed.dart';
part 'next_ayat_model.g.dart';

@freezed
class NextAyatModel with _$NextAyatModel {
  const factory NextAyatModel({
    required int id,
    @JsonKey(name: 'nomor') required int number,
    @JsonKey(name: 'nama') required String name,
    @JsonKey(name: 'namaLatin') required String latinName,
    @JsonKey(name: 'jumlahAyat') required int verseCount,
    @JsonKey(name: 'tempatTurun') required String placeOfDescent,
    @JsonKey(name: 'arti') required String meaning,
    @JsonKey(name: 'deskripsi') required String description,
    required String audio,
  }) = _NextAyatModel;

  factory NextAyatModel.fromJson(Map<String, dynamic> json) =>
      _$NextAyatModelFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'next_ayat_model.freezed.dart';
part 'next_ayat_model.g.dart';

@freezed
class NextAyatModel with _$NextAyatModel {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  const factory NextAyatModel({
    required int id,
    @JsonKey(name: 'nomor') required int number,
    @JsonKey(name: 'nama') required String name,
    @JsonKey(name: 'nama_latin') required String latinName,
    @JsonKey(name: 'jumlah_ayat') required int verseCount,
    @JsonKey(name: 'tempat_turun') required String placeOfDescent,
    @JsonKey(name: 'arti') required String meaning,
    @JsonKey(name: 'deskripsi') required String description,
    required String audio,
  }) = _NextAyatModel;

  factory NextAyatModel.fromJson(Map<String, dynamic> json) =>
      _$NextAyatModelFromJson(json);
}

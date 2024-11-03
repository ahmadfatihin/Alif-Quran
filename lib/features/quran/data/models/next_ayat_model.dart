import 'package:freezed_annotation/freezed_annotation.dart';

part 'next_ayat_model.freezed.dart';
part 'next_ayat_model.g.dart';

@freezed
class NextAyatModel with _$NextAyatModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory NextAyatModel({
    int? id,
    @JsonKey(name: 'nomor') int? number,
    @JsonKey(name: 'nama') String? name,
    @JsonKey(name: 'nama_latin') String? latinName,
    @JsonKey(name: 'jumlah_ayat') int? verseCount,
    @JsonKey(name: 'tempat_turun') String? placeOfDescent,
    @JsonKey(name: 'arti') String? meaning,
    @JsonKey(name: 'deskripsi') String? description,
    String? audio,
  }) = _NextAyatModel;

  factory NextAyatModel.fromJson(Map<String, dynamic> json) =>
      _$NextAyatModelFromJson(json);
}

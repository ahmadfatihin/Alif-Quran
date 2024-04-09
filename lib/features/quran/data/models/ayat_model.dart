import 'package:freezed_annotation/freezed_annotation.dart';

part 'ayat_model.freezed.dart';
part 'ayat_model.g.dart';

@freezed
class AyatModel with _$AyatModel {
  const factory AyatModel({
    required int id,
    required int surah,
    required int nomor,
    required String ar,
    required String tr,
    required String idn,
  }) = _AyatModel;

  factory AyatModel.fromJson(Map<String, dynamic> json) =>
      _$AyatModelFromJson(json);
}

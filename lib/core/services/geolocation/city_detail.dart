import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_detail.freezed.dart';
part 'city_detail.g.dart';

@freezed
class CityDetail with _$CityDetail {
  const factory CityDetail({
    required String subAdministrativeArea, // Area administratif
    required String locality, // Lokasi/kota
    required String country, // Negara
    required String date, // Tanggal
    required String month, // Bulan
    required String year, // Tahun
  }) = _CityDetail;

  factory CityDetail.fromJson(Map<String, dynamic> json) =>
      _$CityDetailFromJson(json);
}

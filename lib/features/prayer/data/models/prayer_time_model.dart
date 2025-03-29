import 'package:freezed_annotation/freezed_annotation.dart';

part 'prayer_time_model.freezed.dart';
part 'prayer_time_model.g.dart';

@freezed
class PrayerTimeModel with _$PrayerTimeModel {
  const factory PrayerTimeModel({
    required int code,
    required String status,
    required PrayerData data,
  }) = _PrayerTimeModel;

  factory PrayerTimeModel.fromJson(Map<String, dynamic> json) =>
      _$PrayerTimeModelFromJson(json);
}

@freezed
class PrayerData with _$PrayerData {
  const factory PrayerData({
    required Timings timings,
    required DateInfo date,
    required Meta meta,
  }) = _PrayerData;

  factory PrayerData.fromJson(Map<String, dynamic> json) =>
      _$PrayerDataFromJson(json);
}

@freezed
class Timings with _$Timings {
  const factory Timings({
    required String Fajr,
    required String Sunrise,
    required String Dhuhr,
    required String Asr,
    required String Sunset,
    required String Maghrib,
    required String Isha,
    required String Imsak,
    required String Firstthird,
    required String Lastthird,
    required String Midnight,
  }) = _Timings;

  factory Timings.fromJson(Map<String, dynamic> json) =>
      _$TimingsFromJson(json);
}

@freezed
class DateInfo with _$DateInfo {
  const factory DateInfo({
    required String readable,
    required String timestamp,
    required Gregorian gregorian,
    required Hijri hijri,
  }) = _DateInfo;

  factory DateInfo.fromJson(Map<String, dynamic> json) =>
      _$DateInfoFromJson(json);
}

@freezed
class Gregorian with _$Gregorian {
  const factory Gregorian({
    required String date,
    required String format,
    required String day,
    required Weekday weekday,
    required Month month,
    required String year,
    required Designation designation,
  }) = _Gregorian;

  factory Gregorian.fromJson(Map<String, dynamic> json) =>
      _$GregorianFromJson(json);
}

@freezed
class Hijri with _$Hijri {
  const factory Hijri({
    required String date,
    required String format,
    required String day,
    required Weekday weekday,
    required Month month,
    required String year,
    required Designation designation,
    required List<String> holidays,
  }) = _Hijri;

  factory Hijri.fromJson(Map<String, dynamic> json) => _$HijriFromJson(json);
}

@freezed
class Weekday with _$Weekday {
  const factory Weekday({
    required String en,
    String? ar,
  }) = _Weekday;

  factory Weekday.fromJson(Map<String, dynamic> json) =>
      _$WeekdayFromJson(json);
}

@freezed
class Month with _$Month {
  const factory Month({
    required int number,
    required String en,
    String? ar,
  }) = _Month;

  factory Month.fromJson(Map<String, dynamic> json) => _$MonthFromJson(json);
}

@freezed
class Designation with _$Designation {
  const factory Designation({
    required String abbreviated, // Penunjukan singkat (misalnya, "AD")
    required String expanded, // Penunjukan lengkap (misalnya, "Anno Domini")
  }) = _Designation;

  factory Designation.fromJson(Map<String, dynamic> json) =>
      _$DesignationFromJson(json);
}

@freezed
class Meta with _$Meta {
  const factory Meta({
    required double latitude, // Latitude lokasi
    required double longitude, // Longitude lokasi
    required String timezone, // Zona waktu
    required Method method, // Model untuk metode perhitungan waktu sholat
    required String latitudeAdjustmentMethod, // Metode penyesuaian latitude
    required String midnightMode, // Mode tengah malam
    required String school, // Sekolah (metode) yang digunakan
    required Map<String, dynamic> offset, // Model untuk offset waktu sholat
  }) = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}

/// Model untuk metode perhitungan waktu sholat.
@freezed
class Method with _$Method {
  const factory Method({
    required int id, // ID metode
    required String name, // Nama metode
    required Map<String, dynamic> params, // Parameter untuk metode
    required Map<String, dynamic> location,
  }) = _Method;

  factory Method.fromJson(Map<String, dynamic> json) => _$MethodFromJson(json);
}

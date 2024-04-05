import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';

part 'prayer_state.dart';
part 'prayer_cubit.freezed.dart';

class PrayerCubit extends Cubit<PrayerState> {
  PrayerCubit() : super(PrayerState.initial());

  void getLocation() async {
    emit(PrayerState.loading());
    await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    ).then((Position position) {});
  }
}

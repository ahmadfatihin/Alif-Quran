part of 'bottomnav_cubit.dart';

@freezed
class BottomNavState with _$BottomNavState {
  const factory BottomNavState.initial() = _BottomNavInitial;
  const factory BottomNavState.changed(int index) = _BottomNavChanged;
}

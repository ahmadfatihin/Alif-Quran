import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'bottomnav_state.dart';
part 'bottomnav_cubit.freezed.dart';

@singleton
class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(const BottomNavState.initial());

  void changeTab(int index) {
    emit(BottomNavState.changed(index));
  }
}

import 'package:alif_quran/core/core.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quran_state.dart';
part 'quran_cubit.freezed.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit() : super(const QuranState.initial());
}

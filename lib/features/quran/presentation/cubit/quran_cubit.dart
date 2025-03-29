import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../data/models/surah_model.dart';
import '../../domain/usecases/get_quran.dart';

part 'quran_state.dart';
part 'quran_cubit.freezed.dart';

@singleton
class QuranCubit extends Cubit<QuranState> {
  final GetQuran getQuran;
  SurahModel? _cachedSurah; // Cache untuk SurahModel

  QuranCubit(this.getQuran) : super(const QuranState.initial());

  void getQuranData(int id) async {
    // Cek apakah data sudah ada dalam cache
    if (_cachedSurah != null && _cachedSurah!.nomor == id) {
      emit(QuranState.success(surahModel: _cachedSurah!));
      return; // Keluarkan data dari cache
    }

    emit(const QuranState.loading());
    final result = await getQuran(id);
    result.fold((error) {
      emit(QuranState.error(error: error));
    }, (result) {
      _cachedSurah = result; // Simpan data ke cache
      emit(QuranState.success(surahModel: result));
    });
  }

  // Metode untuk menghapus cache jika diperlukan
  void clearCache() {
    _cachedSurah = null;
  }
}

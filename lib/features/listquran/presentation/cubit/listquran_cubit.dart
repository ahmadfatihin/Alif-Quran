import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../data/models/list_ayat.dart';
import '../../domain/usecases/get_list__quran.dart';

part 'listquran_state.dart';
part 'listquran_cubit.freezed.dart';

@singleton
class ListquranCubit extends Cubit<ListquranState> {
  final GetListQuran getListQuran;
  List<ListAyat>? _cachedListAyat;

  ListquranCubit(this.getListQuran) : super(const ListquranState.initial());

  void getListQuranData() async {
    if (_cachedListAyat != null) {
      emit(ListquranState.success(listAyat: _cachedListAyat!));
      return;
    }

    emit(const ListquranState.loading());
    try {
      print("Fetching data from API...");
      final result = await getListQuran();
      result.fold((error) {
        emit(ListquranState.error(error: error));
      }, (result) {
        _cachedListAyat = result;
        emit(ListquranState.success(listAyat: result));
      });
    } catch (e) {
      emit(ListquranState.error(
          error: DefaultAppException(message: e.toString())));
      print("Error fetching data: $e");
    }
  }
}

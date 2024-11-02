import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../data/models/list_ayat.dart';
import '../../domain/usecases/get_list_quran.dart';

part 'listquran_state.dart';
part 'listquran_cubit.freezed.dart';

@singleton
class ListquranCubit extends Cubit<ListquranState> {
  final GetListQuran getListQuran;
  ListquranCubit(this.getListQuran) : super(const ListquranState.initial());
  void getListQuranData() async {
    emit(const ListquranState.loading());
    final result = await getListQuran();
    result.fold((error) {
      emit(ListquranState.error(error: error));
    }, (result) {
      emit(ListquranState.success(listAyat: result));
    });
  }
}

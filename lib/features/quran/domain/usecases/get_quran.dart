import 'package:alif_quran/core/core.dart';
import 'package:alif_quran/features/quran/data/models/surah_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../data/repositories/quran_repositories.dart';

@lazySingleton
class GetQuran {
  final QuranRepository repository;

  GetQuran(this.repository);

  Future<Either<AppException, SurahModel>> call(String id) async {
    return await repository.getQuran(id: id);
  }
}

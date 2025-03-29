import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../data/models/surah_model.dart';
import '../../data/repositories/quran_repositories.dart';

@lazySingleton
class GetQuran {
  final QuranRepository repository;
  GetQuran({required this.repository});
  Future<Either<AppException, SurahModel>> call(int id) async {
    return await repository.getQuran(id: id);
  }
}

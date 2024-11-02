import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../data/models/list_ayat.dart';
import '../../data/repositories/list_quran_repositories.dart';

@lazySingleton
class GetListQuran {
  final ListQuranRepository repository;
  GetListQuran({required this.repository});
  Future<Either<AppException, List<ListAyat>>> call() async {
    return await repository.getListQuran();
  }
}

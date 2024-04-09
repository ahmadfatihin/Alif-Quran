import '../datasources/quran_remote_datasources.dart';
import '../models/surah_model.dart';

abstract class QuranRepository {
  Future<SurahModel> getQuran({required String id});
}

class QuranRepositoryImpl implements QuranRepository {
  final QuranRemoteDataSource quranRemoteDataSource;

  QuranRepositoryImpl({required this.quranRemoteDataSource});

  @override
  Future<SurahModel> getQuran({required String id}) async {
    return await quranRemoteDataSource.getQuran(id: id);
  }
}

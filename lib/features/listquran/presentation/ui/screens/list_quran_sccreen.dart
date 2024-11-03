import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/core.dart';
import '../../../data/models/list_ayat.dart';
import '../../cubit/listquran_cubit.dart';

class ListQuranScreen extends StatefulWidget {
  const ListQuranScreen({super.key});

  @override
  State<ListQuranScreen> createState() => _ListQuranScreenState();
}

class _ListQuranScreenState extends State<ListQuranScreen> {
  @override
  void initState() {
    super.initState();
    final listquranCubit = GetIt.I<ListquranCubit>();
    if (!listquranCubit.isClosed) {
      listquranCubit.state.maybeWhen(
        success: (listAyat) {
          print("Data already cached, no need to fetch again.");
        },
        orElse: () {
          print("Fetching Quran data...");
          listquranCubit.getListQuranData();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListquranCubit, ListquranState>(
      builder: (context, state) {
        print("Current state: $state");
        return state.maybeWhen(
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (listAyat) => Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  context.go('/navbar/home');
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Pallet.white,
                ),
              ),
              title: Center(
                child: Text(
                  'Quran',
                  style: TextStyles.textMdDefault.copyWith(color: Pallet.white),
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: Pallet.white,
                  ),
                ),
              ],
              backgroundColor: Pallet.cyan,
            ),
            body: _buildQuranList(listAyat),
          ),
          error: (error) => Center(
            child: Text('Kesalahan: ${error.message}'),
          ),
          orElse: () => const Center(child: Text('Tidak ada data')),
        );
      },
    );
  }

  Widget _buildQuranList(List<ListAyat> listQuran) {
    return ListView.builder(
      itemCount: listQuran.length,
      itemBuilder: (context, index) {
        return _buildAyatCard(listQuran[index]);
      },
    );
  }

  Widget _buildAyatCard(ListAyat ayat) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          backgroundColor: Pallet.cyan,
          child: Text(
            '${ayat.nomor}',
            style: const TextStyle(color: Colors.white),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(ayat.namaLatin, style: TextStyles.textSmDefault),
                  Text(
                    ayat.arti,
                    style:
                        TextStyles.textSmDefault.copyWith(color: Pallet.grey),
                  ),
                ],
              ),
            ),
            Text(
              ayat.nama,
              style: TextStyles.textLgDefault
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        onTap: () {
          context.go('/quran/${ayat.nomor}');
        },
      ),
    );
  }
}

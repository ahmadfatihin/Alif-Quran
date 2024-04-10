import 'dart:developer';

import 'package:alif_quran/features/quran/presentation/cubit/quran_cubit.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  @override
  void initState() {
    GetIt.I<QuranCubit>().getQuranData('1');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: GetIt.I<QuranCubit>(),
      child: Column(
        children: [
          Text("Ini Widget Quran"),
          BlocBuilder<QuranCubit, QuranState>(builder: (context, state) {
            log(state.runtimeType.toString());
            log(state.toString());
            return state.maybeWhen(
              success: (surahModel) => ListView.builder(
                  shrinkWrap: true,
                  itemCount: surahModel.jumlahAyat,
                  itemBuilder: (context, int index) {
                    return ListTile(
                      title: Text(surahModel.ayat[index].ar),
                      subtitle: Text(surahModel.ayat[index].idn),
                    );
                  }),
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              orElse: () => const Center(
                child: Text("kosong"),
              ),
            );
          }),
        ],
      ),
    );
  }
}

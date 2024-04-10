import 'dart:developer';

import 'package:alif_quran/features/prayer/presentation/cubit/prayer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class PrayerTimeWidget extends StatefulWidget {
  const PrayerTimeWidget({super.key});

  @override
  State<PrayerTimeWidget> createState() => _PrayerTimeWidgetState();
}

class _PrayerTimeWidgetState extends State<PrayerTimeWidget> {
  @override
  void initState() {
    GetIt.I<PrayerCubit>().getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: GetIt.I<PrayerCubit>(),
      child: Column(
        children: [
          const Text(
            'Dzuhur 11.57',
          ),
          const Text(
            '10 menit lagi',
          ),
          BlocBuilder<PrayerCubit, PrayerState>(
              builder: (context, state) =>
                  state.maybeWhen(success: (cityDetail) {
                    return Text(
                      'Lokasi: ${cityDetail.locality}',
                    );
                  }, orElse: () {
                    return const Text("kosong");
                  })),
        ],
      ),
    );
  }
}

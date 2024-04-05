import 'package:alif_quran/features/prayer/presentation/cubit/prayer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@singleton
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
      child: const Column(
        children: [
          Text(
            'Dzuhur 11.57',
          ),
          Text(
            '10 menit lagi',
          ),
        ],
      ),
    );
  }
}

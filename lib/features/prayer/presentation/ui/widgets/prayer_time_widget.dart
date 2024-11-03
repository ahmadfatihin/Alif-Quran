import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../../../core/core.dart';
import '../../cubit/prayer_cubit.dart';

class PrayerTimeWidget extends StatefulWidget {
  const PrayerTimeWidget({super.key});

  @override
  State<PrayerTimeWidget> createState() => _PrayerTimeWidgetState();
}

class _PrayerTimeWidgetState extends State<PrayerTimeWidget> {
  @override
  void initState() {
    super.initState();
    final cubit = GetIt.I<PrayerCubit>();

    cubit.fetchPrayerTime();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = GetIt.I<PrayerCubit>();

    return BlocProvider.value(
      value: cubit,
      child: Column(
        children: [
          BlocBuilder<PrayerCubit, PrayerState>(
            builder: (context, state) {
              log(state.runtimeType.toString());
              log(state.toString());

              return state.maybeWhen(
                success: (prayerTime) {
                  return _buildPrayerTimeDisplay(prayerTime);
                },
                error: (error) {
                  return Text('Error: ${error.message}');
                },
                orElse: () {
                  return const CircularProgressIndicator();
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPrayerTimeDisplay(prayerTime) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildPrayerTimeColumn('Fajr', prayerTime.data.timings.Fajr),
        _buildPrayerTimeColumn('Dhuhr', prayerTime.data.timings.Dhuhr),
        _buildPrayerTimeColumn('Asr', prayerTime.data.timings.Asr),
        _buildPrayerTimeColumn('Maghrib', prayerTime.data.timings.Maghrib),
        _buildPrayerTimeColumn('Isha', prayerTime.data.timings.Isha),
      ],
    );
  }

  Widget _buildPrayerTimeColumn(String title, String time) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyles.textSmRegular.copyWith(color: Pallet.white),
        ),
        Text(
          time,
          style: TextStyles.textSmRegular.copyWith(color: Pallet.white),
        ),
      ],
    );
  }
}

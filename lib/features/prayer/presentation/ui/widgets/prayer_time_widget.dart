import 'package:flutter/material.dart';

class PrayerTimeWidget extends StatelessWidget {
  const PrayerTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Dzuhur 11.57',
        ),
        Text(
          '10 menit lagi',
        ),
      ],
    );
  }
}

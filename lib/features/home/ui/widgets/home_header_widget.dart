import 'package:alif_quran/core/design_system/widgets/circular_avatar_widget.dart';
import 'package:flutter/material.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CircularAvatarWidget(size: 40),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Assalamualaikum'),
            Text('Selamat Datang, Ahmad Fatihin'),
          ],
        ),
      ],
    );
  }
}

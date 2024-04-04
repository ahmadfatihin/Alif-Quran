import 'package:flutter/material.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.home),
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

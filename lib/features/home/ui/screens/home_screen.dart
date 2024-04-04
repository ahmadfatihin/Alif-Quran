import 'package:alif_quran/core/design_system/themes/textstyles.dart';
import 'package:flutter/material.dart';

import '../../../../core/design_system/themes/dimension.dart';
import '../widgets/home_header_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const HomeHeaderWidget(),
            SizedBox(height: Dimension.width10),
            Center(
              child: Text(
                'Feature Widget',
                style: TextStyles.textBaseXtraBold,
              ),
            ),
            SizedBox(height: Dimension.width500),
            const Center(
              child: Text(' Sholat Time Widget'),
            ),
            const Spacer(),
            const Center(
              child: Text('Bottom Navigation'),
            ),
          ],
        ),
      ),
    );
  }
}

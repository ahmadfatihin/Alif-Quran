import 'dart:async';
import 'package:flutter/material.dart';

import '../../../../../core/core.dart';

class Time extends StatefulWidget {
  const Time({super.key});

  @override
  _TimeState createState() => _TimeState();
}

class _TimeState extends State<Time> {
  late DateTime now;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    now = DateTime.now();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        now = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime =
        "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";

    return Center(
      child: Text(
        formattedTime,
        style: TextStyles.text4XlSemiBold.copyWith(color: Pallet.white),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: const Column(
        children: [
          Center(
            child: Text('Banner'),
          ),
          SizedBox(height: 100),
          Center(
            child: Text('Feature Widget'),
          ),
          SizedBox(height: 90),
          Center(
            child: Text(' Sholat Time Widget'),
          ),
          Spacer(),
          Center(
            child: Text('Bottom Navigation'),
          ),
        ],
      ),
    );
  }
}

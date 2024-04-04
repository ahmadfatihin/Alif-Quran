import 'package:flutter/material.dart';

class CircularAvatarWidget extends StatelessWidget {
  final double size;

  const CircularAvatarWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size / 2,
      backgroundColor: Colors.blue,
      child: Icon(
        Icons.person,
        size: size * 0.8,
        color: Colors.white,
      ), // Placeholder background color
    );
  }
}

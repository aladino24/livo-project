import 'package:flutter/material.dart';

class ActivityHeader extends StatelessWidget {
  const ActivityHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Aktivitas',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            letterSpacing: 0.6,
          ),
        ),
        SizedBox(height: 6),
        Text(
          'Lihat aktivitas terbaru kamu',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 16,
            letterSpacing: 0.4,
          ),
        ),
      ],
    );
  }
}

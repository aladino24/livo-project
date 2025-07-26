import 'package:flutter/material.dart';

class DiscoverCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final Color color;

  const DiscoverCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none, 
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
              ),
              Positioned(
                top: -10, 
                right: -8,
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.asset(image, fit: BoxFit.contain),
                ),
              ),
            ],
          ),
          // const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

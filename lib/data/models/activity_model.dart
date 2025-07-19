import 'package:flutter/material.dart';

class Activity {
  final IconData icon;
  final String title;
  final String time;
  final String description;

  const Activity({
    required this.icon,
    required this.title,
    required this.time,
    required this.description,
  });
}
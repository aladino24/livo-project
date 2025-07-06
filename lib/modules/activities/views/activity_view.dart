import 'package:flutter/material.dart';
import 'package:livo_project/data/models/activity_model.dart';
import 'package:livo_project/modules/activities/widgets/curveappbarclipper.dart';
import 'package:livo_project/modules/activities/widgets/activity_card.dart';
import 'package:livo_project/modules/activities/widgets/activity_header.dart';
import 'package:livo_project/themes/apps_color.dart';
import 'package:intl/intl.dart';

class ActivityView extends StatelessWidget {
  const ActivityView({super.key});

  final List<Activity> activities = const [
    Activity(
      icon: Icons.event_available,
      title: 'Meeting dengan Tim',
      time: '2025-07-06 09:00:00',
      description: 'Diskusi target mingguan dan pembagian tugas.',
    ),
    Activity(
      icon: Icons.task_alt,
      title: 'Selesai Review Proposal',
      time: '2025-07-05 16:30:00',
      description: 'Proposal proyek aplikasi mobile telah selesai direview.',
    ),
    Activity(
      icon: Icons.notifications_active,
      title: 'Pengingat Deadline',
      time: '2025-07-07 12:00:00',
      description: 'Deadline pengumpulan laporan proyek ERP.',
    ),
  ];

  String formatDateTime(String dateTimeStr) {
    final dateTime = DateTime.parse(dateTimeStr);
    return DateFormat('EEEE, d MMM yyyy • HH:mm').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      body: Column(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: CurvedAppBarClipper(),
                child: Container(
                  height: 140,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppsColors.primaryColor,
                        AppsColors.primaryColor.withOpacity(0.7),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      child: ActivityHeader(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: activities.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final act = activities[index];
                return ActivityCard(
                  icon: act.icon,
                  title: act.title,
                  dateTimeFormatted: formatDateTime(act.time),
                  description: act.description,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

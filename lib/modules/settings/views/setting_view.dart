import 'package:flutter/material.dart';
import 'package:livo_project/modules/settings/widgets/setting_tile.dart';
import 'package:livo_project/themes/apps_color.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: Column(
        children: [
          // Modern AppBars
          Container(
            decoration: const BoxDecoration(
              color: AppsColors.primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            padding: const EdgeInsets.fromLTRB(16, 48, 16, 24),
            width: double.infinity,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pengaturan',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Icon(Icons.settings, color: Colors.white),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Body
          Expanded(
            child: ListView(
              children: const [
                SettingTile(
                  label: 'Pengaturan Akun',
                  icon: Icons.person_outline,
                  iconColor: Colors.green,
                  onTap: null,
                ),
                SettingTile(
                  label: 'Bahasa',
                  icon: Icons.language,
                  iconColor: Colors.orange,
                  onTap: null,
                ),
                SettingTile(
                  label: 'Tema Aplikasi',
                  icon: Icons.dark_mode,
                  iconColor: Colors.blueGrey,
                  onTap: null,
                ),
                SettingTile(
                  label: 'Pusat Bantuan',
                  icon: Icons.chat_bubble_outline,
                  iconColor: Colors.purple,
                  onTap: null,
                ),
                SettingTile(
                  label: 'Hapus Semua Data',
                  icon: Icons.delete_outline,
                  iconColor: Colors.red,
                  onTap: null,
                ),
                SettingTile(
                  label: 'Pulihkan Data',
                  icon: Icons.restore,
                  iconColor: Colors.blue,
                  onTap: null,
                ),
                SettingTile(
                  label: 'Periksa Pembaruan',
                  icon: Icons.download,
                  iconColor: Colors.teal,
                  onTap: null,
                ),
                SettingTile(
                  label: 'Keluar',
                  icon: Icons.logout,
                  iconColor: Colors.black,
                  onTap: null,
                ),
                SizedBox(height: 30),
                Center(
                  child: Text(
                    'Versi Aplikasi v1.1',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

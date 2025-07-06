import 'package:flutter/material.dart';
import 'package:livo_project/themes/apps_color.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan',
            style: TextStyle(color: Colors.white, fontSize: 20)),
        backgroundColor: AppsColors.primaryColor,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10),

          // Unduh ulang data
          ListTile(
            leading: const Icon(Icons.download, color: Colors.blue),
            title: const Text('Unduh Ulang Data'),
            onTap: () {
            },
          ),
          const Divider(),

          // Pengaturan Akun
          ListTile(
            leading: const Icon(Icons.person_outline, color: Colors.green),
            title: const Text('Pengaturan Akun'),
            onTap: () {
              // TODO: Navigasi ke pengaturan akun
            },
          ),
          const Divider(),

          // Bahasa
          ListTile(
            leading: const Icon(Icons.language, color: Colors.orange),
            title: const Text('Bahasa'),
            onTap: () {
              // TODO: Ganti bahasa
            },
          ),
          const Divider(),

          // Obrolan Bantuan
          ListTile(
            leading: const Icon(Icons.chat_bubble_outline, color: Colors.purple),
            title: const Text('Obrolan Bantuan'),
            onTap: () {
              // TODO: Navigasi ke halaman bantuan
            },
          ),
          const Divider(),

          // Hapus Semua Data
          ListTile(
            leading: const Icon(Icons.delete_outline, color: Colors.red),
            title: const Text('Hapus Semua Data'),
            onTap: () {
              // TODO: Konfirmasi dan hapus semua data
            },
          ),
          const Divider(),

          // Keluar
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.black),
            title: const Text('Keluar'),
            onTap: () {
              // TODO: Logout dan arahkan ke login
            },
          ),
        ],
      ),
    );
  }
}

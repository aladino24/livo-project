import 'package:flutter/material.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          ClipPath(
            clipper: WaveAppBarClipper(),
            child: Container(
              height: 180,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepOrangeAccent, Colors.orangeAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              alignment: Alignment.center,
              child: const SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Row(
                        children: [
                          SizedBox(width: 8),
                          Text(
                            'Favorites',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          SizedBox(width: 8),
                          Text(
                            'Fitur favorit yang sering kamu gunakan',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 180.0),
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: const [
                FavoriteFeature(
                  icon: Icons.chat_bubble_outline,
                  title: 'Chat',
                  description: 'Pesan dan obrolan dengan teman dan tim',
                  color: Colors.blueAccent,
                ),
                FavoriteFeature(
                  icon: Icons.shopping_bag_outlined,
                  title: 'Orders',
                  description: 'Lacak pesanan dan pembelian terbaru',
                  color: Colors.deepOrange,
                ),
                FavoriteFeature(
                  icon: Icons.calendar_today_outlined,
                  title: 'Calendar',
                  description: 'Lihat jadwal dan acara penting',
                  color: Colors.green,
                ),
                FavoriteFeature(
                  icon: Icons.settings_outlined,
                  title: 'Settings',
                  description: 'Atur preferensi aplikasi kamu',
                  color: Colors.grey,
                ),
                FavoriteFeature(
                  icon: Icons.star_border,
                  title: 'Rewards',
                  description: 'Cek poin dan keuntungan kamu',
                  color: Colors.amber,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FavoriteFeature extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  const FavoriteFeature({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // aksi saat fitur ditekan
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.black12, width: 1),
          ),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(12),
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black26),
          ],
        ),
      ),
    );
  }
}

class WaveAppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height - 40);

    path.cubicTo(
      size.width / 4, size.height,
      3 * size.width / 4, size.height - 80,
      size.width, size.height - 40,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

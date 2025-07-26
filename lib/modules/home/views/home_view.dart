import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:livo_project/modules/home/controllers/category_home_controller.dart';
import 'package:livo_project/modules/home/widgets/discover_card.dart';
import 'package:livo_project/modules/main/widgets/category_card.dart';
import 'package:livo_project/modules/main/widgets/task_item_card.dart';
import 'package:livo_project/themes/apps_color.dart';
import 'package:badges/badges.dart' as badges;

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme);
    final categoryHomeController = Get.put(CategoryHomeController());
    int notificationCount = 5;

    return Scaffold(
      backgroundColor: AppsColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppsColors.primaryColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 22,
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Welcome back,",
                    style:
                        TextStyle(color: AppsColors.whiteColor, fontSize: 14)),
                Text("John Doe",
                    style: textTheme.titleLarge?.copyWith(
                      color: AppsColors.whiteColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    )),
              ],
            ),
          ],
        ),
        actions: [
           IconButton(
          icon: badges.Badge(
            badgeContent: Text(
              '$notificationCount',
              style: const TextStyle(color: Colors.white, fontSize: 9),
            ),
            showBadge: notificationCount > 0,
            position: badges.BadgePosition.topEnd(top: -4, end: -4),
            badgeStyle: const badges.BadgeStyle(
              badgeColor: Colors.redAccent,
              padding: EdgeInsets.all(5),
            ),
            child: const Icon(Icons.notifications, color: AppsColors.primaryAlmostWhiteColor),
          ),
          onPressed: (){},
        )
        ],
      ),
      body: Column(
        children: [
          // Search bar tetap di atas
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search task, event...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Sisanya bisa discroll
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Categories",
                          style: textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.w600)),
                      TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text("Lihat Semua",
                                style: textTheme.bodySmall
                                    ?.copyWith(color: AppsColors.primaryColor)),
                            const SizedBox(width: 4),
                            const Icon(Icons.arrow_forward_ios,
                                size: 12, color: AppsColors.primaryColor),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Stack(
                    children: [
                      SingleChildScrollView(
                        controller: categoryHomeController.scrollController,
                        scrollDirection: Axis.horizontal,
                        child: const Row(
                          children: [
                            CategoryCard(
                                label: "Keuangan",
                                icon: Iconsax.wallet,
                                color: AppsColors.primaryColor),
                            SizedBox(width: 12),
                            CategoryCard(
                                label: "Pekerjaan",
                                icon: Iconsax.briefcase,
                                color: Colors.deepOrange),
                            SizedBox(width: 12),
                            CategoryCard(
                                label: "Hiburan",
                                icon: Iconsax.game,
                                color: Colors.teal),
                            SizedBox(width: 12),
                            CategoryCard(
                                label: "Belanja",
                                icon: Iconsax.shopping_bag,
                                color: Colors.purple),
                            SizedBox(width: 12),
                            CategoryCard(
                                label: "Kesehatan",
                                icon: Iconsax.heart,
                                color: Colors.redAccent),
                            SizedBox(width: 12),
                            CategoryCard(
                                label: "Belajar",
                                icon: Iconsax.book,
                                color: Colors.blueGrey),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: GestureDetector(
                          onTap: () {
                            categoryHomeController.scrollRight();
                          },
                          child: Container(
                            width: 30,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Colors.white.withOpacity(0.0),
                                  Colors.white.withOpacity(0.8),
                                ],
                              ),
                            ),
                            alignment: Alignment.centerRight,
                            child: const Icon(Icons.arrow_forward_ios,
                                size: 16, color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),

                  // Upcoming
                  Text("Upcoming",
                      style: textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 12),
                  const TaskItemCard(
                      title: "Team Meeting",
                      time: "10:00 AM • Office",
                      icon: Iconsax.people,
                      color: AppsColors.primaryColor),
                  const TaskItemCard(
                      title: "Design Review",
                      time: "12:30 PM • Zoom",
                      icon: Iconsax.paintbucket,
                      color: Colors.deepOrange),
                  const TaskItemCard(
                      title: "Write Blog",
                      time: "5:00 PM • Home",
                      icon: Iconsax.edit_2,
                      color: Colors.teal),
                  const SizedBox(height: 20),

                  // More options
                  // Discover More Section
                  Text("Discover More",
                      style: textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 30),

                  GridView.count(
                    crossAxisCount: 3,
                    mainAxisSpacing: 35,
                    crossAxisSpacing: 16,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: const [
                      DiscoverCard(
                        image: 'assets/images/target.png',
                        title: "My Goals",
                        subtitle: "Track your progress",
                        color: Colors.orangeAccent,
                      ),
                      DiscoverCard(
                        image: 'assets/images/idea.png',
                        title: "Daily Tips",
                        subtitle: "Improve your day",
                        color: Colors.greenAccent,
                      ),
                      DiscoverCard(
                        image: 'assets/images/inspiration.png',
                        title: "Inspiration",
                        subtitle: "Stay motivated",
                        color: Colors.purpleAccent,
                      ),
                      DiscoverCard(
                        image: 'assets/images/notes.png',
                        title: "Quick Notes",
                        subtitle: "Jot down ideas",
                        color: Colors.blueAccent,
                      ),
                    ],
                  ),

                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

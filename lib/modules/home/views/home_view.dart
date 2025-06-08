import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:livo_project/modules/home/controllers/category_home_controller.dart';
import 'package:livo_project/modules/main/widgets/category_card.dart';
import 'package:livo_project/modules/main/widgets/task_item_card.dart';
import 'package:livo_project/themes/apps_color.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme);
    // get put controller
    final categoryHomeController = Get.put(CategoryHomeController());

    return Scaffold(
      backgroundColor: AppsColors.primaryAlmostWhiteColor,
      appBar: AppBar(
        backgroundColor: AppsColors.primaryColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome back,",
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
            icon: Icon(Iconsax.notification,
                color: AppsColors.primaryAlmostWhiteColor),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            TextField(
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
            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Categories",
                    style: textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.w600)),
                TextButton(
                  onPressed: () {
                    // TODO: Tambahkan aksi lihat semua jika diperlukan
                  },
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
                  child: Row(
                    children: [
                      CategoryCard(
                          label: "Keuangan", icon: Iconsax.wallet, color: AppsColors.primaryColor),
                      SizedBox(width: 12),
                      CategoryCard(
                          label: "Pekerjaan",icon: Iconsax.briefcase, color: Colors.deepOrange),
                      SizedBox(width: 12),
                      CategoryCard(label: "Hiburan", icon: Iconsax.game,color: Colors.teal),
                      SizedBox(width: 12),
                      CategoryCard(
                          label:  "Belanja", icon: Iconsax.shopping_bag,color:  Colors.purple),
                      SizedBox(width: 12),
                      CategoryCard(
                         label:  "Kesehatan", icon: Iconsax.heart,color:  Colors.redAccent),
                      SizedBox(width: 12),
                      CategoryCard(label:"Belajar", icon:Iconsax.book, color:Colors.blueGrey),
                    ],
                  ),
                ),
                // Panah tanda scroll di kanan
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

            // Upcoming Section
            Text("Upcoming",
                style: textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.w600)),
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                children: const [
                  TaskItemCard(title:"Team Meeting", time: "10:00 AM • Office",
                      icon:Iconsax.people, color:AppsColors.primaryColor),
                  TaskItemCard(title: "Design Review",time:  "12:30 PM • Zoom",
                      icon:Iconsax.paintbucket, color:Colors.deepOrange),
                  TaskItemCard(title: "Write Blog",time:  "5:00 PM • Home", icon:Iconsax.edit_2,
                      color:Colors.teal),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategory(String label, IconData icon, Color color) {
    return Container(
      width: 90,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 30),
          const SizedBox(height: 8),
          Text(label,
              style: GoogleFonts.poppins(
                  fontSize: 14, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildTaskItem(String title, String time, IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: color.withOpacity(0.2),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w600)),
              const SizedBox(height: 4),
              Text(time,
                  style: GoogleFonts.poppins(
                      fontSize: 13, color: Colors.grey[600])),
            ],
          ),
        ],
      ),
    );
  }
}

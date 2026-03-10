import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget navItem(int index, IconData icon, String label) {
    final Controller controller = Get.put(Controller());
    int currentIndex = 0;
    bool isActive = currentIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => currentIndex = index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 35,
              height: 4,
              decoration: BoxDecoration(
                color: isActive ? Color(0xFFB366CC) : Colors.transparent,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(10)),
              ),
            ),
            SizedBox(height: 10),
            Icon(icon, color: Colors.black, size: 26),
            SizedBox(height: 4),
            Text(label,
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: isActive ? FontWeight.bold : FontWeight.w500)),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  final Controller controller = Get.put(Controller());
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        //elevation: 0,
        toolbarHeight: 80,
        leadingWidth: 70,
        titleSpacing: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 15,
            child: ClipOval(
              child: Image.asset(
                'assets/images/profile.png',
                width: 30,
                height: 30,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Morning",
                style: TextStyle(color: Color(0xFFACA9A9), fontSize: 12)),
            Text("Huzayfah Hanif",
                style: TextStyle(
                    color: Color(0xFF232323),
                    fontSize: 16,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Stack(
              children: [
                Container(
                  height: 35,
                  width: 35,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset(
                      'assets/images/notification.svg',
                      height: 15,
                      width: 15,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 3,
                  right: 1,
                  child: Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSearchBar(),
            buildSectionHeader("Categories"),
            buildCategoryList(),
            buildSectionHeader("Most Funded"),
            buildProjectHorizontalList(),
            buildSectionHeader("Recents"),
            buildProjectHorizontalList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFFB366CC),
        elevation: 4,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        height: 80,
        color: Colors.white,
        notchMargin: 10,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            navItem(0, Icons.home_outlined, "Home"),
            navItem(1, Icons.chat_bubble_outline, "Chats"),
            SizedBox(width: 50),
            navItem(2, Icons.list_alt_outlined, "Campaigns"),
            navItem(3, Icons.person_outline, "Profile"),
          ],
        ),
      ),
    );
  }
}

Widget buildSectionHeader(String title) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        Text("See all",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w300)),
      ],
    ),
  );
}

Widget buildSearchBar() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(15)),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search, color: Colors.black54),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: const Color(0xFF8489FC),
              borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: SvgPicture.asset(
              'assets/images/Vector.svg',
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildCategoryList() {
  final Controller controller = Get.put(Controller());
  return SizedBox(
    height: 110,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      itemCount: controller.categories.length,
      padding: EdgeInsets.only(left: 20),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(right: 8),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: SvgPicture.asset(controller.categories[index]['icon']!,
                    width: 30, height: 30),
              ),
              SizedBox(height: 4),
              Text(controller.categories[index]['name']!,
                  style: TextStyle(fontSize: 12, color: Colors.black87)),
            ],
          ),
        );
      },
    ),
  );
}

Widget buildProjectHorizontalList() {
  final Controller controller = Get.put(Controller());
  return SizedBox(
    // height: 250,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(left: 20),
      itemCount: controller.fundedProjects.length,
      itemBuilder: (context, index) {
        return buildProjectCard(controller.fundedProjects[index]);
      },
    ),
  );
}

Widget buildProjectCard(Map<String, dynamic> data) {
  return Container(
    width: 210,
    margin: EdgeInsets.only(right: 15, bottom: 20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(25),
      boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 15,
            offset: Offset(0, 8))
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          child: Stack(
            children: [
              Image.asset(
                data['image'] ?? data['svg'],
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                    height: 120,
                    color: Colors.grey[300],
                    child: Icon(Icons.image)),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child:
                      Icon(Icons.arrow_forward, size: 16, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data['title'],
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Text(data['subtitle'],
                            style: const TextStyle(
                                fontSize: 11, color: Colors.grey)),
                      ],
                    ),
                  ),
                  SvgPicture.asset("assets/images/Vectorr.svg", height: 18),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildStatCol("Raised", data['raised']),
                  buildStatCol("Min", data['minInv']),
                  buildStatCol("Share", data['shareholders']),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildStatCol(String label, String value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: TextStyle(fontSize: 9, color: Colors.grey)),
      SizedBox(height: 2),
      Text(value, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
    ],
  );
}

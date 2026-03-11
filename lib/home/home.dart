import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:logo_app/home/home_components.dart';
import 'controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Controller controller = Get.put(Controller());
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        leadingWidth: 70,
        titleSpacing: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 20),
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
            padding: EdgeInsets.all(12.0),
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
                    padding: EdgeInsets.all(10.0),
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
            HomeComponents.buildSearchBar(),
            HomeComponents.buildSectionHeader("Categories", showSeeAll: false),
            HomeComponents.buildCategoryList(),
            HomeComponents.buildSectionHeader("Most Funded"),
            HomeComponents.buildProjectHorizontalList(),
            HomeComponents.buildSectionHeader("Recents"),
            HomeComponents.buildProjectHorizontalList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xFF8489FC),
        shape: CircleBorder(),
        child: Icon(Icons.add, color: Colors.white, size: 28),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        height: 80,
        color: Colors.white,
        notchMargin: 10,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 0;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 35,
                      height: 4,
                      decoration: BoxDecoration(
                        color: currentIndex == 0
                            ? Color(0xFFB366CC)
                            : Colors.transparent,
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(10)),
                      ),
                    ),
                    SizedBox(height: 10),
                    Icon(Icons.home_outlined, size: 26),
                    SizedBox(height: 4),
                    Text(
                      "Home",
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: currentIndex == 0
                            ? FontWeight.bold
                            : FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 1;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 35,
                      height: 4,
                      decoration: BoxDecoration(
                        color: currentIndex == 1
                            ? Color(0xFFB366CC)
                            : Colors.transparent,
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(10)),
                      ),
                    ),
                    SizedBox(height: 10),
                    Icon(Icons.chat_bubble_outline, size: 26),
                    SizedBox(height: 4),
                    Text(
                      "Chats",
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: currentIndex == 1
                            ? FontWeight.bold
                            : FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 50),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 2;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 35,
                      height: 4,
                      decoration: BoxDecoration(
                        color: currentIndex == 2
                            ? Color(0xFFB366CC)
                            : Colors.transparent,
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(10)),
                      ),
                    ),
                    SizedBox(height: 10),
                    Icon(Icons.list_alt_outlined, size: 26),
                    SizedBox(height: 4),
                    Text(
                      "Campaigns",
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: currentIndex == 2
                            ? FontWeight.bold
                            : FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 3;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 35,
                      height: 4,
                      decoration: BoxDecoration(
                        color: currentIndex == 3
                            ? Color(0xFFB366CC)
                            : Colors.transparent,
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(10)),
                      ),
                    ),
                    SizedBox(height: 10),
                    Icon(Icons.person_outline, size: 26),
                    SizedBox(height: 4),
                    Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: currentIndex == 3
                            ? FontWeight.bold
                            : FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

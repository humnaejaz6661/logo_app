import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:logo_app/home/controller.dart';

class HomeComponents {
  static Widget buildSectionHeader(String title, {bool showSeeAll = true}) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          if (showSeeAll)
            Text("See all",
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.w300)),
        ],
      ),
    );
  }

  static Widget buildSearchBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
          SizedBox(width: 12),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: Color(0xFF8489FC),
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

  static Widget buildCategoryList() {
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

  static Widget buildProjectHorizontalList() {
    final Controller controller = Get.put(Controller());
    return SizedBox(
      height: 250,
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

  static Widget buildProjectCard(Map<String, dynamic> data) {
    return Container(
      width: 210,
      margin: EdgeInsets.only(right: 15, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withValues(alpha: 0.2),
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
                data['image'] != null
                    ? Image.asset(
                        data['image'],
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                    : SvgPicture.asset(
                        data['svg'],
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        placeholderBuilder: (context) => Container(
                          height: 120,
                          color: Colors.grey[200],
                          child: Center(child: CircularProgressIndicator()),
                        ),
                      ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: Icon(Icons.arrow_forward,
                        size: 16, color: Colors.black),
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

  static Widget buildStatCol(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 9, color: Colors.grey)),
        SizedBox(height: 2),
        Text(value,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
      ],
    );
  }
}

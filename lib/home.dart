import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

final List<Map<String, String>> categories = [
  {'name': 'AI Tech', 'icon': 'assets/images/ai.svg'},
  {'name': 'Software Co', 'icon': 'assets/images/whale.svg'},
  {'name': 'Education', 'icon': 'assets/images/graduation.svg'},
  {'name': 'Construction', 'icon': 'assets/images/construction.svg'},
  {'name': 'Real Estate', 'icon': 'assets/images/estate.svg'},
];

class HomePage extends StatelessWidget {
  // TextField searchfield = TextField();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leadingWidth: 80,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.transparent,
            child: SvgPicture.asset(
              'assets/images/appbar_profile.svg',
              fit: BoxFit.cover,
              width: 50,
              height: 50,
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Morning",
              style: TextStyle(
                color: Color(0xFFACA9A9),
                fontFamily: 'DM Sans',
                fontSize: 10,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              "Huzayfah Hanif",
              style: TextStyle(
                color: Color(0xFF232323),
                fontFamily: 'DM Sans',
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.notifications_none, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon:
                              Icon(Icons.search, color: Color(0xFF232323)),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 15),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: const Color(0xFF8489FC),
                        borderRadius: BorderRadius.circular(15)),
                    child: SvgPicture.asset('assets/images/Vector.svg'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(" Categories",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.bold,
                  )),
            ),
            SizedBox(height: 15),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                padding: const EdgeInsets.only(left: 20),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            // color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: SvgPicture.asset(
                            categories[index]['icon']!,
                            width: 35,
                            height: 35,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          categories[index]['name']!,
                          style: const TextStyle(
                              fontSize: 12, color: Colors.black87),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text(" Most Founded",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                      width: 120,
                    ),
                    Text(
                      "See all",
                      style: TextStyle(color: Color(0xFF232323)),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

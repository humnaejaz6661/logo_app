import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'controller.dart';

class HomePage extends StatelessWidget {
  // TextField searchfield = TextField();
  final Controller controller = Get.put(Controller());
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
                itemCount: controller.categories.length,
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
                            controller.categories[index]['icon']!,
                            width: 35,
                            height: 35,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          controller.categories[index]['name']!,
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
                    ),
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.only(left: 20),
                        itemCount: controller.fundedProjects.length,
                        itemBuilder: (context, index) {
                          var data = controller.fundedProjects[index];

                          return Container(
                            width: 280,
                            margin:
                                const EdgeInsets.only(right: 20, bottom: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                )
                              ],
                            ),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(20)),
                                  child: SvgPicture.asset(
                                    data['svg'],
                                    height: 160,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data['title'],
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        data['subtitle'],
                                        style: const TextStyle(
                                            color: Colors.grey, fontSize: 12),
                                      ),
                                      const SizedBox(height: 15),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text("Raised Funds",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.grey)),
                                              Text(data['raised'],
                                                  style: const TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text("Min.inv",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.grey)),
                                              Text(data['minInv'],
                                                  style: const TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text("Shareholders",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.grey)),
                                              const SizedBox(height: 2),
                                              Text(data['shareholders'],
                                                  style: const TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

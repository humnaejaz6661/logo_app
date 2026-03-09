import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:logo_app/login.dart';

class ProceedScreen extends StatelessWidget {
  const ProceedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 50, left: 12),
          child: Text("Select One To Proceed",
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
      body: Column(children: [
        Container(
            height: height * .6,
            width: 360,
            margin: EdgeInsets.only(top: 25, left: 22, right: 22),
            decoration: BoxDecoration(
                color: Color(0xFF8489FC),
                borderRadius: BorderRadius.circular(9)),
            child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 25,
                      left: 20,
                    ),
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: SvgPicture.asset(
                          'assets/images/Group 85.svg',
                          // width: 15,
                          // height: 15,
                          // fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 20),
                    child: Text(
                      "Build a Startup",
                      style: TextStyle(
                        fontFamily: 'DM Sans',
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 20),
                    child: SizedBox(
                      width: 160,
                      child: Text(
                        "A startup is a small, new, or young company founded by entrepreneurs to introduce a new product  ",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: 'DM Sans',
                            fontSize: 10,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 0,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(100, 30),
                            foregroundColor: Color(0xFF8489FC),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9))),
                        child: Text("Build")),
                  ),
                ])),
        SizedBox(
          height: 20,
        ),
        Container(
          height: height * .6,
          alignment: Alignment.centerLeft,
          width: 360,
          margin: EdgeInsets.only(top: 25, left: 22, right: 22),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(9),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          // child: SvgPicture.asset(
          //   'assets/images/working_laptop_svg.svg',
          //   height: 210,
          //   width: 80,

          //   // fit: BoxFit.cover,
          // ),
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  'assets/images/working_laptop_svg.svg',
                  // height: 210,
                  // width: 80,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 20,
                left: 20,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 3,
                        spreadRadius: 1,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: SvgPicture.asset(
                      'assets/images/27. Working.svg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 70,
                left: 20,
                child: Text(
                  "Work for Equity/Fixed Price",
                  style: TextStyle(
                    fontFamily: 'DM Sans',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0,
                    color: Colors.black,
                  ),
                ),
              ),
              Positioned(
                top: 100,
                left: 20,
                child: Padding(
                  padding: const EdgeInsets.only(right: 80),
                  child: SizedBox(
                    width: 200, // give width so text can wrap
                    child: Text(
                      "A startup is a small, new, or young company founded by entrepreneurs to introduce a new product or service",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'DM Sans',
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 155,
                left: 20,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(100, 30),
                        backgroundColor: Color(0xFF8489FC),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9))),
                    child: Text(
                      "Participate",
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    )),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        ElevatedButton(
            onPressed: () {
              Get.to(Login());
            },
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(300, 60),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9),
                side: BorderSide(
                  color: Color(0xFF8489FC),
                  width: 1,
                ),
              ),
            ),
            child: Text(
              "Skip",
              style: TextStyle(
                  fontFamily: 'DM Sans',
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            )),
      ]),
    );
  }
}

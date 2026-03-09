import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logo_app/proceed_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SplashScreen> {
  Timer? timer;
  void initState() {
    super.initState();
    timer = Timer(Duration(seconds: 3), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProceedScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: Text(
              "LOGO",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 64,
                fontWeight: FontWeight.bold,
                letterSpacing: 0,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: SvgPicture.asset('assets/images/Ellipse 1.svg'),
          ),
          Positioned(
            bottom: 15,
            right: 10,
            child: SvgPicture.asset('assets/images/Ellipse 2.svg'),
          ),
        ],
      ),
    );
  }
}

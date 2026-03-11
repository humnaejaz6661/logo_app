import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:logo_app/home/home.dart';
import 'package:logo_app/login/login_components.dart';
import 'package:logo_app/register/register.dart';

// login stores the function , ye function haa but abhi execute nhi krna is ko(address of the function/ reference of the fn)
//  login() run function completely

class Login extends StatelessWidget {
  final _formKey =
      GlobalKey<FormState>(); // mnge state using Globalkey<FormState>
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  // void login() {
  //   if (_formKey.currentState!.validate()) {
  //     Get.to(() => HomePage());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -80,
            right: -80,
            child: SvgPicture.asset(
              'assets/images/double-circle.svg',
              height: 300,
              width: 300,
              fit: BoxFit.fill,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20, top: 70),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Color(0xFF7B7BFF),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.arrow_back,
                                color: Colors.white, size: 25),
                            onPressed: () => Get.back(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Text(
                      "Welcome to StepEv!",
                      style: TextStyle(
                          fontFamily: 'Space Grotesk',
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "Login to continue using this app ",
                    style: TextStyle(
                        fontFamily: 'DM Sans',
                        fontSize: 12,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      LoginComponents.customTextField(
                        hintText: "Email",
                        controller: emailcontroller,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter Email";
                          } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return "Enter Valid Email";
                          }
                          return null;
                        },
                      ),
                      LoginComponents.customTextField(
                        hintText: "Password",
                        controller: passwordcontroller,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        suffixIcon: Icon(Icons.visibility),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter Password";
                          } else if (value.length < 8) {
                            return "Password must be 8 characters";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      LoginComponents.loginButton(
                        text: "Login",
                        onPressed: () {
                          log("Login button pressed");

                          if (_formKey.currentState!.validate()) {
                            Get.to(() => HomePage());
                          }
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 13),
                        child: Text(
                          "Forget Password?",
                          style: TextStyle(
                              fontFamily: 'DM Sans',
                              fontSize: 13,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50.0),
                        child: Row(
                          children: [
                            Expanded(child: Divider(thickness: 1)),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text("Or",
                                  style: TextStyle(color: Colors.grey[600])),
                            ),
                            Expanded(child: Divider(thickness: 1)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      LoginComponents.socialButton(
                        text: "Continue with Google",
                        iconPath: 'assets/images/Google.svg',
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      LoginComponents.socialButton(
                        text: "Continue with Facebook",
                        iconPath: 'assets/images/Facebook.svg',
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(
                              color: Color(0xFFACA9A9),
                              fontSize: 13,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(RegisterPage());
                            },
                            child: Text(
                              "Register",
                              style: TextStyle(
                                color: Color(0xFF232323),
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

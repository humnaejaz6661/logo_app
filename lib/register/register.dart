import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:logo_app/login/login.dart';
import 'package:logo_app/register/register_components.dart';

class RegisterPage extends StatelessWidget {
  final _formKey =
      GlobalKey<FormState>(); // mnge state using Globalkey<FormState>

  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -110,
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
                            icon: const Icon(Icons.arrow_back,
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
                    padding: EdgeInsets.only(top: 35),
                    child: Text(
                      "Create an account",
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
                    "Create an account now to login ",
                    style: TextStyle(
                        fontFamily: 'DM Sans',
                        fontSize: 12,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      RegisterComponents.customTextField(
                        hintText: "Name",
                        controller: namecontroller,
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Name';
                          } else if (value.length < 3) {
                            return 'Name must be atleast 3 character long';
                          }
                          return null;
                        },
                      ),
                      RegisterComponents.customTextField(
                        hintText: "Email",
                        controller: emailcontroller,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Email';
                          } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return 'Enter a valid Email';
                          }
                          return null;
                        },
                      ),
                      RegisterComponents.customTextField(
                        hintText: "Password",
                        controller: passwordcontroller,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        suffixIcon: Icon(Icons.visibility),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Password';
                          } else if (value.length < 8) {
                            return 'Password must be at least 8 characters';
                          }
                          return null;
                        },
                      ),
                      RegisterComponents.customTextField(
                        hintText: "Phone",
                        controller: phonecontroller,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Phone Number';
                          } else if (value.length < 11) {
                            return 'Number must be at least 11 digits';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RegisterComponents.createButton(
                        text: "Create",
                        onPressed: () {},
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
                        height: 10,
                      ),
                      RegisterComponents.socialButton(
                        text: "Continue with Google",
                        iconPath: "assets/images/Google.svg",
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      RegisterComponents.socialButton(
                        text: "Continue with Facebook",
                        iconPath: "assets/images/Facebook.svg",
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account? ",
                            style: TextStyle(
                              color: Color(0xFFACA9A9),
                              fontSize: 13,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(Login());
                            },
                            child: Text(
                              "Login",
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

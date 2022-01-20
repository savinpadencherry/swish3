import 'dart:math';

import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:swish/pages/onBoarding1.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isSignUpScreen = false;
  bool isRememberMe = false;
  @override
  @override
  void initState() {
    super.initState();
  }

  Container container() {
    return Container(
      height: 400.0,
      child: RotatedBox(
        quarterTurns: 2,
        child: WaveWidget(
          config: CustomConfig(
            gradients: [
              [Colors.red, Colors.orange],
              [Colors.yellow, Colors.yellowAccent],
            ],
            durations: [19440, 10800],
            heightPercentages: [0.20, 0.25],
            blur: MaskFilter.blur(BlurStyle.solid, 10),
            gradientBegin: Alignment.bottomLeft,
            gradientEnd: Alignment.topRight,
          ),
          waveAmplitude: 0,
          size: Size(
            double.infinity,
            double.infinity,
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Stack(
          children: [
            container(),
            Positioned(
              top: 0,
              right: 0,
              left: 0, //to make the widget take the full screen
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/logo.png')),
                ),
                child: Container(
                  padding: EdgeInsets.only(top: 90.0, left: 25.0),
                  color: Colors.red.withOpacity(.4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: isSignUpScreen ? 'Welcome to' : 'Welcome',
                          style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.black,
                              letterSpacing: 1,
                              fontStyle: FontStyle.italic),
                          children: [
                            TextSpan(
                              text: isSignUpScreen ? ' Swish' : ' Back',
                              style: TextStyle(
                                  fontSize: 25.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            buildPositionedbottomContainer(true),
            AnimatedPositioned(
              duration: Duration(milliseconds: 700),
              curve: Curves.bounceInOut,
              top: 235.0,
              left: 55.0,
              right: 55.0,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 700),
                curve: Curves.bounceInOut,
                height: isSignUpScreen ? 360.0 : 260,
                width: 250,
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                //  padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      blurRadius: 15.0,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isSignUpScreen = false;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  'Login',
                                  style: TextStyle(
                                    color: isSignUpScreen
                                        ? Colors.grey
                                        : Colors.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                if (!isSignUpScreen)
                                  Container(
                                    margin: EdgeInsets.only(top: 3.0),
                                    height: 2,
                                    width: 55,
                                    color: Colors.orange,
                                  )
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isSignUpScreen = true;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  'Signup',
                                  style: TextStyle(
                                    color: isSignUpScreen
                                        ? Colors.black
                                        : Colors.grey,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                if (isSignUpScreen)
                                  Container(
                                    margin: EdgeInsets.only(top: 3.0),
                                    height: 2,
                                    width: 55,
                                    color: Colors.orange,
                                  )
                              ],
                            ),
                          ),
                        ],
                      ),
                      isSignUpScreen ? buildSignUp() : buildCheckBox(),
                    ],
                  ),
                ),
              ),
            ),
            buildPositionedbottomContainer(false),
          ],
        ),
      ),
    );
  }

  Container buildCheckBox() {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 20.0,
          ),
          buildTextField('Name', Icons.person, false, false),
          SizedBox(
            height: 20.0,
          ),
          buildTextField('Password', Icons.lock, true, false),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: isRememberMe,
                    activeColor: Colors.black,
                    onChanged: (value) {
                      setState(() {
                        isRememberMe = !isRememberMe;
                      });
                    },
                  ),
                  Text(
                    'Remember me',
                    style: TextStyle(fontSize: 9.0),
                  )
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot password?',
                  style: TextStyle(fontSize: 9.0),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Container buildSignUp() {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          buildTextField('Phone Number', Icons.phone_android, false, true),
          SizedBox(
            height: 10,
          ),
          buildTextField('Name', Icons.person, false, false),
          SizedBox(
            height: 10,
          ),
          buildTextField('Password', Icons.lock, true, false),
          Container(
            width: 200,
            margin: EdgeInsets.only(top: 20),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text:
                    "By pressing 'Submit' you agree to our terms and conditions",
                style: TextStyle(
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: " terms & conditions",
                    style: TextStyle(color: Colors.orange),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPositionedbottomContainer(bool showShadow) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 700),
      curve: Curves.bounceInOut,
      top: isSignUpScreen ? 550 : 450,
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          height: 90,
          width: 90,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              if (showShadow)
                BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 15,
                    offset: Offset(0, 1))
            ],
          ),
          child: !showShadow
              ? GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OnBoarding1())),
                  child: Animator(
                    tween: Tween<double>(begin: 0, end: 2 * pi),
                    duration: Duration(seconds: 10),
                    curve: Curves.elasticIn,
                    builder: (anim) => Transform.rotate(
                      angle: anim.value,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.orange,
                              Colors.yellow,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: Offset(0, 1))
                          ],
                        ),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              : Center(),
        ),
      ),
    );
  }

  TextField buildTextField(
      String title, IconData icon, bool isPassword, bool isEmail) {
    return TextField(
      obscureText: isPassword,
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: title,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(20.0)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }
}

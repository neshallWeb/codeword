import 'dart:async';

// import 'package:f2f_puzzlegame/view/auth_screen.dart';
// import 'package:f2f_puzzlegame/view/background_theme.dart';
// import 'package:f2f_puzzlegame/view/login_screen.dart';
// import 'package:f2f_puzzlegame/view/screen_2.dart';
import '../view/auth_screen.dart';
import '../view/background_theme.dart';
import '../view/login_screen.dart';
import '../view/screen_2.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:lottie/lottie.dart';

import '../model/page_route.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {

  bool goPage = true;

  bool showText = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // SystemChrome.setEnabledSystemUIOverlays([]);
    // SystemChrome.setEnabledSystemUIMode([]);
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);

    Future.delayed(const Duration(seconds: 5),(){

      if(showText){
        setState(() {
          showText=false;
        });
      }

      Navigator.push(context,

        NavigateWithOpaque(
          child: AuthScreen(start: true,),
          direction: AxisDirection.down,
        ),
      );

    });

/*
    Timer.periodic(const Duration(seconds: 5), (timer) {
      if(goPage){

        setState(() {
          goPage = false;
        });

        // Navigator.pushReplacement(context,
        Navigator.push(context,
          // MaterialPageRoute(
          //     // builder: (context) => Screen2()
          //     // builder: (context) => LoginScreen()
          //     builder: (context) => AuthScreen()
          // ),
          NavigateWithOpaque(
            child: AuthScreen(),
            // duration: 200,
            direction: AxisDirection.down,
          ),
        );
      }
    });
*/
  }

  @override
  Widget build(BuildContext context) {

    Size display = MediaQuery.of(context).size;

    const mockupWidth = 390;
    const mockupHeight = 844;

    double width = display.width;
    double height = display.height;

    final scale = mockupWidth / width;
    final divide = mockupWidth * width;

    // double initScale = 4;
    double initScale = 4.5;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage(
            "assets/images/background.png",
            // scale: 4 * scale,
          ),
          // fit: BoxFit.fill,
          fit: BoxFit.cover,

        ),
      ),
      child: Stack(
        children: [
          // Container(
          //   child: Image.asset(
          //     // "assets/images/13 Pro - 7.png",
          //     "assets/images/background.png",
          //     // "assets/images/13 Pro - 7.png",
          //     fit: BoxFit.fill,
          //   ),
          // ),

          //clouds

/*
          Positioned(
            top: 17,
            // left: -29,
            left: -19,
            child: Container(
              // height: 209.34,
              // width: 372,
              width: display.width*0.95,
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                "assets/images/clouds.png",
                fit: BoxFit.fill,
              ),
            ),
          ),

          //tree
          Positioned(
            top: 127,
            // left: -6,
            child: Container(
              // height: 388.82,
              // width: 561.02,
              width: display.width,
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                "assets/images/tree.png",
                fit: BoxFit.fill,
              ),
            ),
          ),

          //branch
          Positioned(
            top: 114,
            left: -1,
            child: Container(
              // height: 388.82,
              // width: 561.02,
              width: display.width,
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                "assets/images/branch.png",
                fit: BoxFit.fill,
              ),
            ),
          ),

          //text
          Positioned(
            top: 59,
            // top: 57,
            left: 9,
            child: Container(
              // height: 209.34,
              // width: 372,
              width: display.width*0.95,
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                "assets/images/Spooky_Text_Effect 2.png",
                fit: BoxFit.fill,
              ),
            ),
          ),

          //left root
          Positioned(
            top: 378,
            left: -5,
            child: Container(
              height: 487.45,
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                "assets/images/roots left.png",
                fit: BoxFit.fill,
              ),
            ),
          ),

          //grass
          Positioned(
            // top: 733,
            child: Container(
              height: display.height,
              width: display.width*0.95,
              // height: 138.49,
              // width: 357.35,
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                "assets/images/grass.png",
                fit: BoxFit.cover,
              ),
            ),
          ),

          //right root
          Positioned(
            top: 452,
            left: 240,
            child: Container(
              height: 481.68,
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                "assets/images/roots right.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
*/

        backGround(display),
          // backGround1(display),



          //text
          // Positioned(
          //   top: 59,
          //   // top: 57,
          //   left: 9,
          //   child: Container(
          //     // height: 209.34,
          //     // width: 372,
          //     width: display.width*0.95,
          //     alignment: Alignment.bottomCenter,
          //     child: Image.asset(
          //       "assets/images/Spooky_Text_Effect 2.png",
          //       fit: BoxFit.fill,
          //     ),
          //   ),
          // ),

          !showText?Container():
          // text
          Positioned(

            // top: 57,
            //left: 9,
            // top: 90,
            // left: -44,
            // top: 59 / mockupHeight * height,
            // left: 9 / mockupWidth * width,
            top: (59*scale) / mockupHeight * height,
            left: (9*scale) / mockupWidth * width,
            child: Container(
              // height: 209.34,
              // width: 372,
              // width: display.width*0.95,
              // width: 478,
              // height: 209.34 / mockupHeight * height,
              // width: 372 / mockupWidth * width,
              height: (209.34*scale) / mockupHeight * height,
              width: (372*scale) / mockupWidth * width,
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                "assets/images/Spooky_Text_Effect 2.png",
                fit: BoxFit.fill,
                scale: 4 * scale,
              ),
            ),
          ),

      // Positioned(
      //   top: display.height/2,
      //   left: display.width/5,
      //   child: Lottie.asset(
      //       'assets/animations/104768-little-bus.json',
      //       width: 200,
      //       height: 200,
      //       fit: BoxFit.cover
      //   ),
      // ),

        ],
      ),
    );
  }
}

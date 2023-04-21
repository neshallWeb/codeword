
// import 'dart:html';

// import 'dart:html';

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:external_app_launcher/external_app_launcher.dart';
// import 'package:f2f_puzzlegame/model/constants.dart';
import '../model/constants.dart';
// import 'package:f2f_puzzlegame/view/screen_2.dart';
// import 'package:f2f_puzzlegame/view/screen_3.dart';
import '../view/screen_3.dart';
// import 'package:f2f_puzzlegame/view/screen_4.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_background_service/flutter_background_service.dart';
// import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:video_player/video_player.dart';

import '../model/page_route.dart';
import 'auth_screen.dart';

Dialog dialogIncompletePuzzle (BuildContext context, String data){

  Size display = MediaQuery.of(context).size;
  double width = display.width;
  double height = display.height;

  const mockupWidth = 390;
  const mockupHeight = 844;

  final scale = mockupWidth / width;

  final bool isTablat = width>500 && height>800?true:false;

  return Dialog(
    elevation: 0,
    // insetPadding: EdgeInsets.all(10),
    // insetPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
    insetPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
    backgroundColor: Colors.transparent,
    alignment: Alignment.center,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ), //this right here
    child: StatefulBuilder(
        builder: (context, setState) {

          print("width ${MediaQuery.of(context).size.width}");
          print("height ${MediaQuery.of(context).size.height}");

          return Container(
            // height: 506,
            // width: 364,
            // color: Colors.transparent,
            // color: Color(0xff1C1C1C).withOpacity(1),

            // width: 364,
            // height: 506,

            child: Stack(
              children: [

                Container(
                  // height: 506-20,
                  // width: 364-20,

                  // height: 506,
                  // width: 364,

                  // height: (506*scale)/mockupHeight*height,
                  // height: (364*scale)/mockupHeight*height,
                  // width: (364*scale)/mockupWidth*width,

                  /*height: (300*scale)/mockupHeight*height,
                  width: (300*scale)/mockupWidth*width,*/
                  height: isTablat?300:(300*scale)/mockupHeight*height,
                  width: isTablat?450:(300*scale)/mockupWidth*width,

                  // margin: EdgeInsets.all(20),
                  // margin: EdgeInsets.all(25),
                  margin: EdgeInsets.all(
                      MediaQuery.of(context).size.width*0.025
                    // (MediaQuery.of(context).size.width*0.025*scale)/m
                  ),
                  // margin: EdgeInsets.symmetric(
                  //     horizontal: 10,
                  //     vertical: 12
                  // ),

                  decoration: BoxDecoration(
                    // color: Color(0xff1E7455),
                    // color: Color(0xffffffff),
                    color: colors.white,
                    // color: Colors.transparent,
                    // border: Border.all(width: 20, color:  Color(0xffffff)),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Container(
                    // height: 506-10,
                    // width: 364-10,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      // color: Color(0xff1E7455),
                      color: colors.green,
                      // color: Color(0xffffffff),
                      // border: Border.all(width: 15, color:  Color(0xffffffff)),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Container(
                            // width: 308,
                            width: MediaQuery.of(context).size.width,
                            // height: 231,
                            padding: EdgeInsets.all(17),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    colors.green,
                                    colors.lightGreen
                                  ]
                              ),
                            ),
                            child: Text(
                              "Puzzle Incomplete!",
                              style: TextStyle(
                                color: Color(0xffffffff),
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                // fontSize: 20,
                                /*fontSize: ((width<=360?16:20)*scale)/mockupWidth*width,*/
                                fontSize: isTablat?24:((width<=360?16:20)*scale)/mockupWidth*width,
                              ),

                            ),
                          ),

                          // Container(
                          //   // width: 308,
                          //   // height: 126,
                          //   width: (308*scale)/mockupWidth*width,
                          //   height: (126*scale)/mockupHeight*height,
                          //   margin: EdgeInsets.all(17),
                          //   decoration: BoxDecoration(
                          //     // color: Colors.transparent,
                          //     // border: Border.all(width: 2, color: Color(0xffffffff)),
                          //     // borderRadius: BorderRadius.circular(20),
                          //
                          //     image: DecorationImage(
                          //       image: ExactAssetImage(
                          //         "assets/images/Rectangle 26.png",
                          //       ),
                          //       fit: BoxFit.fill,
                          //       // fit: BoxFit.cover,
                          //       scale: 4*scale,
                          //     ),
                          //   ),
                          //   child: Stack(
                          //     children: [
                          //       Positioned(
                          //         // top: 15,
                          //         // // left: MediaQuery.of(context).size.width/15,
                          //         // left: (MediaQuery.of(context).size.width/16),
                          //
                          //         top: (15*scale)/mockupHeight*height,
                          //         // left: ((MediaQuery.of(context).size.width/16)*scale)/mockupWidth*width,
                          //         left: ((width<=360?5:(MediaQuery.of(context).size.width/16))*scale)/mockupWidth*width,
                          //         // left: ((width<=360?(MediaQuery.of(context).size.width/32):(MediaQuery.of(context).size.width/16))*scale)/mockupWidth*width,
                          //
                          //         child: Image.asset(
                          //           "assets/images/image 4.png",
                          //           // height: 36,
                          //           // width: 213,
                          //           // scale: 4.7,
                          //           height: (36*scale)/mockupHeight*height,
                          //           width: (213*scale)/mockupWidth*width,
                          //           // scale: 4.7 * scale,
                          //           scale: (width<=360?4:4.7) * scale,
                          //         ),
                          //
                          //         //   child: Expanded(
                          //         //     child: Image.asset(
                          //         //       "assets/images/image 4.png",
                          //         //       height: 36,
                          //         //       width: 213,
                          //         //       scale: 4.7,
                          //         //     ),
                          //         //   ),
                          //
                          //       ),
                          //
                          //       Positioned(
                          //         // top: 19,
                          //         // // left: 46,
                          //         // left: (MediaQuery.of(context).size.width/16)+46/2.7,
                          //
                          //         top: (19*scale)/mockupHeight*height,
                          //         // left: (((MediaQuery.of(context).size.width/16)+46/2.7)*scale)/mockupWidth*width,
                          //         left: ((width<=360?25:((MediaQuery.of(context).size.width/16)+46/2.7))*scale)/mockupWidth*width,
                          //         child: Text(
                          //           "13",
                          //           style: TextStyle(
                          //             color: Color(0xffffffff),
                          //             fontFamily: 'Roboto',
                          //             fontWeight: FontWeight.w400,
                          //             // fontSize: 8,
                          //             fontSize: 8*scale/mockupWidth*width,
                          //           ),
                          //
                          //         ),
                          //       ),
                          //       Positioned(
                          //         // top: 19,
                          //         // // right: 55,
                          //         // right: (MediaQuery.of(context).size.width/16)+46/1.4,
                          //
                          //         top: (19*scale)/mockupHeight*height,
                          //         // right: (((MediaQuery.of(context).size.width/16)+46/1.4)*scale)/mockupWidth*width,
                          //         right: ((width<=360?48:((MediaQuery.of(context).size.width/16)+46/1.4))*scale)/mockupWidth*width,
                          //
                          //         child: Text(
                          //           "13",
                          //           style: TextStyle(
                          //             color: Color(0xffffffff),
                          //             fontFamily: 'Roboto',
                          //             fontWeight: FontWeight.w400,
                          //             fontSize: 8,
                          //           ),
                          //
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),

                          Container(
                            // width: 308,
                            // height: 231,
                            width: (308*scale)/mockupWidth*width,
                            height: (231*scale)/mockupHeight*height,
                            margin: EdgeInsets.all(17),
                            child: Text(
                              // "The aim of CodeWords is to complete a grid of words"
                              //     " where you're given only a number in the places"
                              //     " where each letter will go."
                              //     "\n\n"
                              //     "The same number is used for the letter throughout"
                              //     " the grid, and your task is to work out which number"
                              //     " represents each letter!"
                              //     "\n\n"
                              //     "Correctly deduce (or guess!) all 26 and"
                              //     " you'll have cracked the code to complete"
                              //     " the puzzle.",

                              // "In a codeword puzzle, some letters of the alphabet have been replaced by numbers."
                              // "your goal is to find out which letter is represented by which number. you are given some letters to start.\n\n"
                              // "There is only one letter missing in this world. which one?\n"
                              // "The only word that makes sense is \"THEMES\".\n"
                              // "We can now fill all cells with the number 25 with a T.\n\n"
                              // "Use this new letter to help you find other words, and so on until the puzzle is solved completely.\n"
                              // "If you are stuck, you can open the top-right menu to get a hint. Have fun!",

                              // "1.	In the puzzle, you can see a grid with numbers and few letters.\n\n"
                              //     "2.	The aim of the game is to complete the crossword with appropriate letter in place of a particular number to make a meaningful word.\n\n"
                              //     "3.	For example, select a number 10, so now you need to work out to find which letter can replace all the 10s in the puzzle with that letter.\n\n"
                              //     "4.	It will be one of these letters below - one that isn’t blanked off already.\n\n"
                              //     "5.	Try to imagine what each word could be …. Would the same letter that is missing complete the other words correctly?\n\n"
                              //     "6.	Once you figure out 10 replaces P, select the number 10 in the grid and tap on the letter P. Thus, all the 10s in the puzzle will be changed to the letter P.\n\n"
                              //     "7.	If It’s not that letter. Try to think of a letter that would make all the incomplete words into complete meaningful words.\n\n"
                              //     "8.	You can always use a hint option for your ease.\n\n"
                              //     "9.	Also, you can try different levels of the game starting from easy to impossible.To double the fun, don’t miss out on the daily challenges.\n\n"
                              //     "Sit back and enjoy the  brain storming challenges with your family and friends!",

                              "Below Letters you entered was Incorrect: \n\n     ${data.replaceAll(',', ', ')}\n\nPlease correct this to complete the puzzle.",

                              textAlign: TextAlign.justify,

                              style: TextStyle(
                                color: Color(0xffffffff),
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                // fontSize: 13,
                                /*fontSize: 15,*/
                                fontSize: isTablat?20:15,
                              ),

                            ),
                          ),

                          // InkWell(
                          //   onTap: () async {
                          //
                          //     // (!user["sound"])? null :
                          //     //     Sounds.buttonClick;
                          //
                          //     final link = "https://youtu.be/8TMs1JW9cpQ";
                          //     // final link = "youtube://youtu.be/8TMs1JW9cpQ";
                          //
                          //     // if(await canLaunchUrl(Uri.parse("$link"))){
                          //     //   await launchUrl(Uri.parse("$link"));
                          //     // }
                          //
                          //
                          //     final subLink = link.substring(5);
                          //     final iosLink = 'youtube$subLink';
                          //
                          //     if(Platform.isIOS){
                          //       if(await canLaunchUrl(Uri.parse("$subLink"))){
                          //         await launchUrl(Uri.parse("$subLink"));
                          //       }else{
                          //         if(await canLaunchUrl(Uri.parse("$iosLink"))){
                          //           await launchUrl(Uri.parse("$iosLink"));
                          //         }else{
                          //           Dialogs.dialogAlert(context, "Could not launch link!", "Tutorial Error!");
                          //         }
                          //       }
                          //     }else{
                          //       if(await canLaunchUrl(Uri.parse("$link"))){
                          //         await launchUrl(Uri.parse("$link"));
                          //       }else{
                          //         Dialogs.dialogAlert(context, "Could not launch link!", "Tutorial Error!");
                          //       }
                          //     }
                          //     /**/
                          //
                          //     //com.google.ios.youtube
                          //     // await LaunchApp.isAppInstalled(
                          //     //   androidPackageName: 'com.google.android.youtube',
                          //     //   iosUrlScheme: 'youtube://',
                          //     // );
                          //
                          //     // await LaunchApp.openApp(
                          //     //   androidPackageName: 'com.google.android.youtube',
                          //     //   iosUrlScheme: 'youtube://',
                          //     //   appStoreLink: 'itms-apps://itunes.apple.com/us/app/pulse-secure/id945832041'
                          //     // );
                          //
                          //   },
                          //   child: Container(
                          //     child: const Text(
                          //       "View Tutorial",
                          //       style: TextStyle(
                          //         // color: Color(0xffffffff),
                          //         color: Colors.orange,
                          //         fontFamily: 'Roboto',
                          //         fontWeight: FontWeight.w600,
                          //         fontSize: 16,
                          //       ),
                          //     ),
                          //   ),
                          // ),

                          // Container(
                          //   padding: const EdgeInsets.all(20),
                          //   child: AspectRatio(
                          //     aspectRatio: vPlayer.value.aspectRatio,
                          //     child: Stack(
                          //       alignment: Alignment.bottomCenter,
                          //       children: <Widget>[
                          //         VideoPlayer(vPlayer),
                          //         _ControlsOverlay(controller: vPlayer),
                          //         VideoProgressIndicator(vPlayer, allowScrubbing: true),
                          //       ],
                          //     ),
                          //   ),
                          // ),

                          //video
                          // Container(
                          //   margin: EdgeInsets.all(20),
                          //   child: VlcPlayer(
                          //     controller: vlc,
                          //     // aspectRatio: 16 / 9,
                          //     aspectRatio: 7 / 16,
                          //     // aspectRatio: 3 / 6,
                          //     placeholder: Center(child: CircularProgressIndicator()),
                          //   ),
                          // ),

                          // SizedBox(height: 50,),

                        ],
                      ),
                    ),
                  ),
                ),

                Positioned(
                  // top: -30,
                  // right: -30,
                  top: 0,
                  // right: 10,
                  right: 0,

                  // top:MediaQuery.of(context).size.width,

                  child: GestureDetector(
                    // onTap: (){
                    //   Navigator.of(context).pop();
                    // },
                    onTap: () async {
                      // Navigator.of(context).pop();

                      // await methods.playSound(file: "soundscrate-graphics-game-blip-2")
                      // // await methods.playSound(file: "Wooden-Button-Click-Sound-Effect")
                      //     .then((value) {
                      //   Navigator.of(context).pop();
                      // });

                      // await vlc.stopRendererScanning();
                      // await vlc.dispose();

                      // (!user["sound"])? null :
                      // await Sounds.buttonClick;
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      // height: 60,
                      // width: 60,
                      // height: 50,
                      // width: 50,
                      /*height: (50*scale)/mockupHeight*height,
                      width: (50*scale)/mockupWidth*width,*/
                      height: isTablat?60:(50*scale)/mockupHeight*height,
                      width: isTablat?60:(50*scale)/mockupWidth*width,
                      decoration: BoxDecoration(
                        // color: Color(0xff1E7455),
                        color: Color(0xffC3333C),
                        // color: Color(0xffffffff),
                        // border: Border.all(width: 5, color: Color(0xffffffff)),
                        border: Border.all(width: 3, color: Color(0xffFFFDF9)),
                        borderRadius: BorderRadius.circular(180),
                        //drop shadow effect
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.black.withOpacity(0.25),
                        //     spreadRadius: 4,
                        //     blurRadius: 4,
                        //     offset: const Offset(0,4),
                        //   ),
                        // ],
                      ),
                      child: Image.asset("assets/images/close.png", scale: 3 * scale,),
                    ),
                  ),
                ),

              ],
            ),
          );
        }),
  );
}

Dialog dialogQuery (BuildContext context, DocumentSnapshot user){

  Size display = MediaQuery.of(context).size;
  double width = display.width;
  double height = display.height;

  const mockupWidth = 390;
  const mockupHeight = 844;

  final scale = mockupWidth / width;

  final bool isTablat = width>500 && height>800?true:false;
  // late VideoPlayerController vPlayer;
  // vPlayer = VideoPlayerController.asset('assets/video/Puzzle_Game_Tutorial.mp4');

  // VlcPlayerController vlc = VlcPlayerController
    //   .network(
    // 'https://media.w3.org/2010/05/sintel/trailer.mp4',

    // hwAcc: HwAcc.FULL,
  //   hwAcc: HwAcc.auto,
  //   autoPlay: false,
  //   options: VlcPlayerOptions(),
  // );

  // VlcPlayerController vlc = VlcPlayerController
  //     .asset('assets/video/Puzzle_Game_Tutorial.mp4', autoPlay: true);

  return Dialog(
    elevation: 0,
    // insetPadding: EdgeInsets.all(10),
    insetPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
    backgroundColor: Colors.transparent,
    alignment: Alignment.center,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ), //this right here
    child: StatefulBuilder(
        builder: (context, setState) {

          print("width ${MediaQuery.of(context).size.width}");
          print("height ${MediaQuery.of(context).size.height}");

          // return Theme(
          //   data: Theme.of(context).copyWith(
          //       colorScheme: ColorScheme.light(
          //         // primary: Colors.yellow,
          //         // onPrimary: Colors.black,
          //         // onSurface: Colors.teal,
          //         primary: Colors.red,
          //         onPrimary: Colors.white,
          //         onSurface: Colors.black,
          //       ),
          //       textButtonTheme: TextButtonThemeData(
          //           style: TextButton.styleFrom(
          //             // primary: Colors.teal
          //               primary: Colors.black
          //           )
          //       )
          //   ),
          //   child:
          // );

          // vPlayer.addListener(() {
          //   setState(() {});
          // });
          // // vPlayer.setLooping(true);
          // vPlayer.initialize().then((_) => setState(() {}));
          // vPlayer.play();

          return Container(
            // height: 506,
            // width: 364,
            // color: Colors.transparent,
            // color: Color(0xff1C1C1C).withOpacity(1),

            // width: 364,
            // height: 506,

            child: Stack(
              children: [

                Container(
                  // height: 506-20,
                  // width: 364-20,

                  // height: 506,
                  // width: 364,

                  height: (506*scale)/mockupHeight*height,
                  width: (364*scale)/mockupWidth*width,

                  // margin: EdgeInsets.all(20),
                  // margin: EdgeInsets.all(25),
                  margin: EdgeInsets.all(
                      MediaQuery.of(context).size.width*0.025
                      // (MediaQuery.of(context).size.width*0.025*scale)/m
                  ),
                  // margin: EdgeInsets.symmetric(
                  //     horizontal: 10,
                  //     vertical: 12
                  // ),

                  decoration: BoxDecoration(
                    // color: Color(0xff1E7455),
                    // color: Color(0xffffffff),
                    color: colors.white,
                    // color: Colors.transparent,
                    // border: Border.all(width: 20, color:  Color(0xffffff)),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Container(
                    // height: 506-10,
                    // width: 364-10,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      // color: Color(0xff1E7455),
                      color: colors.green,
                      // color: Color(0xffffffff),
                      // border: Border.all(width: 15, color:  Color(0xffffffff)),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Container(
                            // width: 308,
                            width: MediaQuery.of(context).size.width,
                            // height: 231,
                            padding: EdgeInsets.all(17),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    colors.green,
                                    colors.lightGreen
                                  ]
                              ),
                            ),
                            child: Text(
                              "How to Play",
                              style: TextStyle(
                                color: Color(0xffffffff),
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                // fontSize: 20,
                                fontSize: ((width<=360?16:20)*scale)/mockupWidth*width,
                              ),

                            ),
                          ),

                          Container(
                            // width: 308,
                            // height: 126,
                            width: (308*scale)/mockupWidth*width,
                            height: (126*scale)/mockupHeight*height,
                            margin: EdgeInsets.all(17),
                            decoration: BoxDecoration(
                              // color: Colors.transparent,
                              // border: Border.all(width: 2, color: Color(0xffffffff)),
                              // borderRadius: BorderRadius.circular(20),

                              image: DecorationImage(
                                image: ExactAssetImage(
                                  "assets/images/Rectangle 26.png",
                                ),
                                fit: BoxFit.fill,
                                // fit: BoxFit.cover,
                                scale: 4*scale,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  // top: 15,
                                  // // left: MediaQuery.of(context).size.width/15,
                                  // left: (MediaQuery.of(context).size.width/16),

                                  top: (15*scale)/mockupHeight*height,
                                  // left: ((MediaQuery.of(context).size.width/16)*scale)/mockupWidth*width,
                                  left: ((width<=360?5:(MediaQuery.of(context).size.width/16))*scale)/mockupWidth*width,
                                  // left: ((width<=360?(MediaQuery.of(context).size.width/32):(MediaQuery.of(context).size.width/16))*scale)/mockupWidth*width,

                                  child: Image.asset(
                                    "assets/images/image 4.png",
                                    // height: 36,
                                    // width: 213,
                                    // scale: 4.7,
                                    height: (36*scale)/mockupHeight*height,
                                    width: (213*scale)/mockupWidth*width,
                                    // scale: 4.7 * scale,
                                    scale: (width<=360?4:4.7) * scale,
                                  ),

                                //   child: Expanded(
                                //     child: Image.asset(
                                //       "assets/images/image 4.png",
                                //       height: 36,
                                //       width: 213,
                                //       scale: 4.7,
                                //     ),
                                //   ),

                                ),

                                Positioned(
                                  // top: 19,
                                  // // left: 46,
                                  // left: (MediaQuery.of(context).size.width/16)+46/2.7,

                                  top: (19*scale)/mockupHeight*height,
                                  // left: (((MediaQuery.of(context).size.width/16)+46/2.7)*scale)/mockupWidth*width,
                                  left: ((width<=360?25:((MediaQuery.of(context).size.width/16)+46/2.7))*scale)/mockupWidth*width,
                                  child: Text(
                                    "13",
                                    style: TextStyle(
                                      color: Color(0xffffffff),
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w400,
                                      // fontSize: 8,
                                      fontSize: 8*scale/mockupWidth*width,
                                    ),

                                  ),
                                ),
                                Positioned(
                                  // top: 19,
                                  // // right: 55,
                                  // right: (MediaQuery.of(context).size.width/16)+46/1.4,

                                  top: (19*scale)/mockupHeight*height,
                                  // right: (((MediaQuery.of(context).size.width/16)+46/1.4)*scale)/mockupWidth*width,
                                  right: ((width<=360?48:((MediaQuery.of(context).size.width/16)+46/1.4))*scale)/mockupWidth*width,

                                  child: Text(
                                    "13",
                                    style: TextStyle(
                                      color: Color(0xffffffff),
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 8,
                                    ),

                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            // width: 308,
                            // height: 231,
                            width: (308*scale)/mockupWidth*width,
                            height: (231*scale)/mockupHeight*height,
                            margin: EdgeInsets.all(17),
                            child: const Text(
                              // "The aim of CodeWords is to complete a grid of words"
                              //     " where you're given only a number in the places"
                              //     " where each letter will go."
                              //     "\n\n"
                              //     "The same number is used for the letter throughout"
                              //     " the grid, and your task is to work out which number"
                              //     " represents each letter!"
                              //     "\n\n"
                              //     "Correctly deduce (or guess!) all 26 and"
                              //     " you'll have cracked the code to complete"
                              //     " the puzzle.",

                              // "In a codeword puzzle, some letters of the alphabet have been replaced by numbers."
                              // "your goal is to find out which letter is represented by which number. you are given some letters to start.\n\n"
                              // "There is only one letter missing in this world. which one?\n"
                              // "The only word that makes sense is \"THEMES\".\n"
                              // "We can now fill all cells with the number 25 with a T.\n\n"
                              // "Use this new letter to help you find other words, and so on until the puzzle is solved completely.\n"
                              // "If you are stuck, you can open the top-right menu to get a hint. Have fun!",

                              "1.	In the puzzle, you can see a grid with numbers and few letters.\n\n"
                              "2.	The aim of the game is to complete the crossword with appropriate letter in place of a particular number to make a meaningful word.\n\n"
                              "3.	For example, select a number 10, so now you need to work out to find which letter can replace all the 10s in the puzzle with that letter.\n\n"
                              "4.	It will be one of these letters below - one that isn’t blanked off already.\n\n"
                              "5.	Try to imagine what each word could be …. Would the same letter that is missing complete the other words correctly?\n\n"
                              "6.	Once you figure out 10 replaces P, select the number 10 in the grid and tap on the letter P. Thus, all the 10s in the puzzle will be changed to the letter P.\n\n"
                              "7.	If It’s not that letter. Try to think of a letter that would make all the incomplete words into complete meaningful words.\n\n"
                              "8.	You can always use a hint option for your ease.\n\n"
                              "9.	Also, you can try different levels of the game starting from easy to impossible.To double the fun, don’t miss out on the daily challenges.\n\n"
                              "Sit back and enjoy the  brain storming challenges with your family and friends!",

                              textAlign: TextAlign.justify,

                              style: TextStyle(
                                color: Color(0xffffffff),
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                              ),

                            ),
                          ),

                          InkWell(
                            onTap: () async {

                              // (!user["sound"])? null :
                              //     Sounds.buttonClick;

                              final link = "https://youtu.be/8TMs1JW9cpQ";
                              // final link = "youtube://youtu.be/8TMs1JW9cpQ";

                              // if(await canLaunchUrl(Uri.parse("$link"))){
                              //   await launchUrl(Uri.parse("$link"));
                              // }


                              final subLink = link.substring(5);
                              final iosLink = 'youtube$subLink';

                              if(Platform.isIOS){
                                if(await canLaunchUrl(Uri.parse("$subLink"))){
                                  await launchUrl(Uri.parse("$subLink"));
                                }else{
                                  if(await canLaunchUrl(Uri.parse("$iosLink"))){
                                    await launchUrl(Uri.parse("$iosLink"));
                                  }else{
                                    Dialogs.dialogAlert(context, "Could not launch link!", "Tutorial Error!");
                                  }
                                }
                              }else{
                                if(await canLaunchUrl(Uri.parse("$link"))){
                                  await launchUrl(Uri.parse("$link"));
                                }else{
                                  Dialogs.dialogAlert(context, "Could not launch link!", "Tutorial Error!");
                                }
                              }
                              /**/

                              //com.google.ios.youtube
                              // await LaunchApp.isAppInstalled(
                              //   androidPackageName: 'com.google.android.youtube',
                              //   iosUrlScheme: 'youtube://',
                              // );

                              // await LaunchApp.openApp(
                              //   androidPackageName: 'com.google.android.youtube',
                              //   iosUrlScheme: 'youtube://',
                              //   appStoreLink: 'itms-apps://itunes.apple.com/us/app/pulse-secure/id945832041'
                              // );

                            },
                            child: Container(
                              child: const Text(
                                "View Tutorial",
                                style: TextStyle(
                                  // color: Color(0xffffffff),
                                  color: Colors.orange,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),

                          // Container(
                          //   padding: const EdgeInsets.all(20),
                          //   child: AspectRatio(
                          //     aspectRatio: vPlayer.value.aspectRatio,
                          //     child: Stack(
                          //       alignment: Alignment.bottomCenter,
                          //       children: <Widget>[
                          //         VideoPlayer(vPlayer),
                          //         _ControlsOverlay(controller: vPlayer),
                          //         VideoProgressIndicator(vPlayer, allowScrubbing: true),
                          //       ],
                          //     ),
                          //   ),
                          // ),

                          //video
                          // Container(
                          //   margin: EdgeInsets.all(20),
                          //   child: VlcPlayer(
                          //     controller: vlc,
                          //     // aspectRatio: 16 / 9,
                          //     aspectRatio: 7 / 16,
                          //     // aspectRatio: 3 / 6,
                          //     placeholder: Center(child: CircularProgressIndicator()),
                          //   ),
                          // ),

                          SizedBox(height: 50,),

                        ],
                      ),
                    ),
                  ),
                ),

                Positioned(
                  // top: -30,
                  // right: -30,
                  top: 0,
                  // right: 10,
                  right: 0,

                  // top:MediaQuery.of(context).size.width,

                  child: GestureDetector(
                    // onTap: (){
                    //   Navigator.of(context).pop();
                    // },
                    onTap: () async {
                      // Navigator.of(context).pop();

                      // await methods.playSound(file: "soundscrate-graphics-game-blip-2")
                      // // await methods.playSound(file: "Wooden-Button-Click-Sound-Effect")
                      //     .then((value) {
                      //   Navigator.of(context).pop();
                      // });

                      // await vlc.stopRendererScanning();
                      // await vlc.dispose();

                      // (!user["sound"])? null :
                      // await Sounds.buttonClick;
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      // height: 60,
                      // width: 60,
                      // height: 50,
                      // width: 50,
                      /*height: (50*scale)/mockupHeight*height,
                      width: (50*scale)/mockupWidth*width,*/
                      height: isTablat?60:(50*scale)/mockupHeight*height,
                      width: isTablat?60:(50*scale)/mockupWidth*width,
                      decoration: BoxDecoration(
                        // color: Color(0xff1E7455),
                        color: Color(0xffC3333C),
                        // color: Color(0xffffffff),
                        // border: Border.all(width: 5, color: Color(0xffffffff)),
                        border: Border.all(width: 3, color: Color(0xffFFFDF9)),
                        borderRadius: BorderRadius.circular(180),
                        //drop shadow effect
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.black.withOpacity(0.25),
                        //     spreadRadius: 4,
                        //     blurRadius: 4,
                        //     offset: const Offset(0,4),
                        //   ),
                        // ],
                      ),
                      child: Image.asset("assets/images/close.png", scale: 3 * scale,),
                    ),
                  ),
                ),

              ],
            ),
          );
        }),
  );
}

Dialog dialogPoints (BuildContext context, DocumentSnapshot user){

  Size display = MediaQuery.of(context).size;
  double width = display.width;
  double height = display.height;

  const mockupWidth = 390;
  const mockupHeight = 844;

  final scale = mockupWidth / width;

  final bool isTablat = width>500 && height>800?true:false;

  return Dialog(
    elevation: 0,
    // insetPadding: EdgeInsets.all(10),
    // insetPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
    insetPadding: EdgeInsets.symmetric(horizontal: (30*scale)/mockupWidth*width, vertical: 10),
    backgroundColor: Colors.transparent,
    alignment: Alignment.center,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ), //this right here
    child: StatefulBuilder(
        builder: (context, setState) {

          print("width ${MediaQuery.of(context).size.width}");
          print("height ${MediaQuery.of(context).size.height}");

          // return Theme(
          //   data: Theme.of(context).copyWith(
          //       colorScheme: ColorScheme.light(
          //         // primary: Colors.yellow,
          //         // onPrimary: Colors.black,
          //         // onSurface: Colors.teal,
          //         primary: Colors.red,
          //         onPrimary: Colors.white,
          //         onSurface: Colors.black,
          //       ),
          //       textButtonTheme: TextButtonThemeData(
          //           style: TextButton.styleFrom(
          //             // primary: Colors.teal
          //               primary: Colors.black
          //           )
          //       )
          //   ),
          //   child:
          // );

          return Container(
            // height: 506,
            // width: 364,
            // color: Colors.transparent,
            // color: Color(0xff1C1C1C).withOpacity(1),

            // width: 364,
            // height: 506,

            child: Stack(
              children: [

                Container(
                  // height: 506-20,
                  // width: 364-20,

                  // height: 506,
                  // width: 364,
                  /*height: (506*scale)/mockupHeight*height,
                  width: (364*scale)/mockupWidth*width,*/
                  height: isTablat?556:(506*scale)/mockupHeight*height,
                  width: isTablat?464:(364*scale)/mockupWidth*width,

                  // margin: EdgeInsets.all(20),
                  // margin: EdgeInsets.all(25),
                  margin: EdgeInsets.all(
                      MediaQuery.of(context).size.width*0.025
                  ),
                  // margin: EdgeInsets.symmetric(
                  //     horizontal: 10,
                  //     vertical: 12
                  // ),

                  decoration: BoxDecoration(
                    // color: Color(0xff1E7455),
                    // color: Color(0xffffffff),
                    color: colors.white,
                    // color: Colors.transparent,
                    // border: Border.all(width: 20, color:  Color(0xffffff)),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Container(
                    // height: 506-10,
                    // width: 364-10,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      // color: Color(0xff1E7455),
                      color: colors.green,
                      // color: Color(0xffffffff),
                      // border: Border.all(width: 15, color:  Color(0xffffffff)),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Container(
                            // width: 308,
                            width: MediaQuery.of(context).size.width,
                            // height: 231,
                            padding: EdgeInsets.all(17),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    colors.green,
                                    colors.lightGreen
                                  ]
                              ),
                            ),
                            child: Text(
                              "My Points",
                              style: TextStyle(
                                color: Color(0xffffffff),
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                // fontSize: 20,
                                /*fontSize: ((width<=360?16:20)*scale)/mockupWidth*width,*/
                                fontSize: isTablat?28:((width<=360?16:20)*scale)/mockupWidth*width,
                              ),

                            ),
                          ),

                          // Container(
                          //   width: 308,
                          //   height: 126,
                          //   margin: EdgeInsets.all(17),
                          //   decoration: const BoxDecoration(
                          //     // color: Colors.transparent,
                          //     // border: Border.all(width: 2, color: Color(0xffffffff)),
                          //     // borderRadius: BorderRadius.circular(20),
                          //
                          //     image: DecorationImage(
                          //       image: ExactAssetImage(
                          //         "assets/images/Rectangle 26.png",
                          //       ),
                          //       fit: BoxFit.fill,
                          //       // fit: BoxFit.cover,
                          //     ),
                          //   ),
                          //   child: Stack(
                          //     children: [
                          //       Positioned(
                          //         top: 15,
                          //         // left: MediaQuery.of(context).size.width/15,
                          //         left: (MediaQuery.of(context).size.width/16),
                          //         child: Image.asset(
                          //           "assets/images/image 4.png",
                          //           height: 36,
                          //           width: 213,
                          //           scale: 4.7,
                          //         ),
                          //       ),
                          //
                          //       Positioned(
                          //         top: 19,
                          //         // left: 46,
                          //         left: (MediaQuery.of(context).size.width/16)+46/2.7,
                          //         child: Text(
                          //           "13",
                          //           style: TextStyle(
                          //             color: Color(0xffffffff),
                          //             fontFamily: 'Roboto',
                          //             fontWeight: FontWeight.w400,
                          //             fontSize: 8,
                          //           ),
                          //
                          //         ),
                          //       ),
                          //       Positioned(
                          //         top: 19,
                          //         // right: 55,
                          //         right: (MediaQuery.of(context).size.width/16)+46/1.4,
                          //         child: Text(
                          //           "13",
                          //           style: TextStyle(
                          //             color: Color(0xffffffff),
                          //             fontFamily: 'Roboto',
                          //             fontWeight: FontWeight.w400,
                          //             fontSize: 8,
                          //           ),
                          //
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),

                          SizedBox(height: 10,),
                          Container(
                            // width: 308,
                            // height: 60,
                            /*width: (308*scale)/mockupWidth*width,*/
                            /*height: (60*scale)/mockupHeight*height,*/
                            width: (isTablat?350:308*scale)/mockupWidth*width,
                            height: (isTablat?70:60*scale)/mockupHeight*height,
                            margin: EdgeInsets.all(17),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  // height: 60,
                                  // width: 60,
                                  // height: 50,
                                  // width: 50,
                                  /*height: (50*scale)/mockupHeight*height,
                                  width: (50*scale)/mockupWidth*width,*/
                                  height: (isTablat?55:50*scale)/mockupHeight*height,
                                  width: (isTablat?55:50*scale)/mockupWidth*width,
                                  // height: 43,
                                  // width: 43,
                                  decoration: BoxDecoration(
                                    // color: Color(0xff1E7455),
                                    // color: Color(0xffC3333C),
                                    // color: Color(0xffffffff),
                                    // color: colors.white,
                                    // border: Border.all(width: 5, color: Color(0xffffffff)),
                                    border: Border.all(width: 1, color: Color(0xffFFFDF9)),
                                    borderRadius: BorderRadius.circular(180),
                                    //drop shadow effect
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //     color: Colors.black.withOpacity(0.25),
                                    //     spreadRadius: 4,
                                    //     blurRadius: 4,
                                    //     offset: const Offset(0,4),
                                    //   ),
                                    // ],
                                  ),
                                  // child: Image.asset("assets/images/close.png", scale: 3,),
                                  child: CircleAvatar(
                                    radius: 180,
                                    backgroundImage:
                                    // user["pic"]==null?
                                    // MemoryImage(CupertinoIcons.person_alt)
                                    // :
                                    NetworkImage(
                                      //"https://s3-alpha-sig.figma.com/img/3db4/1314/ecfc86a48fc2d1edf4b52bef6fba5259?Expires=1652054400&Signature=NQy0tJ84IJHrwQBvR2A6eg6ZYiUNEubUpUHOOl~Anoag81gPnNUhJlWVnXAWEBK5If5-XEqMJuYcp2aNhOTsOLkDxXhRvYlL3VY~RsbKsw2LOJGebgkoG3wfl8TBb0huTeQDpQxbgZ6o2iNlkt2~PvHAPSQ1nLRIVyeXJasZMIY9SobtkK45-JJ16S4Ov7KvUYamN2eLvloBIMqlPo5sLkBeKhNz8vwlnZJWFuwSRPl4ykaaJY1ZhhPELeb4wdhIJDzNOCkveJXBx7VDP77hyr3GSKXyUuqRe79a4-3tR-aytElpuJvo1H5~pbzd0v16kC8tgZDIGtvR9VUkkP2XbQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
                                      user["pic"] ?? "",
                                      // "",
                                      // fit: BoxFit.cover,
                                    ),
                                    backgroundColor: colors.white,
                                  ),
                                ),
                                SizedBox(width: 14,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(//"Dreamy Pooh",
                                      user["name"] ?? "NA",

                                      textAlign: TextAlign.justify,

                                      style: TextStyle(
                                        color: Color(0xffffffff),
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w700,
                                        // fontSize: (width<=360?16:20*scale)/mockupWidth*width,
                                        // fontSize: ((width<=360?14:20)*scale)/mockupWidth*width,
                                        /*fontSize: (width<=360?14:((user["name"] as String).length>14?17:20)*scale)/mockupWidth*width,*/
                                        fontSize: isTablat?20:(width<=360?14:((user["name"] as String).length>14?17:20)*scale)/mockupWidth*width,
                                      ),

                                    ),
                                    SizedBox(height: 3,),
                                    Row(
                                      children: [
                                        Text( //"+3",
                                          // "  ",
                                          "",
                                          textAlign: TextAlign.justify,

                                          style: TextStyle(
                                            color: Color(0xffffffff),
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                          ),

                                        ),
                                        SizedBox(width: 2,),
                                        Image.asset("assets/images/Polygon 1.png", scale: 4 * scale,),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          Container(
                            // width: 308,
                            // height: 75,
                            /*height: (75*scale)/mockupHeight*height,*/
                            height: isTablat?85:(75*scale)/mockupHeight*height,
                            width: MediaQuery.of(context).size.width,
                            color: colors.white,
                            // margin: EdgeInsets.all(17),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Total Points   :   ",

                                  textAlign: TextAlign.justify,

                                  style: TextStyle(
                                    color: colors.green,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w700,
                                    // fontSize: 15,
                                    /*fontSize: ((width<=360?12:15)*scale)/mockupWidth*width,*/
                                    fontSize: isTablat?22:((width<=360?12:15)*scale)/mockupWidth*width,
                                  ),

                                ),

                                Text(//"2,822",
                                  // '${user["points"]}' ?? "",
                                  // '${user["points"] ?? ""}',
                                  '${user["history.total_points"] ?? "0"}',

                                  textAlign: TextAlign.justify,

                                  style: TextStyle(
                                    color: colors.green,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w700,
                                    // fontSize: 25,
                                    /*fontSize: ((width<=360?18:25)*scale)/mockupWidth*width,*/
                                    fontSize: isTablat?28:((width<=360?18:25)*scale)/mockupWidth*width,
                                  ),

                                ),
                              ],
                            ),
                          ),

                          Container(
                            // width: 308,
                            // height: 75,
                            width: MediaQuery.of(context).size.width,
                            // color: colors.white,
                            // margin: EdgeInsets.all(17),
                            margin: EdgeInsets.symmetric(vertical: 60),
                            alignment: Alignment.center,
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text("Total Game Played",
                                          style: TextStyle(
                                            color: colors.white,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w700,
                                            // fontSize: 12,
                                            /*fontSize: ((width<=360?10:12)*scale)/mockupWidth*width,*/
                                            fontSize: isTablat?18:((width<=360?10:12)*scale)/mockupWidth*width,
                                          ),

                                        ),

                                        SizedBox(height: 10,),

                                        Text(//"27",
                                          '${user["history"]["total_play"]}',
                                          style: TextStyle(
                                            color: colors.white,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w700,
                                            // fontSize: 20,
                                            /*fontSize: ((width<=360?14:20)*scale)/mockupWidth*width,*/
                                            fontSize: isTablat?24:((width<=360?14:20)*scale)/mockupWidth*width,
                                          ),

                                        ),
                                      ],
                                    ),

                                    Container(
                                      // height: 50,
                                      height: (50*scale)/mockupHeight*height,
                                      margin: EdgeInsets.symmetric(horizontal: 25),
                                      color: colors.white,
                                      child: SizedBox(width: 1,),
                                    ),

                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text("Total Hint Used",
                                          style: TextStyle(
                                            color: colors.white,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w700,
                                            // fontSize: 12,
                                            /*fontSize: ((width<=360?10:12)*scale)/mockupWidth*width,*/
                                            fontSize: isTablat?18:((width<=360?10:12)*scale)/mockupWidth*width,
                                          ),

                                        ),

                                        SizedBox(height: 10,),

                                        Text(//"110",
                                          '${user["history"]["total_hint"]}',
                                          style: TextStyle(
                                            color: colors.white,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w700,
                                            // fontSize: 20,
                                            /*fontSize: ((width<=360?14:20)*scale)/mockupWidth*width,*/
                                            fontSize: isTablat?24:((width<=360?14:20)*scale)/mockupWidth*width,
                                          ),

                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                Container(
                                  margin: EdgeInsets.all(10),
                                  child: Text("Total Time",
                                    style: TextStyle(
                                      color: colors.white,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w700,
                                      // fontSize: 12,
                                      /*fontSize: ((width<=360?10:12)*scale)/mockupWidth*width,*/
                                      fontSize: isTablat?18:((width<=360?10:12)*scale)/mockupWidth*width,
                                    ),

                                  ),
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(5),
                                      child: Text(//"5 Hours",
                                        //'${user["history"]["total_time"]}',
                                        '${(user["history"]["total_time"] as String).split(":")[0]} Hours',
                                        style: TextStyle(
                                          color: colors.white,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w700,
                                          // fontSize: 17,
                                          /*fontSize: ((width<=360?13:17)*scale)/mockupWidth*width,*/
                                          fontSize: isTablat?24:((width<=360?13:17)*scale)/mockupWidth*width,
                                        ),

                                      ),
                                    ),
                                    Container(
                                      // margin: EdgeInsets.all(5),
                                      margin: EdgeInsets.all(10),
                                      child: Text(//"27 Min.",
                                        '${(user["history"]["total_time"] as String).split(":")[1]} Min.',
                                        style: TextStyle(
                                          color: colors.white,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w700,
                                          /*fontSize: 12,*/
                                          fontSize: isTablat?18:((width<=360?12:12)*scale)/mockupWidth*width,
                                        ),

                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),

                Positioned(
                  // top: -30,
                  // right: -30,
                  top: 0,
                  // right: 10,
                  right: 0,

                  // top:MediaQuery.of(context).size.width,

                  child: GestureDetector(
                    // onTap: (){
                    //   Navigator.of(context).pop();
                    // },
                    onTap: () async {
                      // Navigator.of(context).pop();

                      // await methods.playSound(file: "soundscrate-graphics-game-blip-2")
                      // // await methods.playSound(file: "Wooden-Button-Click-Sound-Effect")
                      //     .then((value) {
                      //   Navigator.of(context).pop();
                      // });

                      // (!user["sound"])? null :
                      // await Sounds.buttonClick;
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      // height: 60,
                      // width: 60,
                      // height: 50,
                      // width: 50,
                      /*height: (50*scale)/mockupHeight*height,
                      width: (50*scale)/mockupWidth*width,*/
                      height: isTablat?60:(50*scale)/mockupHeight*height,
                      width: isTablat?60:(50*scale)/mockupWidth*width,
                      decoration: BoxDecoration(
                        // color: Color(0xff1E7455),
                        color: Color(0xffC3333C),
                        // color: Color(0xffffffff),
                        // border: Border.all(width: 5, color: Color(0xffffffff)),
                        border: Border.all(width: 3, color: Color(0xffFFFDF9)),
                        borderRadius: BorderRadius.circular(180),
                        //drop shadow effect
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.black.withOpacity(0.25),
                        //     spreadRadius: 4,
                        //     blurRadius: 4,
                        //     offset: const Offset(0,4),
                        //   ),
                        // ],
                      ),
                      child: Image.asset("assets/images/close.png", scale: 3 * scale,),
                      /*child: Image.asset("assets/images/close.png", scale: isTablat?4:3 * scale,),*/
                    ),
                  ),
                ),

              ],
            ),
          );
        }),
  );
}

/*
dialogMenu (BuildContext context, MAudio? mAudio, DocumentSnapshot user) {//usr

  Size display = MediaQuery.of(context).size;
  double width = display.width;
  double height = display.height;

  const mockupWidth = 390;
  const mockupHeight = 844;

  final scale = mockupWidth / width;

  bool isSettings=true, isFaq=false;
  // bool isSound=true, isMusic=true, isAlarm=true;
  // late bool isSettings, isFaq;
  late bool isSound, isMusic, isAlarm, isTimer;

      // isSound = user["sound"] as bool;
      // isMusic = user["music"] as bool;
      // isAlarm = user["notification"] as bool;

      try{
        isSound = user["sound"] as bool;
        isMusic = user["music"] as bool;
        isAlarm = user["notification"] as bool;
        isTimer = user["timer"] as bool;
      }catch(e){
        if(isSound==null) isSound = true;
        if(isMusic==null) isMusic = true;
        if(isAlarm==null) isAlarm = true;
        if(isTimer==null) isTimer = true;
      }

  // late DocumentSnapshot user;

  // final faqs = [
  //   {
  //     "title": "1. Aliquet lorem cursus tincidunt mauris faucibus?",
  //     "subtext":"suspendisse Amet sit proin tristique ut adipiscing sit quam sem tortor."
  //   },
  //   {
  //     "title": "2. Lacus ullamcorper dolor eleifend auctor elit?",
  //     "subtext":"dolor magna tempor condimentum egestas sit sit sed Tellus."
  //   },
  //   {
  //     "title": "3. habitasse nulla sit mauris?",
  //     "subtext":"molestie sagittis malesuada mauris augue."
  //   },
  //   {
  //     "title": "4. facilisis velit eu ac congue tortor. Augue at integ?",
  //     "subtext":"ullamcorper diam adipiscing volutpat non. Ultrices cursus."
  //   },
  //   {
  //     "title": "5. molestie sagittis malesuada mauris augue?",
  //     "subtext":"Aliquet lorem cursus tincidunt mauris faucibus."
  //   },
  // ];

  */
/*
  final faqs = [
    {
      "title": "1. What are the rules of Codewords?",
      "subtext":"The rule of codewords is to find out which number represents each letter from A - Z in the grid.\n\n"
          "once you have figured out the number, go through the grid and replace the instance of a number once with the letter that it represents and rest would automatically change.\n\n"
          "For example, if you know that 12 = E, then select the number 12 from the grid then all the number 12 would automatically change to letter E, and remember to cross off E on the letter grid underneath so you know it is placed."
    },
    // {
    //   "title": "1. What are the rules of Codewords?",
    //   "subtext":"The rules of codewords are to work out which number represents each letter from A - Z in the grid.\n\n"
    //   "You then must go through the grid and replace each instance of a number with the letter that it represents, once you've worked it out.\n\n"
    //   "Thus if you know that 12 = E, then go through and write an E in for each instance of 12, and remember to cross off E on the letter grid underneath so you know it is placed.\n\n"
    //   "Often you will be given some starter letters, so place these first."
    // },
    {
      "title": "2. What strategy tips will help me solve Codewords puzzles?",
      "subtext":"Look for the numbers that occur most frequently in the puzzle and use basic frequency analysis to realize that these are probably the E, T, and A in other words they correspond to the most common letters in the English language.-\n\n"
      "Use the given letters and fill these in and concentrate on seeing if they can be used to help you place any words and therefore other letters.\n\n"
      "Cross off from A - Z as you go through so you can easily see at a glance what else you have to place."
    },
  ];
  *//*


  */
/*final faqs = [
    {
      "title": "1. In the puzzle, Look for grid with numbers and few letters.",
      "subtext":""
    },
    {
      "title": "2. The aim of the game is to complete the crossword by replacing number with appropriate letter to make a meaningful word.",
      "subtext":""
    },
    {
      "title": "3. For example, select number “10”, now think, which letter can replace all the 10s in the puzzle.",
      "subtext":""
    },
    {
      "title": "4. It will be one of these letters below - one that isn’t blanked off already.",
      "subtext":""
    },
    {
      "title": "5. Try to imagine what each word could be!! Would the same letter that is missing can complete the other words correctly?",
      "subtext":""
    },
    {
      "title": "6. Once you figure out that letter  “P” can replace “10”, select number “10” in the grid and tap on the letter “P”. In result, all the “10s” in the puzzle will be replaced by letter “P”.",
      "subtext":""
    },
    {
      "title": "7. If It’s not that letter. Try to think of a letter that would make all the incomplete words into complete meaningful words.",
      "subtext":""
    },
    {
      "title": "8. You can always use a hint option for your ease.",
      "subtext":""
    },
    {
      "title": "9. Also, you can try different levels of the game starting from “Easy” to “Impossible”. To double the fun, don’t miss out on the daily challenges.",
      "subtext":""
    },
    {
      "title": "Sit back and enjoy the  brain storming challenges with your family and friends!",
      "subtext":""
    },
  ];
*/
/*


  final faqs = [
    {
      "title": "image",
      "subtext":"diagram1"
    },
    {
      "title": "",
      "subtext":"To complete the codewords click a number (eg.10) to see all similar numbers (eg. all 10s) become yellow. Then Click one of the Bold letters in the grid below (eg. V) to make all those numbers (eg all 10s) become those letters (eg. Vs)"
    },
    {
      "title": "image",
      "subtext":"diagram2"
    },
    {
      "title": "",
      "subtext":"Continue this pattern until the codeword is complete with words spelt correctly."
    },
    {
      "title": "image",
      "subtext":"diagram3"
    },
    {
      "title": "image",
      "subtext":"diagram4"
    },
    {
      "title": "",
      "subtext":"You can find hint letters by clicking the button at the top right corner,"
    },
    {
      "title": "image",
      "subtext":"diagram5"
    },
    {
      "title": "",
      "subtext":"but each hint letter will subtract a minute from your time as it counts down."
    },
    {
      "title": "Scoring points",
      "subtext":"You will score points for completing a puzzle and bonus points for completing within the target time."
    },
    {
      "title": "Correcting Mistakes",
      "subtext":"If you think you've made a mistake you can correct it by clicking the back button (bottom right), or by clicking on one the incorrect letters, then clicking on the correct  letter in the grid below it will alter all those incorrect letters."
    },
    {
      "title": "Leaderboard",
      "subtext":"Check your progress in the leaderboard on the home page."
    },
    {
      "title": "image",
      "subtext":"diagram6"
    },
    {
      "title": "",
      "subtext":"You can turn off the sound button and the timer if you like. Turning the timer off means that you’ll only score points for completing puzzles, but no bonus points for beating the target times."
    },
    // {
    //   "title": "",
    //   // "subtext":"You can turn off the clock, or the music on the home page if you like."
    //   "subtext":"You can turn off the button sound, and the music on the home page if you like."
    // },
    {
      "title": "image",
      "subtext":"diagram7"
    },
    // {
    //   "title": "",
    //   // "subtext":"You can turn off the clock, or the music on the home page if you like."
    //   "subtext":"You can turn off the clock on the home page if you like, but you get fixed points as per the rule. If you want to get more points then you can turn on the clock."
    // },
    {
      "title": "image",
      "subtext":"diagram8"
    },
  ];


  runService() async {
    try{
      await NotificationApi.init(context);

      // try{
      //   if(Background.backService!=null){
      //     Background().setForeground(Background.backService);
      //     Background().setBackground(Background.backService);
      //   }
      // }catch(e){
      //   print("service running err ->\n${e}");
      // }

      // final service = FlutterBackgroundService();
      FlutterBackgroundService service = FlutterBackgroundService();
      if(await service.isRunning()){
        print("ending old service...");
        service.invoke("stop");
        // print("initializing service...");
        // await initializeService();
      }else{
        print("initializing service...");
        await initializeService();

        service = FlutterBackgroundService();
        bool serviceRunning = await service.isRunning();
        print('serviceRunning $serviceRunning');
        if(service!=null && !serviceRunning){
          setForeground(service);
          setBackground(service);
        }

      }

      // service = FlutterBackgroundService();
      // bool serviceRunning = await service.isRunning();
      // print('serviceRunning $serviceRunning');
      // if(service!=null && !serviceRunning){
      //   setForeground(service);
      //   setBackground(service);
      // }


    }catch(e){
      print("err while service initializing\n\n${e}");
    }
  }


  showTransitionDialog(
    context: context,
    //child: dialogMenu(mAudio, user!),
    child: Dialog(
      elevation: 0,
      // insetPadding: EdgeInsets.all(10),
      // insetPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      insetPadding: EdgeInsets.symmetric(horizontal: (30*scale)/mockupWidth*width, vertical: 10),
      backgroundColor: Colors.transparent,
      alignment: Alignment.center,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ), //this right here
      child: StatefulBuilder(
          builder: (context, setState) {

            print("width ${MediaQuery.of(context).size.width}");
            print("height ${MediaQuery.of(context).size.height}");

            // return Theme(
            //   data: Theme.of(context).copyWith(
            //       colorScheme: ColorScheme.light(
            //         // primary: Colors.yellow,
            //         // onPrimary: Colors.black,
            //         // onSurface: Colors.teal,
            //         primary: Colors.red,
            //         onPrimary: Colors.white,
            //         onSurface: Colors.black,
            //       ),
            //       textButtonTheme: TextButtonThemeData(
            //           style: TextButton.styleFrom(
            //             // primary: Colors.teal
            //               primary: Colors.black
            //           )
            //       )
            //   ),
            //   child:
            // );

            // bool isSound=true, isMusic=true, isAlarm=true;

            // late DocumentSnapshot user;
            // bool isSettings=true, isFaq=false;
            // bool isSound=true, isMusic=true, isAlarm=true;

            // if(user==null){
            //   setState((){
            //     user = usr;
            //   });
            // }
            // if(isSound==null){
            //   setState((){
            //     isSound = user["sound"] as bool;
            //     isMusic = user["music"] as bool;
            //     isAlarm = user["notification"] as bool;
            //   });
            // }

            return Container(
              // height: 506,
              // width: 364,
              // color: Colors.transparent,
              // color: Color(0xff1C1C1C).withOpacity(1),

              // width: 364,
              // height: 506,

              child: Stack(
                children: [

                  Container(
                    // height: 506-20,
                    // width: 364-20,

                    // height: 506,
                    // width: 364,

                    height: (506*scale)/mockupHeight*height,
                    width: (364*scale)/mockupWidth*width,

                    // margin: EdgeInsets.all(20),
                    // margin: EdgeInsets.all(25),
                    margin: EdgeInsets.all(
                        MediaQuery.of(context).size.width*0.025
                    ),
                    // margin: EdgeInsets.symmetric(
                    //     horizontal: 10,
                    //     vertical: 12
                    // ),

                    decoration: BoxDecoration(
                      // color: Color(0xff1E7455),
                      // color: Color(0xffffffff),
                      // color: colors.white,
                      color: colors.white,
                      // color: Colors.transparent,
                      // border: Border.all(width: 20, color:  Color(0xffffff)),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Container(
                      // height: 506-10,
                      // width: 364-10,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        // color: Color(0xff1E7455),
                        color: colors.green,
                        // color: colors.white,
                        // color: Color(0xffffffff),
                        // border: Border.all(width: 15, color:  Color(0xffffffff)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            Container(
                              decoration: BoxDecoration(
                                // color: Color(0xff1E7455),
                                // color: Color(0xffffffff),
                                color: colors.white,
                                // color: Colors.transparent,
                                // border: Border.all(width: 20, color:  Color(0xffffff)),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () async {
                                        // setState((){isSettings = !isSettings; isFaq=false;});
                                        // setState((){isSettings=true; isFaq=false;});

                                        // await methods.playSound(file: "Mouse-click-Sound-Effect-No-Copyright")
                                        // await methods.playSound(file: "click1")
                                        //     .then((value) {
                                          // Future.delayed(const Duration(seconds: 1),(){

                                        (!user["sound"])? null :
                                        await Sounds.buttonClick;
                                        Future.delayed(const Duration(milliseconds: 200),() async {
                                            setState((){isSettings=true; isFaq=false;});
                                          });
                                        // });

                                      },

                                      child: Container(
                                        // width: 308,
                                        // width: (MediaQuery.of(context).size.width-105)/2,
                                        // width: 172-11,
                                        // height: 231,
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.all(17),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                          ),
                                          gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              // colors: [
                                              //   colors.green,
                                              //   colors.lightGreen
                                              // ]

                                              colors: isSettings?[
                                                colors.green,
                                                colors.lightGreen
                                              ]
                                                  :[
                                                colors.green.withOpacity(0.3),
                                                colors.lightGreen.withOpacity(0.3),
                                              ]

                                          ),

                                        ),
                                        child: Text(
                                          "Settings",
                                          style: TextStyle(
                                            // color: Color(0xffffffff),
                                            color: isSettings?colors.white:colors.green,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w700,
                                            // fontSize: 20,
                                            fontSize: ((width<=360?16:20)*scale)/mockupWidth*width,
                                          ),

                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () async {
                                        // setState((){isFaq = !isFaq; isSettings=false;});
                                        //setState((){isSettings=false; isFaq=true;});

                                        // await methods.playSound(file: "click1")
                                        //     .then((value) {
                                          // Future.delayed(const Duration(seconds: 1),(){

                                        (!user["sound"])? null :
                                        await Sounds.buttonClick;
                                          Future.delayed(const Duration(milliseconds: 200),() async {
                                            setState((){isSettings=false; isFaq=true;});
                                          });
                                        // });

                                      },
                                      child: Container(
                                        // width: 308,
                                        // width: MediaQuery.of(context).size.width,
                                        // width: MediaQuery.of(context).size.width/3,
                                        // width: 172-11,
                                        // width: (MediaQuery.of(context).size.width-105)/2,
                                        alignment: Alignment.center,
                                        // height: 231,
                                        padding: EdgeInsets.all(17),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                            // bottomRight: Radius.circular(0),
                                          ),
                                          gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              // colors: [
                                              //   // colors.green,
                                              //   // colors.lightGreen
                                              //   colors.green.withOpacity(0.3),
                                              //   colors.lightGreen.withOpacity(0.3),
                                              //
                                              //   // colors.green.withOpacity(0.3),
                                              //   // colors.lightGreen.withOpacity(0.3),
                                              // ]

                                              colors: isFaq?[
                                                colors.green,
                                                colors.lightGreen
                                              ]
                                                  :[
                                                colors.green.withOpacity(0.3),
                                                colors.lightGreen.withOpacity(0.3),
                                              ]

                                          ),
                                        ),
                                        child: Text(
                                          //"F.A.Q",
                                          "?",
                                          style: TextStyle(
                                            // color: Color(0xffffffff),
                                            // color: colors.green,
                                            color: isFaq?colors.white:colors.green,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w700,
                                            // fontSize: 20,
                                            fontSize: ((width<=360?16:20)*scale)/mockupWidth*width,
                                          ),

                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            isSettings?
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                SizedBox(height: 20,),

                                Container(
                                  margin: EdgeInsets.all(5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          isMusic = !isMusic;
                                          setState((){isMusic;});

                                          try{
                                            // await Sounds.buttonClick;

                                            (!user["sound"])? null :
                                            Sounds.buttonClick;
                                            // await Login.updateMusic(user["id"], isMusic, isMusic: true)
                                            Login.updateMusic(user["id"], isMusic, isMusic: true)
                                                .then((value) async {
                                              if(value!=null){
                                                // setState((){
                                                //   user = usr;
                                                // });
                                              }


                                              if(mAudio!=null){
                                                if(!isMusic){
                                                  await mAudio.pauseMusic();
                                                }else{
                                                  await mAudio.playLoopMusic();
                                                }
                                              }

                                              // isSound = false;
                                              // isSound = !isSound;
                                              // setState((){isSound;});
                                              // await Login.updateMusic(user["id"], isSound, isSound: true);
                                              await Login.updateMusic(user["id"], isMusic, isSound: true);

                                            });

                                            setState((){user;});
                                          }catch(e){
                                            print('err $e');
                                          }

                                        },
                                        // child: Image.asset("assets/images/Component 1.png", scale: 5,),
                                        // child: Image.asset("assets/images/${isMusic?"Component 1":"Component 1-1"}.png", scale: 5 * scale,),
                                        child: Image.asset("assets/images/${isMusic?"Component 1":"Component 1-1"}.png", scale: isMusic?4.3:4.8 * scale,),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          isTimer = !isTimer;
                                          setState((){isTimer;});

                                          // (!user["timer"])? null :
                                          (!user["sound"])? null :
                                          Sounds.buttonClick;
                                          Login.updateMusic(user["id"], isTimer, isTimer: true);

                                          setState((){user;});

                                        },
                                        // child: Image.asset("assets/images/${isTimer?"Component 2":"Component 2_1"}.png", scale: 5 * scale,),
                                        // child: Image.asset("assets/images/${isTimer?"Component 3":"Component 3-1"}.png", scale: 5 * scale,),
                                        child: Image.asset("assets/images/${isTimer?"Group 222":"Group 222-1"}.png", scale: isTimer?4.5:14.5 * scale,),
                                        // child: Image.asset("${isSound?"assets/images/Component 2.png":"assets/images/Component 2_1.png"}", scale: 5,),
                                      ),
                                      // InkWell(
                                      //   onTap: () async {
                                      //     isSound = !isSound;
                                      //     setState((){isSound;});
                                      //
                                      //     // await Sounds.buttonClick;
                                      //     (!user["sound"])? null :
                                      //     Sounds.buttonClick;
                                      //     //await Login.updateMusic(user["id"], isSound, isSound: true);
                                      //     Login.updateMusic(user["id"], isSound, isSound: true);
                                      //
                                      //   },
                                      //   child: Image.asset("assets/images/${isSound?"Component 2":"Component 2_1"}.png", scale: 5 * scale,),
                                      //   // child: Image.asset("${isSound?"assets/images/Component 2.png":"assets/images/Component 2_1.png"}", scale: 5,),
                                      // ),
                                      // InkWell(
                                      //   onTap: () async {
                                      //     isAlarm = !isAlarm;
                                      //     setState((){isAlarm;});
                                      //
                                      //     // await Sounds.buttonClick;
                                      //     (!user["sound"])? null :
                                      //     Sounds.buttonClick;
                                      //     //await Login.updateMusic(user["id"], isAlarm, isNotification: true);
                                      //     Login.updateMusic(user["id"], isAlarm, isNotification: true);
                                      //
                                      //     runService();
                                      //
                                      //   },
                                      //   // child: Image.asset("assets/images/Component 3.png", scale: 5,),
                                      //   child: Image.asset("assets/images/${isAlarm?"Component 3":"Component 3-1"}.png", scale: 5 * scale,),
                                      // ),
                                    ],
                                  ),
                                ),

                                Container(
                                  margin: EdgeInsets.all(5),
                                  child: InkWell(
                                    onTap: () async {
                                      (!user["sound"])? null :
                                      await Sounds.buttonClick;
                                      Navigator.of(context).pop();
                                      dialogSupport(context, user);
                                    },
                                    child: Image.asset("assets/images/support.png", scale: 5 * scale,),
                                  ),
                                ),

                                Container(
                                  margin: EdgeInsets.all(5),
                                  child: InkWell(
                                    onTap: () async {
                                      (!user["sound"])? null :
                                      await Sounds.buttonClick;
                                      Navigator.of(context).pop();
                                      dialogSupport(context, user, isTerms: true);
                                    },
                                    child: Image.asset("assets/images/terms.png", scale: 5 * scale,),
                                  ),
                                ),

                                Container(
                                  margin: EdgeInsets.all(5),
                                  child: InkWell(
                                    onTap: () async {

                                      await mAudio!.pauseMusic().then((value) async {

                                        // await methods.playSound(file: "click1")
                                        //     .then((value) {
                                        (!user["sound"])? null :
                                        await Sounds.buttonClick;
                                        // Future.delayed(const Duration(seconds: 1),(){
                                          Future.delayed(const Duration(milliseconds: 200),() async {
                                            if(user!=null){
                                              if(user["login_mode"]=="Email"){
                                                print('signing out... Email');

                                                Login.signOutEmail().then((value) {
                                                  print('signing out... Email');
                                                  Navigator.pop(context);
                                                  Navigator.of(context).pushReplacement(
                                                    NavigateWithOpaque(
                                                      child: AuthScreen(start: false,),
                                                      // child: AuthScreen(start: true,),
                                                      // duration: 200,
                                                      direction: AxisDirection.right,
                                                    ),
                                                  );
                                                });
                                              }else if(user["login_mode"]=="Google"){
                                                print('signing out... Google');
                                                Navigator.pop(context);
                                                Login.signOutGoogle().then((value) {
                                                  Navigator.of(context).pushReplacement(
                                                    NavigateWithOpaque(
                                                      child: AuthScreen(start: false,),
                                                      // child: AuthScreen(start: true,),
                                                      // duration: 200,
                                                      direction: AxisDirection.right,
                                                    ),
                                                  );
                                                });
                                              }else if(user["login_mode"]=="Facebook"){
                                                print('signing out... Facebook');
                                                Navigator.pop(context);
                                                Login.signOutFacebook().then((value) {
                                                  Navigator.of(context).pushReplacement(
                                                    NavigateWithOpaque(
                                                      child: AuthScreen(start: false,),
                                                      // child: AuthScreen(start: true,),
                                                      // duration: 200,
                                                      direction: AxisDirection.right,
                                                    ),
                                                  );
                                                });
                                              }else if(user["login_mode"]=="Guest"){
                                                print('signing out... Guest');
                                                Navigator.pop(context);
                                                Navigator.of(context).pushReplacement(
                                                  NavigateWithOpaque(
                                                    child: AuthScreen(start: false,),
                                                    // child: AuthScreen(start: true,),
                                                    // duration: 200,
                                                    direction: AxisDirection.right,
                                                  ),
                                                );
                                              }
                                            }

                                          });
                                        // });

                                      });

                                    },
                                    child: Image.asset("assets/images/signout.png", scale: 5 * scale,),
                                  ),
                                ),
                              ],
                            )
                                :Container(),

                            isFaq?Column(
                              children: faqs.map((Map<String, dynamic> e) {
                                return Container (
                                  width: MediaQuery.of(context).size.width,

                                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                                  // margin: EdgeInsets.all(10),
                                  // padding: EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      e["title"]=="image"? Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.all(8),
                                        child: Image.asset("assets/images/${e["subtext"]}.jpg", scale: 2,),
                                      )
                                        : Container(),

                                      e["title"]=="image" || e["title"]==""? Container():
                                      Text(
                                        "${e["title"]}",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          // color: Color(0xffffffff),
                                          color: colors.white,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w700,
                                          // fontSize: 12,
                                          fontSize: 15,
                                        ),
                                      ),

                                      e["title"]=="image"? Container():
                                      Container(
                                        padding: EdgeInsets.only(top: 8, left: 10),
                                        child: Text(
                                          "${e["subtext"]}",
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            // color: Color(0xffffffff),
                                            color: colors.white,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w400,
                                            // fontSize: 12,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            )
                                :Container(),

                          ],
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    // top: -30,
                    // right: -30,
                    top: 0,
                    // right: 10,
                    right: 0,

                    // top:MediaQuery.of(context).size.width,

                    child: GestureDetector(
                      onTap: () async {
                        // Navigator.of(context).pop();

                        // await methods.playSound(file: "soundscrate-graphics-game-blip-2")
                        // // await methods.playSound(file: "Wooden-Button-Click-Sound-Effect")
                        //     .then((value) {
                        //   Navigator.of(context).pop();
                        // });

                        (!user["sound"])? null :
                        await Sounds.buttonClick;
                        Navigator.of(context).pop();

                      },
                      child: Container(
                        // height: 60,
                        // width: 60,
                        // height: 50,
                        // width: 50,
                        height: (50*scale)/mockupHeight*height,
                        width: (50*scale)/mockupWidth*width,
                        decoration: BoxDecoration(
                          // color: Color(0xff1E7455),
                          color: Color(0xffC3333C),
                          // color: Color(0xffffffff),
                          // border: Border.all(width: 5, color: Color(0xffffffff)),
                          border: Border.all(width: 3, color: Color(0xffFFFDF9)),
                          // borderRadius: BorderRadius.circular(180),
                          borderRadius: BorderRadius.circular((180*scale)/mockupWidth*width),
                          //drop shadow effect
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.black.withOpacity(0.25),
                          //     spreadRadius: 4,
                          //     blurRadius: 4,
                          //     offset: const Offset(0,4),
                          //   ),
                          // ],
                        ),
                        child: Image.asset("assets/images/close.png", scale: 3 * scale,),
                      ),
                    ),
                  ),

                ],
              ),
            );
          }),
    ),
  );

  // return ;
}
*/
dialogMenu (BuildContext context,DocumentSnapshot user) {//usr // MAudio? mAudio,

  Size display = MediaQuery.of(context).size;
  double width = display.width;
  double height = display.height;

  const mockupWidth = 390;
  const mockupHeight = 844;

  final scale = mockupWidth / width;

  bool isSettings=true, isFaq=false;
  // bool isSound=true, isMusic=true, isAlarm=true;
  // late bool isSettings, isFaq;
  late bool isSound, isMusic, isAlarm, isTimer;

  final bool isTablat = width>500 && height>800?true:false;

  // isSound = user["sound"] as bool;
  // isMusic = user["music"] as bool;
  // isAlarm = user["notification"] as bool;

  try{
    isSound = user["sound"] as bool;
    isMusic = user["music"] as bool;
    isAlarm = user["notification"] as bool;
    isTimer = user["timer"] as bool;
  }catch(e){
    if(isSound==null) isSound = true;
    if(isMusic==null) isMusic = true;
    if(isAlarm==null) isAlarm = true;
    if(isTimer==null) isTimer = true;
  }

  // late DocumentSnapshot user;

  // final faqs = [
  //   {
  //     "title": "1. Aliquet lorem cursus tincidunt mauris faucibus?",
  //     "subtext":"suspendisse Amet sit proin tristique ut adipiscing sit quam sem tortor."
  //   },
  //   {
  //     "title": "2. Lacus ullamcorper dolor eleifend auctor elit?",
  //     "subtext":"dolor magna tempor condimentum egestas sit sit sed Tellus."
  //   },
  //   {
  //     "title": "3. habitasse nulla sit mauris?",
  //     "subtext":"molestie sagittis malesuada mauris augue."
  //   },
  //   {
  //     "title": "4. facilisis velit eu ac congue tortor. Augue at integ?",
  //     "subtext":"ullamcorper diam adipiscing volutpat non. Ultrices cursus."
  //   },
  //   {
  //     "title": "5. molestie sagittis malesuada mauris augue?",
  //     "subtext":"Aliquet lorem cursus tincidunt mauris faucibus."
  //   },
  // ];

  /*
  final faqs = [
    {
      "title": "1. What are the rules of Codewords?",
      "subtext":"The rule of codewords is to find out which number represents each letter from A - Z in the grid.\n\n"
          "once you have figured out the number, go through the grid and replace the instance of a number once with the letter that it represents and rest would automatically change.\n\n"
          "For example, if you know that 12 = E, then select the number 12 from the grid then all the number 12 would automatically change to letter E, and remember to cross off E on the letter grid underneath so you know it is placed."
    },
    // {
    //   "title": "1. What are the rules of Codewords?",
    //   "subtext":"The rules of codewords are to work out which number represents each letter from A - Z in the grid.\n\n"
    //   "You then must go through the grid and replace each instance of a number with the letter that it represents, once you've worked it out.\n\n"
    //   "Thus if you know that 12 = E, then go through and write an E in for each instance of 12, and remember to cross off E on the letter grid underneath so you know it is placed.\n\n"
    //   "Often you will be given some starter letters, so place these first."
    // },
    {
      "title": "2. What strategy tips will help me solve Codewords puzzles?",
      "subtext":"Look for the numbers that occur most frequently in the puzzle and use basic frequency analysis to realize that these are probably the E, T, and A in other words they correspond to the most common letters in the English language.-\n\n"
      "Use the given letters and fill these in and concentrate on seeing if they can be used to help you place any words and therefore other letters.\n\n"
      "Cross off from A - Z as you go through so you can easily see at a glance what else you have to place."
    },
  ];
  */

  /*final faqs = [
    {
      "title": "1. In the puzzle, Look for grid with numbers and few letters.",
      "subtext":""
    },
    {
      "title": "2. The aim of the game is to complete the crossword by replacing number with appropriate letter to make a meaningful word.",
      "subtext":""
    },
    {
      "title": "3. For example, select number “10”, now think, which letter can replace all the 10s in the puzzle.",
      "subtext":""
    },
    {
      "title": "4. It will be one of these letters below - one that isn’t blanked off already.",
      "subtext":""
    },
    {
      "title": "5. Try to imagine what each word could be!! Would the same letter that is missing can complete the other words correctly?",
      "subtext":""
    },
    {
      "title": "6. Once you figure out that letter  “P” can replace “10”, select number “10” in the grid and tap on the letter “P”. In result, all the “10s” in the puzzle will be replaced by letter “P”.",
      "subtext":""
    },
    {
      "title": "7. If It’s not that letter. Try to think of a letter that would make all the incomplete words into complete meaningful words.",
      "subtext":""
    },
    {
      "title": "8. You can always use a hint option for your ease.",
      "subtext":""
    },
    {
      "title": "9. Also, you can try different levels of the game starting from “Easy” to “Impossible”. To double the fun, don’t miss out on the daily challenges.",
      "subtext":""
    },
    {
      "title": "Sit back and enjoy the  brain storming challenges with your family and friends!",
      "subtext":""
    },
  ];
*/

  final faqs = [
    {
      "title": "image",
      "subtext":"diagram1"
    },
    {
      "title": "",
      "subtext":"To complete the codewords click a number (eg.10) to see all similar numbers (eg. all 10s) become yellow. Then Click one of the Bold letters in the grid below (eg. V) to make all those numbers (eg all 10s) become those letters (eg. Vs)"
    },
    {
      "title": "image",
      "subtext":"diagram2"
    },
    {
      "title": "",
      "subtext":"Continue this pattern until the codeword is complete with words spelt correctly."
    },
    {
      "title": "image",
      "subtext":"diagram3"
    },
    {
      "title": "image",
      "subtext":"diagram4"
    },
    {
      "title": "",
      "subtext":"You can find hint letters by clicking the button at the top right corner,"
    },
    {
      "title": "image",
      "subtext":"diagram5"
    },
    {
      "title": "",
      "subtext":"but each hint letter will subtract a minute from your time as it counts down."
    },
    {
      "title": "Scoring points",
      "subtext":"You will score points for completing a puzzle and bonus points for completing within the target time."
    },
    {
      "title": "Correcting Mistakes",
      "subtext":"If you think you've made a mistake you can correct it by clicking the back button (bottom right), or by clicking on one the incorrect letters, then clicking on the correct  letter in the grid below it will alter all those incorrect letters."
    },
    {
      "title": "Leaderboard",
      "subtext":"Check your progress in the leaderboard on the home page."
    },
    {
      "title": "image",
      "subtext":"diagram6"
    },
    // {
    //   "title": "",
    //   "subtext":"You can turn off the sound button and the timer if you like. Turning the timer off means that you’ll only score points for completing puzzles, but no bonus points for beating the target times."
    // },
    {
      "title": "",
      "subtext":"You can turn off the timer if you like. Turning the timer off means that you’ll only score points for completing puzzles, but no bonus points for beating the target times."
    },
    // // {
    // //   "title": "",
    // //   // "subtext":"You can turn off the clock, or the music on the home page if you like."
    // //   "subtext":"You can turn off the button sound, and the music on the home page if you like."
    // // },
    // {
    //   "title": "image",
    //   "subtext":"diagram7"
    // },
    // {
    //   "title": "",
    //   // "subtext":"You can turn off the clock, or the music on the home page if you like."
    //   "subtext":"You can turn off the clock on the home page if you like, but you get fixed points as per the rule. If you want to get more points then you can turn on the clock."
    // },
    {
      "title": "image",
      "subtext":"diagram8"
    },
  ];


/*
  runService() async {
    try{
      await NotificationApi.init(context);

      // try{
      //   if(Background.backService!=null){
      //     Background().setForeground(Background.backService);
      //     Background().setBackground(Background.backService);
      //   }
      // }catch(e){
      //   print("service running err ->\n${e}");
      // }

      // final service = FlutterBackgroundService();
      FlutterBackgroundService service = FlutterBackgroundService();
      if(await service.isRunning()){
        print("ending old service...");
        service.invoke("stop");
        // print("initializing service...");
        // await initializeService();
      }else{
        print("initializing service...");
        await initializeService();

        service = FlutterBackgroundService();
        bool serviceRunning = await service.isRunning();
        print('serviceRunning $serviceRunning');
        if(service!=null && !serviceRunning){
          setForeground(service);
          setBackground(service);
        }

      }

      // service = FlutterBackgroundService();
      // bool serviceRunning = await service.isRunning();
      // print('serviceRunning $serviceRunning');
      // if(service!=null && !serviceRunning){
      //   setForeground(service);
      //   setBackground(service);
      // }


    }catch(e){
      print("err while service initializing\n\n${e}");
    }
  }
*/


  showTransitionDialog(
    context: context,
    //child: dialogMenu(mAudio, user!),
    child: Dialog(
      elevation: 0,
      // insetPadding: EdgeInsets.all(10),
      // insetPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      insetPadding: EdgeInsets.symmetric(horizontal: (30*scale)/mockupWidth*width, vertical: 10),
      backgroundColor: Colors.transparent,
      alignment: Alignment.center,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ), //this right here
      child: StatefulBuilder(
          builder: (context, setState) {

            print("width ${MediaQuery.of(context).size.width}");
            print("height ${MediaQuery.of(context).size.height}");

            // return Theme(
            //   data: Theme.of(context).copyWith(
            //       colorScheme: ColorScheme.light(
            //         // primary: Colors.yellow,
            //         // onPrimary: Colors.black,
            //         // onSurface: Colors.teal,
            //         primary: Colors.red,
            //         onPrimary: Colors.white,
            //         onSurface: Colors.black,
            //       ),
            //       textButtonTheme: TextButtonThemeData(
            //           style: TextButton.styleFrom(
            //             // primary: Colors.teal
            //               primary: Colors.black
            //           )
            //       )
            //   ),
            //   child:
            // );

            // bool isSound=true, isMusic=true, isAlarm=true;

            // late DocumentSnapshot user;
            // bool isSettings=true, isFaq=false;
            // bool isSound=true, isMusic=true, isAlarm=true;

            // if(user==null){
            //   setState((){
            //     user = usr;
            //   });
            // }
            // if(isSound==null){
            //   setState((){
            //     isSound = user["sound"] as bool;
            //     isMusic = user["music"] as bool;
            //     isAlarm = user["notification"] as bool;
            //   });
            // }

            return Container(
              // height: 506,
              // width: 364,
              // color: Colors.transparent,
              // color: Color(0xff1C1C1C).withOpacity(1),

              // width: 364,
              // height: 506,

              child: Stack(
                children: [

                  Container(
                    // height: 506-20,
                    // width: 364-20,

                    // height: 506,
                    // width: 364,

                    /*height: (506*scale)/mockupHeight*height,
                    width: (364*scale)/mockupWidth*width,*/
                    height: isTablat?756:(506*scale)/mockupHeight*height,
                    width: isTablat?564:(364*scale)/mockupWidth*width,

                    // margin: EdgeInsets.all(20),
                    // margin: EdgeInsets.all(25),
                    margin: EdgeInsets.all(
                        MediaQuery.of(context).size.width*0.025
                    ),
                    // margin: EdgeInsets.symmetric(
                    //     horizontal: 10,
                    //     vertical: 12
                    // ),

                    decoration: BoxDecoration(
                      // color: Color(0xff1E7455),
                      // color: Color(0xffffffff),
                      // color: colors.white,
                      color: colors.white,
                      // color: Colors.transparent,
                      // border: Border.all(width: 20, color:  Color(0xffffff)),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Container(
                      // height: 506-10,
                      // width: 364-10,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        // color: Color(0xff1E7455),
                        color: colors.green,
                        // color: colors.white,
                        // color: Color(0xffffffff),
                        // border: Border.all(width: 15, color:  Color(0xffffffff)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            Container(
                              decoration: BoxDecoration(
                                // color: Color(0xff1E7455),
                                // color: Color(0xffffffff),
                                color: colors.white,
                                // color: Colors.transparent,
                                // border: Border.all(width: 20, color:  Color(0xffffff)),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () async {
                                        // setState((){isSettings = !isSettings; isFaq=false;});
                                        // setState((){isSettings=true; isFaq=false;});

                                        // await methods.playSound(file: "Mouse-click-Sound-Effect-No-Copyright")
                                        // await methods.playSound(file: "click1")
                                        //     .then((value) {
                                        // Future.delayed(const Duration(seconds: 1),(){

                                        /*(!user["sound"])? null :
                                        await Sounds.buttonClick;*/
                                        Future.delayed(const Duration(milliseconds: 200),() async {
                                          setState((){isSettings=true; isFaq=false;});
                                        });
                                        // });

                                      },

                                      child: Container(
                                        // width: 308,
                                        // width: (MediaQuery.of(context).size.width-105)/2,
                                        // width: 172-11,
                                        // height: 231,
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.all(17),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                          ),
                                          gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              // colors: [
                                              //   colors.green,
                                              //   colors.lightGreen
                                              // ]

                                              colors: isSettings?[
                                                colors.green,
                                                colors.lightGreen
                                              ]
                                                  :[
                                                colors.green.withOpacity(0.3),
                                                colors.lightGreen.withOpacity(0.3),
                                              ]

                                          ),

                                        ),
                                        child: Text(
                                          "Settings",
                                          style: TextStyle(
                                            // color: Color(0xffffffff),
                                            color: isSettings?colors.white:colors.green,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w700,
                                            // fontSize: 20,
                                            fontSize: isTablat?28:((width<=360?16:20)*scale)/mockupWidth*width,
                                          ),

                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () async {
                                        // setState((){isFaq = !isFaq; isSettings=false;});
                                        //setState((){isSettings=false; isFaq=true;});

                                        // await methods.playSound(file: "click1")
                                        //     .then((value) {
                                        // Future.delayed(const Duration(seconds: 1),(){

                                        /*(!user["sound"])? null :
                                        await Sounds.buttonClick;*/
                                        Future.delayed(const Duration(milliseconds: 200),() async {
                                          setState((){isSettings=false; isFaq=true;});
                                        });
                                        // });

                                      },
                                      child: Container(
                                        // width: 308,
                                        // width: MediaQuery.of(context).size.width,
                                        // width: MediaQuery.of(context).size.width/3,
                                        // width: 172-11,
                                        // width: (MediaQuery.of(context).size.width-105)/2,
                                        alignment: Alignment.center,
                                        // height: 231,
                                        padding: EdgeInsets.all(17),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                            // bottomRight: Radius.circular(0),
                                          ),
                                          gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              // colors: [
                                              //   // colors.green,
                                              //   // colors.lightGreen
                                              //   colors.green.withOpacity(0.3),
                                              //   colors.lightGreen.withOpacity(0.3),
                                              //
                                              //   // colors.green.withOpacity(0.3),
                                              //   // colors.lightGreen.withOpacity(0.3),
                                              // ]

                                              colors: isFaq?[
                                                colors.green,
                                                colors.lightGreen
                                              ]
                                                  :[
                                                colors.green.withOpacity(0.3),
                                                colors.lightGreen.withOpacity(0.3),
                                              ]

                                          ),
                                        ),
                                        child: Text(
                                          //"F.A.Q",
                                          "?",
                                          style: TextStyle(
                                            // color: Color(0xffffffff),
                                            // color: colors.green,
                                            color: isFaq?colors.white:colors.green,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w700,
                                            // fontSize: 20,
                                            fontSize: isTablat?28:((width<=360?16:20)*scale)/mockupWidth*width,
                                          ),

                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            isSettings?
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                SizedBox(height: 20,),

                                Container(
                                  margin: EdgeInsets.all(5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                    /*  InkWell(
                                        onTap: () async {
                                          isMusic = !isMusic;
                                          setState((){isMusic;});

                                          try{
                                            // await Sounds.buttonClick;

                                            (!user["sound"])? null :
                                            Sounds.buttonClick;
                                            // await Login.updateMusic(user["id"], isMusic, isMusic: true)
                                            Login.updateMusic(user["id"], isMusic, isMusic: true)
                                                .then((value) async {
                                              if(value!=null){
                                                // setState((){
                                                //   user = usr;
                                                // });
                                              }


                                              if(mAudio!=null){
                                                if(!isMusic){
                                                  await mAudio.pauseMusic();
                                                }else{
                                                  await mAudio.playLoopMusic();
                                                }
                                              }

                                              // isSound = false;
                                              // isSound = !isSound;
                                              // setState((){isSound;});
                                              // await Login.updateMusic(user["id"], isSound, isSound: true);
                                              await Login.updateMusic(user["id"], isMusic, isSound: true);

                                            });

                                            setState((){user;});
                                          }catch(e){
                                            print('err $e');
                                          }

                                        },
                                        // child: Image.asset("assets/images/Component 1.png", scale: 5,),
                                        // child: Image.asset("assets/images/${isMusic?"Component 1":"Component 1-1"}.png", scale: 5 * scale,),
                                        child: Image.asset("assets/images/${isMusic?"Component 1":"Component 1-1"}.png", scale: isMusic?4.3:4.8 * scale,),
                                      ),*/
                                      InkWell(
                                        onTap: () async {
                                          isTimer = !isTimer;
                                          setState((){isTimer;});

                                          // (!user["timer"])? null :
                                          /*(!user["sound"])? null :
                                          Sounds.buttonClick;*/
                                          Login.updateMusic(user["id"], isTimer, isTimer: true);

                                          setState((){user;});

                                        },
                                        // child: Image.asset("assets/images/${isTimer?"Component 2":"Component 2_1"}.png", scale: 5 * scale,),
                                        // child: Image.asset("assets/images/${isTimer?"Component 3":"Component 3-1"}.png", scale: 5 * scale,),
                                        /*child: Image.asset("assets/images/${isTimer?"Group 222":"Group 222-1"}.png", scale: isTimer?4.5:14.5 * scale,),*/
                                        child: Image.asset("assets/images/${isTimer?"Group 222":"Group 222-1"}.png", scale: isTablat?(isTimer?2.5:12.5):(isTimer?4.5:14.5) * scale,),
                                        // child: Image.asset("${isSound?"assets/images/Component 2.png":"assets/images/Component 2_1.png"}", scale: 5,),
                                      ),
                                      // InkWell(
                                      //   onTap: () async {
                                      //     isSound = !isSound;
                                      //     setState((){isSound;});
                                      //
                                      //     // await Sounds.buttonClick;
                                      //     (!user["sound"])? null :
                                      //     Sounds.buttonClick;
                                      //     //await Login.updateMusic(user["id"], isSound, isSound: true);
                                      //     Login.updateMusic(user["id"], isSound, isSound: true);
                                      //
                                      //   },
                                      //   child: Image.asset("assets/images/${isSound?"Component 2":"Component 2_1"}.png", scale: 5 * scale,),
                                      //   // child: Image.asset("${isSound?"assets/images/Component 2.png":"assets/images/Component 2_1.png"}", scale: 5,),
                                      // ),
                                      // InkWell(
                                      //   onTap: () async {
                                      //     isAlarm = !isAlarm;
                                      //     setState((){isAlarm;});
                                      //
                                      //     // await Sounds.buttonClick;
                                      //     (!user["sound"])? null :
                                      //     Sounds.buttonClick;
                                      //     //await Login.updateMusic(user["id"], isAlarm, isNotification: true);
                                      //     Login.updateMusic(user["id"], isAlarm, isNotification: true);
                                      //
                                      //     runService();
                                      //
                                      //   },
                                      //   // child: Image.asset("assets/images/Component 3.png", scale: 5,),
                                      //   child: Image.asset("assets/images/${isAlarm?"Component 3":"Component 3-1"}.png", scale: 5 * scale,),
                                      // ),
                                    ],
                                  ),
                                ),

                                Container(
                                  margin: EdgeInsets.all(5),
                                  child: InkWell(
                                    onTap: () async {
                                      /*(!user["sound"])? null :
                                      await Sounds.buttonClick;*/
                                      Navigator.of(context).pop();
                                      dialogSupport(context, user);
                                    },
                                    /*child: Image.asset("assets/images/support.png", scale: 5 * scale,),*/
                                    child: Image.asset("assets/images/support.png", scale: isTablat?3:5 * scale,),
                                  ),
                                ),

                                Container(
                                  margin: EdgeInsets.all(5),
                                  child: InkWell(
                                    onTap: () async {
                                      /*(!user["sound"])? null :
                                      await Sounds.buttonClick;*/
                                      Navigator.of(context).pop();
                                      dialogSupport(context, user, isTerms: true);
                                    },
                                    /*child: Image.asset("assets/images/terms.png", scale: 5 * scale,),*/
                                    child: Image.asset("assets/images/terms.png", scale: isTablat?3:5 * scale,),
                                  ),
                                ),

                                Container(
                                  margin: EdgeInsets.all(5),
                                  child: InkWell(
                                    onTap: () async {

                                      // await mAudio!.pauseMusic().then((value) async {
                                      // });

                                        // await methods.playSound(file: "click1")
                                        //     .then((value) {
                                        /*(!user["sound"])? null :
                                        await Sounds.buttonClick;*/
                                        // Future.delayed(const Duration(seconds: 1),(){
                                        Future.delayed(const Duration(milliseconds: 200),() async {
                                          if(user!=null){
                                            if(user["login_mode"]=="Email"){
                                              print('signing out... Email');

                                              Login.signOutEmail().then((value) {
                                                print('signing out... Email');
                                                Navigator.pop(context);
                                                Navigator.of(context).pushReplacement(
                                                  NavigateWithOpaque(
                                                    child: AuthScreen(start: false,),
                                                    // child: AuthScreen(start: true,),
                                                    // duration: 200,
                                                    direction: AxisDirection.right,
                                                  ),
                                                );
                                              });
                                            }else if(user["login_mode"]=="Google"){
                                              print('signing out... Google');
                                              Navigator.pop(context);
                                              Login.signOutGoogle().then((value) {
                                                Navigator.of(context).pushReplacement(
                                                  NavigateWithOpaque(
                                                    child: AuthScreen(start: false,),
                                                    // child: AuthScreen(start: true,),
                                                    // duration: 200,
                                                    direction: AxisDirection.right,
                                                  ),
                                                );
                                              });
                                            }else if(user["login_mode"]=="Facebook"){
                                              print('signing out... Facebook');
                                              Navigator.pop(context);
                                              Login.signOutFacebook().then((value) {
                                                Navigator.of(context).pushReplacement(
                                                  NavigateWithOpaque(
                                                    child: AuthScreen(start: false,),
                                                    // child: AuthScreen(start: true,),
                                                    // duration: 200,
                                                    direction: AxisDirection.right,
                                                  ),
                                                );
                                              });
                                            }else if(user["login_mode"]=="Guest"){
                                              print('signing out... Guest');
                                              Navigator.pop(context);
                                              Navigator.of(context).pushReplacement(
                                                NavigateWithOpaque(
                                                  child: AuthScreen(start: false,),
                                                  // child: AuthScreen(start: true,),
                                                  // duration: 200,
                                                  direction: AxisDirection.right,
                                                ),
                                              );
                                            }
                                          }

                                        });
                                        // });



                                    },
                                    /*child: Image.asset("assets/images/signout.png", scale: 5 * scale,),*/
                                    child: Image.asset("assets/images/signout.png", scale: isTablat?3:5 * scale,),
                                  ),
                                ),
                              ],
                            )
                                :Container(),

                            isFaq?Column(
                              children: faqs.map((Map<String, dynamic> e) {
                                return Container (
                                  width: MediaQuery.of(context).size.width,

                                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                                  // margin: EdgeInsets.all(10),
                                  // padding: EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      e["title"]=="image"? Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.all(8),
                                        /*child: Image.asset("assets/images/${e["subtext"]}.jpg", scale: 2,),*/
                                        child: Image.asset("assets/images/${e["subtext"]}.jpg", scale: isTablat?1.5:2,),
                                      )
                                          : Container(),

                                      e["title"]=="image" || e["title"]==""? Container():
                                      Text(
                                        "${e["title"]}",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          // color: Color(0xffffffff),
                                          color: colors.white,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w700,
                                          // fontSize: 12,
                                          /*fontSize: 15,*/
                                          fontSize: isTablat?25:15,
                                        ),
                                      ),

                                      e["title"]=="image"? Container():
                                      Container(
                                        padding: EdgeInsets.only(top: 8, left: 10),
                                        child: Text(
                                          "${e["subtext"]}",
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            // color: Color(0xffffffff),
                                            color: colors.white,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w400,
                                            // fontSize: 12,
                                            /*fontSize: 14,*/
                                            fontSize: isTablat?22:14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            )
                                :Container(),

                          ],
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    // top: -30,
                    // right: -30,
                    top: 0,
                    // right: 10,
                    right: 0,

                    // top:MediaQuery.of(context).size.width,

                    child: GestureDetector(
                      onTap: () async {
                        // Navigator.of(context).pop();

                        // await methods.playSound(file: "soundscrate-graphics-game-blip-2")
                        // // await methods.playSound(file: "Wooden-Button-Click-Sound-Effect")
                        //     .then((value) {
                        //   Navigator.of(context).pop();
                        // });

                        /*(!user["sound"])? null :
                        await Sounds.buttonClick;*/
                        Navigator.of(context).pop();

                      },
                      child: Container(
                        // height: 60,
                        // width: 60,
                        // height: 50,
                        // width: 50,
                        /*height: (50*scale)/mockupHeight*height,
                        width: (50*scale)/mockupWidth*width,*/
                        height: isTablat?60:(50*scale)/mockupHeight*height,
                        width: isTablat?60:(50*scale)/mockupWidth*width,
                        decoration: BoxDecoration(
                          // color: Color(0xff1E7455),
                          color: Color(0xffC3333C),
                          // color: Color(0xffffffff),
                          // border: Border.all(width: 5, color: Color(0xffffffff)),
                          border: Border.all(width: 3, color: Color(0xffFFFDF9)),
                          // borderRadius: BorderRadius.circular(180),
                          borderRadius: BorderRadius.circular((180*scale)/mockupWidth*width),
                          //drop shadow effect
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.black.withOpacity(0.25),
                          //     spreadRadius: 4,
                          //     blurRadius: 4,
                          //     offset: const Offset(0,4),
                          //   ),
                          // ],
                        ),
                        child: Image.asset("assets/images/close.png", scale: 3 * scale,),
                        /*child: Image.asset("assets/images/close.png", scale: isTablat?4:3 * scale,),*/
                      ),
                    ),
                  ),

                ],
              ),
            );
          }),
    ),
  );

  // return ;
}

dialogSupport (BuildContext context, DocumentSnapshot user, {bool isTerms = false}) {//usr

  Size display = MediaQuery.of(context).size;
  double width = display.width;
  double height = display.height;

  const mockupWidth = 390;
  const mockupHeight = 844;

  final scale = mockupWidth / width;

  final bool isTablat = width>500 && height>800?true:false;


  //final String text = //"Support :\n\n"
  late String text =

  "Welcome to Codeword Challenge\n\n"
  "   Welcome to Codeword Challenge’s Player Support Center! Here, you’ll find answers to:\n\n"
  "1. CodeWord Challenges provides Support Services for Users.\n\n"
  "2. You may contact CodeWord Challenges for Support Service through the application by using the “Support” tab.\n\n"
  "3. Support Service is free of charge and available regardless of registering an Account.\n\n"
  "4. The subject of the query may be any aspect of provision Services by CodeWord Challenges, especially (but not limited to):\n\n"
  "   a) No access to the Game or the Account;\n"
  "   b) Technical problems within the Game or the Account;\n\n"
  "5. We make an effort to give a response as soon as possible.\n"
  "\n"
  "For support mail on:\n"
  "cw060571@gmail.com\n";

  // final String text = 'Aliquet venenatis mattis quis vivamus ut.\n'
  // 'Amet, eu, mauris amet mauris urna, pellentesque\n'
  // 'cum viverra. Elementum in quisque hendrerit lorem.\n\n'
  //
  // 'Non ante nam neque, aenean libero. Et diam\n'
  // 'pellentesque id egestas netus. Nisl, sed donec\n'
  // 'nunc feugiat quisque.\n'
  // 'Tincidunt dictumst morbi id et sit.\n'
  // 'Tempor, at cursus tristique nisl pellentesque\n'
  // 'dictum enim. Egestas bibendum vitae bibendum\n'
  // 'tincidunt dapibus orci accumsan. Volutpat massa\n'
  // 'arcu eleifend nulla imperdiet turpis.\n\n'
  //
  // 'Aliquet venenatis mattis quis vivamus ut.\n'
  // 'Amet, eu, mauris amet mauris urna, pellentesque\n'
  // 'cum viverra. Elementum in quisque hendrerit lorem.\n\n'
  //
  // 'Non ante nam neque, aenean libero. Et diam\n'
  // 'pellentesque id egestas netus. Nisl, sed donec\n'
  // 'nunc feugiat quisque. Tincidunt dictumst morbi\n'
  // 'id et sit. Tempor, at cursus tristique nisl\n'
  // 'pellentesque dictum enim. Egestas bibendum\n'
  // 'vitae bibendum tincidunt dapibus orci accumsa\n'
  // 'Volutpat massa arcu eleifend nulla imperdiet turpis.\n\n'
  //
  // 'Aliquet venenatis mattis quis vivamus ut.\n'
  // 'Amet, eu, mauris amet mauris urna, pellentesque\n'
  // 'cum viverra. Elementum in quisque hendrerit lorem.\n\n'
  //
  // 'Non ante nam neque, aenean libero. Et diam\n'
  // 'pellentesque id egestas netus. Nisl, sed donec\n'
  // 'nunc feugiat quisque.\n'
  // 'Tincidunt dictumst morbi id et sit.\n'
  // 'Tempor, at cursus tristique nisl pellentesque\n'
  // 'dictum enim. Egestas bibendum vitae bibendum\n'
  // 'tincidunt dapibus orci accumsan. Volutpat massa\n'
  // 'arcu eleifend nulla imperdiet turpis.\n\n'
  //
  // 'Aliquet venenatis mattis quis vivamus ut.\n'
  // 'Amet, eu, mauris amet mauris urna, pellentesque\n'
  // 'cum viverra. Elementum in quisque hendrerit lorem.\n\n'
  //
  // 'Non ante nam neque, aenean libero. Et diam\n'
  // 'pellentesque id egestas netus. Nisl, sed donec\n'
  // 'nunc feugiat quisque. Tincidunt dictumst morbi\n'
  // 'id et sit. Tempor, at cursus tristique nisl\n'
  // 'pellentesque dictum enim. Egestas bibendum\n'
  // 'vitae bibendum tincidunt dapibus orci accumsa\n'
  // 'Volutpat massa arcu eleifend nulla imperdiet turpis.\n\n';


  if(isTerms){
    text = "1. Terms\n\n"

  "1.1	The user may only take part in every round (e.g. World, Universe, etc.) of an online game or mobile game using one user account unless the respective rules of the game allow for exceptions from this. The use of several user accounts by one user is not permitted. Multiuser accounts such as these may be deleted or banned at the reasonable discretion of Codeword Challenge.\n\n"
  "1.2	Users are prohibited from enacting any form of manipulative interference in online or mobile games. In particular, users are not entitled to utilize measures, mechanisms, or software that could interfere with the function or progress of the game. Users may not take measures that may cause an unreasonable or excessive burden on technical capacity. Users are not allowed to block, rewrite, or modify content generated by the game administration or to interfere with the game in any other manner.\n\n"
  "1.3	Under no circumstances may users\n\n"
  "a) create or use cheats, mods and/or hacks, or any other third-party software products that may change the result of the online mobile games.\n"
  "b) use software that allows the mining of data or otherwise intercepts or collects information in connection to the mobile games.\n\n"
  "1.4	It is prohibited to apply measures that hide advertisements. It is of no significance whether advertising is deliberately hidden or can not be displayed in general e.g. by so-called pop-up blockers, text-based browsers, or similar.\n\n"
  "1.5	The automated creation of user accounts, regardless of whether the home page is displayed or not, is not permitted.\n\n"
  "1.6	Codeword Challenge or contractors authorized by Codeword Challenge hold all and exclusive rights to items used and virtual items provided in mobile games. Users will only receive a non-exclusive right of use to the virtual items for the duration of the user agreement.\n\n"
  "1.7	Codeword Challenge continuously updates, changes, and develops its mobile games and other services at its discretion. Users can therefore only participate in the respective online game, mobile game, or another offer in its respective form provided at any given time. Codeword Challenge retains the right to cease operating an online or mobile game or remove a specific service without explanation.\n\n"
  "1.8	Online and mobile games and other services offered by Codeword Challenge are intended solely for entertainment. The use of these games or services for business or commercial purposes is strictly prohibited.\n\n"
  "1.9	Users are responsible for ensuring that their software and hardware are suitable and up-to-date.\n\n"
  "1.10 In addition to these general terms and conditions, any existing rules of the respective online or mobile game shall also apply. In the case of an inconsistency between these general terms and conditions and the rules of the game, the provisions of these general terms and conditions shall take precedence when settling the instance of contradiction. In addition, specific terms and conditions shall also apply to certain online or mobile games, specific versions and/or components of online or mobile games, and individual services offered on Codeword Challenge's websites as appropriate. Users will be appropriately informed of any specific terms and conditions before use of the respective offer.\n\n"

  "2. General User\n\n"

  "2.1	User data\n\n"
  "Users agree to immediately provide Codeword Challenge with any future changes to data entered upon registration, in particular any change to the email address. Users are obliged to confirm for Codeword Challenge the accuracy of their data upon request.\n\n"
  "2.2	Login data, identification, passwords\n\n"
  "2.2.1	Users are required to maintain strict confidentiality regarding all login data, identification, and passwords.\n\n"
  "2.2.2	The terms \"login data\", \"identification\", and \"passwords\" include all letter and/or character and/or number sequences used to authenticate the user and prevent unauthorized use by third parties. The password should not be identical to the player's name, and it should consist of a combination of numbers and letters.\n\n"
  "2.2.3	Users are required to protect all login data, identification, and passwords from third-party access.\n\n"
  "2.2.4	If a user has reason to believe that third parties have obtained or may have obtained unauthorized login data, identification, or passwords, they shall inform Codeword Challenge immediately and change their data or have it changed by Codeword Challenge. In this case or if Codeword Challenge has concrete evidence of misuse of data, Codeword Challenge has the right to temporarily block access to the user's account. If there is evidence of misuse of data, Codeword Challenge shall inform the user.\n\n"
  "2.2.5	Users are under no circumstances entitled to use the login data of another user unless the rules of the respective online or mobile game or other service allow for exceptions.\n\n"
  "2.3	Other provisions or general terms and conditions of a user, which deviate from Codeword Challenge's general terms and conditions, shall only apply if Codeword Challenge gives prior written consent to their validity.\n"
    "CAB";
  }

  //showTransitionDialog(
  // showBottomSheet(
  showModalBottomSheet(
    context: context,
    // child: Dialog(
    enableDrag: true,
    backgroundColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
      // borderRadius: BorderRadius.circular(20),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    builder: (context)=> Dialog(
      elevation: 0,
      // insetPadding: EdgeInsets.all(10),
      // insetPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      // insetPadding: EdgeInsets.symmetric(horizontal: 30,),
      insetPadding: EdgeInsets.symmetric(horizontal: 0,),
      // backgroundColor: Colors.transparent,
      alignment: Alignment.center,
      shape: const RoundedRectangleBorder(
        // borderRadius: BorderRadius.circular(20),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ), //this right here
      child: StatefulBuilder(
          builder: (context, setState) {

            print("width ${MediaQuery.of(context).size.width}");
            print("height ${MediaQuery.of(context).size.height}");

            // return Theme(
            //   data: Theme.of(context).copyWith(
            //       colorScheme: ColorScheme.light(
            //         // primary: Colors.yellow,
            //         // onPrimary: Colors.black,
            //         // onSurface: Colors.teal,
            //         primary: Colors.red,
            //         onPrimary: Colors.white,
            //         onSurface: Colors.black,
            //       ),
            //       textButtonTheme: TextButtonThemeData(
            //           style: TextButton.styleFrom(
            //             // primary: Colors.teal
            //               primary: Colors.black
            //           )
            //       )
            //   ),
            //   child:
            // );

            // bool isSound=true, isMusic=true, isAlarm=true;

            // late DocumentSnapshot user;
            // bool isSettings=true, isFaq=false;
            // bool isSound=true, isMusic=true, isAlarm=true;

            // if(user==null){
            //   setState((){
            //     user = usr;
            //   });
            // }
            // if(isSound==null){
            //   setState((){
            //     isSound = user["sound"] as bool;
            //     isMusic = user["music"] as bool;
            //     isAlarm = user["notification"] as bool;
            //   });
            // }

            return Container(
              // height: 506,
              // width: 364,
              // color: Colors.transparent,
              // color: Color(0xff1C1C1C).withOpacity(1),

              // width: 364,
              // height: 506,

              child: Stack(
                children: [

                  Container(
                    // height: 506-20,
                    // width: 364-20,

                    // height: 506,
                    // width: 364,

                    /*height: (506*scale)/mockupHeight*height,
                    width: (364*scale)/mockupWidth*width,*/
                    height: isTablat?756:(506*scale)/mockupHeight*height,
                    width: isTablat?664:(364*scale)/mockupWidth*width,

                    // margin: EdgeInsets.all(20),
                    // margin: EdgeInsets.all(25),
                    margin: EdgeInsets.all(
                        MediaQuery.of(context).size.width*0.025
                    ),
                    // margin: EdgeInsets.symmetric(
                    //     horizontal: 10,
                    //     vertical: 12
                    // ),

                    decoration: BoxDecoration(
                      // color: Color(0xff1E7455),
                      // color: Color(0xffffffff),
                      // color: colors.white,
                      color: colors.white,
                      // color: Colors.transparent,
                      // border: Border.all(width: 20, color:  Color(0xffffff)),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Container(
                      // height: 506-10,
                      // width: 364-10,
                      // margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        // color: Color(0xff1E7455),
                        // color: colors.green,
                        // color: colors.white,
                        // color: Color(0xffffffff),
                        // border: Border.all(width: 15, color:  Color(0xffffffff)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child:

                      // Column(
                      //   children: [
                      //
                      //
                      //
                      //     Container(
                      //       height: ((MediaQuery.of(context).size.height+(isTerms?(height<=720?2700:1700):600))*scale)/mockupHeight*height,
                      //       child:
                            SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xffE0E0E0),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        topRight: Radius.circular(25),
                                      ),
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    // height: 108,
                                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                    // height: 54,
                                    height: (54*scale)/mockupHeight*height,
                                    alignment: Alignment.bottomRight,
                                    child: InkWell(
                                      onTap: () async {
                                        /*(!user["sound"])? null :
                                        await Sounds.buttonClick;*/
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("Done",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17,
                                          // fontFamily: GoogleFonts.
                                          fontFamily: 'SFProText',
                                          color: Color(0xff007AFF),
                                        ),
                                      ),
                                    ),
                                  ),


                                  Container(
                                    decoration: BoxDecoration(
                                      // color: Color(0xffE0E0E0),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        // topLeft: Radius.circular(25),
                                        // topRight: Radius.circular(25),
                                      ),
                                    ),
                                    // margin: EdgeInsets.symmetric(horizontal: 10),
                                    // padding: EdgeInsets.symmetric(horizontal: 10),
                                    width: MediaQuery.of(context).size.width,
                                    // height: MediaQuery.of(context).size.height+600,
                                    // height: ((MediaQuery.of(context).size.height+600)*scale)/mockupHeight*height,

                                    // height: ((MediaQuery.of(context).size.height+(isTerms?(height<=720?2700:1700):600))*scale)/mockupHeight*height,

                                    // height: 108,
                                    // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                    // height: 54,
                                    // alignment: Alignment.bottomRight,
                                    child: Column(
                                      children: [
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text( //"Support",
                                            isTerms? "T&C" : "Support",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 25,
                                              // fontFamily: GoogleFonts.roboto(),
                                              // fontFamily: 'SFProText',
                                              fontFamily: 'Roboto',
                                              // color: Color(0xff007AFF),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        SingleChildScrollView(
                                          child: Text("${text}",
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              // fontFamily: GoogleFonts.roboto(),
                                              // fontFamily: 'SFProText',
                                              fontFamily: 'Roboto',
                                              // color: Color(0xff007AFF),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Container(
                                  //   decoration: BoxDecoration(
                                  //     // color: Color(0xff1E7455),
                                  //     // color: Color(0xffffffff),
                                  //     color: colors.white,
                                  //     // color: Colors.transparent,
                                  //     // border: Border.all(width: 20, color:  Color(0xffffff)),
                                  //     borderRadius: BorderRadius.only(
                                  //       topLeft: Radius.circular(25),
                                  //       topRight: Radius.circular(25),
                                  //     ),
                                  //   ),
                                  //   child: Row(
                                  //     children: [
                                  //       Expanded(
                                  //         child: InkWell(
                                  //           onTap: () async {
                                  //             // setState((){isSettings = !isSettings; isFaq=false;});
                                  //             // setState((){isSettings=true; isFaq=false;});
                                  //
                                  //             // await methods.playSound(file: "Mouse-click-Sound-Effect-No-Copyright")
                                  //             await methods.playSound(file: "click1")
                                  //                 .then((value) {
                                  //               Future.delayed(const Duration(seconds: 1),(){
                                  //                 setState((){isSettings=true; isFaq=false;});
                                  //               });
                                  //             });
                                  //
                                  //           },
                                  //
                                  //           child: Container(
                                  //             // width: 308,
                                  //             // width: (MediaQuery.of(context).size.width-105)/2,
                                  //             // width: 172-11,
                                  //             // height: 231,
                                  //             alignment: Alignment.center,
                                  //             padding: EdgeInsets.all(17),
                                  //             decoration: BoxDecoration(
                                  //               borderRadius: const BorderRadius.only(
                                  //                 topLeft: Radius.circular(20),
                                  //                 topRight: Radius.circular(20),
                                  //               ),
                                  //               gradient: LinearGradient(
                                  //                   begin: Alignment.centerLeft,
                                  //                   end: Alignment.centerRight,
                                  //                   // colors: [
                                  //                   //   colors.green,
                                  //                   //   colors.lightGreen
                                  //                   // ]
                                  //
                                  //                   colors: isSettings?[
                                  //                     colors.green,
                                  //                     colors.lightGreen
                                  //                   ]
                                  //                       :[
                                  //                     colors.green.withOpacity(0.3),
                                  //                     colors.lightGreen.withOpacity(0.3),
                                  //                   ]
                                  //
                                  //               ),
                                  //
                                  //             ),
                                  //             child: Text(
                                  //               "Settings",
                                  //               style: TextStyle(
                                  //                 // color: Color(0xffffffff),
                                  //                 color: isSettings?colors.white:colors.green,
                                  //                 fontFamily: 'Roboto',
                                  //                 fontWeight: FontWeight.w700,
                                  //                 fontSize: 20,
                                  //               ),
                                  //
                                  //             ),
                                  //           ),
                                  //         ),
                                  //       ),
                                  //       Expanded(
                                  //         child: InkWell(
                                  //           onTap: () async {
                                  //             // setState((){isFaq = !isFaq; isSettings=false;});
                                  //             //setState((){isSettings=false; isFaq=true;});
                                  //
                                  //             await methods.playSound(file: "click1")
                                  //                 .then((value) {
                                  //               Future.delayed(const Duration(seconds: 1),(){
                                  //                 setState((){isSettings=false; isFaq=true;});
                                  //               });
                                  //             });
                                  //
                                  //           },
                                  //           child: Container(
                                  //             // width: 308,
                                  //             // width: MediaQuery.of(context).size.width,
                                  //             // width: MediaQuery.of(context).size.width/3,
                                  //             // width: 172-11,
                                  //             // width: (MediaQuery.of(context).size.width-105)/2,
                                  //             alignment: Alignment.center,
                                  //             // height: 231,
                                  //             padding: EdgeInsets.all(17),
                                  //             decoration: BoxDecoration(
                                  //               borderRadius: const BorderRadius.only(
                                  //                 topLeft: Radius.circular(20),
                                  //                 topRight: Radius.circular(20),
                                  //                 // bottomRight: Radius.circular(0),
                                  //               ),
                                  //               gradient: LinearGradient(
                                  //                   begin: Alignment.centerLeft,
                                  //                   end: Alignment.centerRight,
                                  //                   // colors: [
                                  //                   //   // colors.green,
                                  //                   //   // colors.lightGreen
                                  //                   //   colors.green.withOpacity(0.3),
                                  //                   //   colors.lightGreen.withOpacity(0.3),
                                  //                   //
                                  //                   //   // colors.green.withOpacity(0.3),
                                  //                   //   // colors.lightGreen.withOpacity(0.3),
                                  //                   // ]
                                  //
                                  //                   colors: isFaq?[
                                  //                     colors.green,
                                  //                     colors.lightGreen
                                  //                   ]
                                  //                       :[
                                  //                     colors.green.withOpacity(0.3),
                                  //                     colors.lightGreen.withOpacity(0.3),
                                  //                   ]
                                  //
                                  //               ),
                                  //             ),
                                  //             child: Text(
                                  //               "F.A.Q",
                                  //               style: TextStyle(
                                  //                 // color: Color(0xffffffff),
                                  //                 // color: colors.green,
                                  //                 color: isFaq?colors.white:colors.green,
                                  //                 fontFamily: 'Roboto',
                                  //                 fontWeight: FontWeight.w700,
                                  //                 fontSize: 20,
                                  //               ),
                                  //
                                  //             ),
                                  //           ),
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),

                                  // isSettings?
                                  // Column(
                                  //   mainAxisAlignment: MainAxisAlignment.center,
                                  //   crossAxisAlignment: CrossAxisAlignment.center,
                                  //   children: [
                                  //
                                  //     SizedBox(height: 20,),
                                  //
                                  //     Container(
                                  //       margin: EdgeInsets.all(5),
                                  //       child: Row(
                                  //         mainAxisAlignment: MainAxisAlignment.center,
                                  //         crossAxisAlignment: CrossAxisAlignment.center,
                                  //         children: [
                                  //           InkWell(
                                  //             onTap: () async {
                                  //               isMusic = !isMusic;
                                  //               setState((){isMusic;});
                                  //
                                  //               try{
                                  //                 await Login.updateMusic(user["id"], isMusic, isMusic: true)
                                  //                     .then((value) async {
                                  //                   if(value!=null){
                                  //                     // setState((){
                                  //                     //   user = usr;
                                  //                     // });
                                  //                   }
                                  //
                                  //
                                  //                   if(mAudio!=null){
                                  //                     if(!isMusic){
                                  //                       await mAudio.pauseMusic();
                                  //                     }else{
                                  //                       await mAudio.playLoopMusic();
                                  //                     }
                                  //                   }
                                  //
                                  //
                                  //                 });
                                  //
                                  //                 setState((){user;});
                                  //               }catch(e){
                                  //                 print('err $e');
                                  //               }
                                  //
                                  //             },
                                  //             // child: Image.asset("assets/images/Component 1.png", scale: 5,),
                                  //             child: Image.asset("assets/images/${isMusic?"Component 1":"Component 1-1"}.png", scale: 5,),
                                  //           ),
                                  //           InkWell(
                                  //             onTap: (){
                                  //               isSound = !isSound;
                                  //               setState((){isSound;});
                                  //
                                  //               Login.updateMusic(user["id"], isSound, isSound: true);
                                  //
                                  //             },
                                  //             child: Image.asset("assets/images/${isSound?"Component 2":"Component 2_1"}.png", scale: 5,),
                                  //             // child: Image.asset("${isSound?"assets/images/Component 2.png":"assets/images/Component 2_1.png"}", scale: 5,),
                                  //           ),
                                  //           InkWell(
                                  //             onTap: (){
                                  //               isAlarm = !isAlarm;
                                  //               setState((){isAlarm;});
                                  //
                                  //               Login.updateMusic(user["id"], isAlarm, isNotification: true);
                                  //
                                  //             },
                                  //             // child: Image.asset("assets/images/Component 3.png", scale: 5,),
                                  //             child: Image.asset("assets/images/${isAlarm?"Component 3":"Component 3-1"}.png", scale: 5,),
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     ),
                                  //
                                  //     Container(
                                  //       margin: EdgeInsets.all(5),
                                  //       child: InkWell(
                                  //         onTap: (){},
                                  //         child: Image.asset("assets/images/support.png", scale: 5,),
                                  //       ),
                                  //     ),
                                  //
                                  //     Container(
                                  //       margin: EdgeInsets.all(5),
                                  //       child: InkWell(
                                  //         onTap: (){},
                                  //         child: Image.asset("assets/images/terms.png", scale: 5,),
                                  //       ),
                                  //     ),
                                  //
                                  //     Container(
                                  //       margin: EdgeInsets.all(5),
                                  //       child: InkWell(
                                  //         onTap: () async {
                                  //
                                  //           await mAudio!.pauseMusic().then((value) async {
                                  //
                                  //             await methods.playSound(file: "click1")
                                  //                 .then((value) {
                                  //               Future.delayed(const Duration(seconds: 1),(){
                                  //
                                  //                 if(user!=null){
                                  //                   if(user["login_mode"]=="Email"){
                                  //                     print('signing out... Email');
                                  //                     Login.signOutEmail().then((value) {
                                  //                       Navigator.of(context).pushReplacement(
                                  //                         NavigateWithOpaque(
                                  //                           child: AuthScreen(),
                                  //                           // duration: 200,
                                  //                           direction: AxisDirection.right,
                                  //                         ),
                                  //                       );
                                  //                     });
                                  //                   }else if(user["login_mode"]=="Google"){
                                  //                     print('signing out... Google');
                                  //                     Login.signOutGoogle().then((value) {
                                  //                       Navigator.of(context).pushReplacement(
                                  //                         NavigateWithOpaque(
                                  //                           child: AuthScreen(),
                                  //                           // duration: 200,
                                  //                           direction: AxisDirection.right,
                                  //                         ),
                                  //                       );
                                  //                     });
                                  //                   }else if(user["login_mode"]=="Facebook"){
                                  //                     print('signing out... Facebook');
                                  //                     Login.signOutFacebook().then((value) {
                                  //                       Navigator.of(context).pushReplacement(
                                  //                         NavigateWithOpaque(
                                  //                           child: AuthScreen(),
                                  //                           // duration: 200,
                                  //                           direction: AxisDirection.right,
                                  //                         ),
                                  //                       );
                                  //                     });
                                  //                   }else if(user["login_mode"]=="Guest"){
                                  //                     print('signing out... Guest');
                                  //
                                  //                   }
                                  //                 }
                                  //
                                  //               });
                                  //             });
                                  //
                                  //           });
                                  //
                                  //         },
                                  //         child: Image.asset("assets/images/signout.png", scale: 5,),
                                  //       ),
                                  //     ),
                                  //   ],
                                  // )
                                  //     :Container(),

                                  // isFaq?Column(
                                  //   children: faqs.map((Map<String, dynamic> e) {
                                  //     return Container (
                                  //       width: MediaQuery.of(context).size.width,
                                  //       margin: EdgeInsets.all(10),
                                  //       padding: EdgeInsets.all(10),
                                  //       child: Column(
                                  //         mainAxisAlignment: MainAxisAlignment.start,
                                  //         crossAxisAlignment: CrossAxisAlignment.start,
                                  //         children: [
                                  //           Text(
                                  //             "${e["title"]}",
                                  //             style: TextStyle(
                                  //               // color: Color(0xffffffff),
                                  //               color: colors.white,
                                  //               fontFamily: 'Roboto',
                                  //               fontWeight: FontWeight.w700,
                                  //               fontSize: 12,
                                  //             ),
                                  //           ),
                                  //           Container(
                                  //             padding: EdgeInsets.only(top: 8, left: 10),
                                  //             child: Text(
                                  //               "${e["subtext"]}",
                                  //               style: TextStyle(
                                  //                 // color: Color(0xffffffff),
                                  //                 color: colors.white,
                                  //                 fontFamily: 'Roboto',
                                  //                 fontWeight: FontWeight.w400,
                                  //                 fontSize: 12,
                                  //               ),
                                  //             ),
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     );
                                  //   }).toList(),
                                  // )
                                  //     :Container(),

                                ],
                              ),
                            ),
                      //     ),
                      //   ],
                      // ),
                    ),
                  ),

                  // Positioned(
                  //   // top: -30,
                  //   // right: -30,
                  //   top: 0,
                  //   // right: 10,
                  //   right: 0,
                  //
                  //   // top:MediaQuery.of(context).size.width,
                  //
                  //   child: GestureDetector(
                  //     onTap: () async {
                  //       // Navigator.of(context).pop();
                  //
                  //       await methods.playSound(file: "soundscrate-graphics-game-blip-2")
                  //       // await methods.playSound(file: "Wooden-Button-Click-Sound-Effect")
                  //           .then((value) {
                  //         Navigator.of(context).pop();
                  //       });
                  //     },
                  //     child: Container(
                  //       // height: 60,
                  //       // width: 60,
                  //       height: 50,
                  //       width: 50,
                  //       decoration: BoxDecoration(
                  //         // color: Color(0xff1E7455),
                  //         color: Color(0xffC3333C),
                  //         // color: Color(0xffffffff),
                  //         // border: Border.all(width: 5, color: Color(0xffffffff)),
                  //         border: Border.all(width: 3, color: Color(0xffFFFDF9)),
                  //         borderRadius: BorderRadius.circular(180),
                  //         //drop shadow effect
                  //         // boxShadow: [
                  //         //   BoxShadow(
                  //         //     color: Colors.black.withOpacity(0.25),
                  //         //     spreadRadius: 4,
                  //         //     blurRadius: 4,
                  //         //     offset: const Offset(0,4),
                  //         //   ),
                  //         // ],
                  //       ),
                  //       child: Image.asset("assets/images/close.png", scale: 3,),
                  //     ),
                  //   ),
                  // ),

                ],
              ),
            );
          }),
    ),
  );

  // return ;
}

/*
dialogWin (BuildContext context) {//usr

  Size display = MediaQuery.of(context).size;
  double width = display.width;
  double height = display.height;

  const mockupWidth = 390;
  const mockupHeight = 844;

  final scale = mockupWidth / width;

  showTransitionDialog(
    context: context,
    //child: dialogMenu(mAudio, user!),
    child: Dialog(
      elevation: 0,
      // insetPadding: EdgeInsets.all(10),
      // insetPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      insetPadding: EdgeInsets.symmetric(horizontal: (30*scale)/mockupWidth*width, vertical: 10),
      backgroundColor: Colors.transparent,
      alignment: Alignment.center,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ), //this right here
      child: StatefulBuilder(
          builder: (context, setState) {

            print("width ${MediaQuery.of(context).size.width}");
            print("height ${MediaQuery.of(context).size.height}");

            return Container(
              width: width,
              height: height,
              alignment: Alignment.center,
              child: Container(
                width: MediaQuery.of(context).size.width/2,
                height: MediaQuery.of(context).size.width/2,
                margin: EdgeInsets.all(100),
                child: Stack(
                  children: [
                    Container(
                      // color: Colors.white70,
                      margin: const EdgeInsets.all(20),
                      // padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        color: Color(0xfff5f5f5),
                        borderRadius: BorderRadius.all(Radius.circular(45)),
                      ),
                      child: Container(
                        // margin: const EdgeInsets.all(20),
                        // padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(45)),
                          border: Border.all(color: Colors.red, width: 4),
                        ),
                        child: Lottie.asset(
                            'assets/animations/90547-trophy-animation.json',
                            // width: 200,
                            // height: 200,
                            // width: MediaQuery.of(context).size.width/2,
                            // height: MediaQuery.of(context).size.width/2,
                            fit: BoxFit.cover,
                            // repeat: gameWinRepeat,
                            // reverse: false,
                            // animate: gameWinAnimate,

                            // controller: winAnimator,
                            onLoaded: (comp){
                              // winAnimator.animateTo(comp.durationFrames);
                            }
                        ),
                      ),
                    ),
                    Positioned(
                      // top: -25,
                      // right: -25,
                      top: 10,
                      right: 10,
                      child: InkWell(
                        onTap: () async {
                          setState(() {
                            gameWin = false;
                            // gameWinAnimate = false;
                          });

                          // await Sounds.pointsCollect;

                          (!user["sound"])? null :
                          await AudioCache().play('sounds/${Sound.PointsCollect}');

                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              // builder: (context) => dialogUserBoard(widget.mode, widget.level, widget.user, data, adProvider)
                              // builder: (context) => dialogUserBoard(context, widget.mode, currentLevel, widget.user, data, adProvider)
                              // builder: (context) => dialogUserBoard(context, widget.mode, currentLevel, user, data, adProvider)
                              builder: (context) => dialogUserBoard(context, widget.mode, currentLevel, user, data, adProvider, isDailyChallange: widget.isDailyChallenge)
                          ).then((value) {
                            // if(value){

                            // print('value dialog ${value as bool}');
                            print('value dialog ${value}');

                            if(value==1){
                              setState(() {
                                pointsCollected = true;
                              });

                              // Future.delayed(const Duration(seconds: 2), ()//2 sec animation
                              Future.delayed(const Duration(seconds: 1), ()//2 sec animation
                              async {

                                user = await Database.pathData("users").doc(user['id']).get();
                                setState(() {
                                  user;
                                });

                                setState(() {
                                  pointsCollected = false;
                                });
                                if (int.parse(currentLevel) > 1) {
                                  setState(() {
                                    currentLevel =
                                    '${int.tryParse(currentLevel)! + 1}';
                                  });

                                  loadPuzzleData();

                                  // setState(() {
                                  //   sec = 0;
                                  //   min = 0;
                                  //   hour = 0;
                                  // });

                                  setMinute();

                                  setState(() {
                                    maxCorrect = 1000;//5
                                    corrected = 0;
                                    usedHint = 0;
                                    mistakes = 0;
                                    selectedKey = "";
                                    keypad = "";

                                    hint = false;
                                    gameEnd = false;

                                    // playLevel = "Level 1";
                                    playLevel = "$currentLevel";
                                    playTime = "00:00";

                                    hintTime = "00:00";

                                  });

                                  adProvider.initializeRewarded();
                                }
                              });
                            }
                            else if(value==0){

                              (!user["sound"])? null :
                              Sounds.buttonClick;
                              // Navigator.of(context).pop()
                              // widget.user["login_mode"]=="Guest"?
                              // // Navigator.of(context).pop():null;
                              // Navigator.of(context).popUntil((route) => route.isFirst):null;

                              Navigator.of(context).pop();

                              // widget.user["login_mode"]=="Guest"?
                              // // Navigator.of(context).pushReplacement(
                              // Navigator.of(context).pushReplacement(
                              //   MaterialPageRoute(
                              //       builder: (context) => Screen2(user: widget.user,)
                              //   ),
                              // ):

                              Navigator.pushReplacement(context,
                                NavigateWithOpaque(
                                  // child: AuthScreen(start: false,),
                                  child: AuthScreen(start: false, isGuestMode: user["login_mode"]=="Guest",),
                                  direction: AxisDirection.down,
                                ),
                              );

                            }

                            // }
                          });

                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            //color: Color(0xffc9c9c9),
                            // color: Colors.amber,
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.all(Radius.circular(45)),
                          ),
                          width: 40,
                          height: 40,
                          child: Container(
                            decoration: const BoxDecoration(
                              // color: Color(0xffc9c9c9),
                              color: Color(0xfff5f5f5),
                              // color: Colors.amber,
                              borderRadius: BorderRadius.all(Radius.circular(45)),
                            ),
                            // width: 40,
                            // height: 40,
                            margin: const EdgeInsets.all(3),
                            alignment: Alignment.center,
                            child: const Text("X",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                // color: Colors.amber,
                                color: Colors.redAccent,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    ),
  );

}
*/


Dialog dialogScoreBoard (BuildContext context, DocumentSnapshot user, List users) {
// Dialog dialogScoreBoard (BuildContext context, DocumentSnapshot user) {



  Size display = MediaQuery.of(context).size;
  double width = display.width;
  double height = display.height;

  const mockupWidth = 390;
  const mockupHeight = 844;

  final scale = mockupWidth / width;

  bool isEasy=true, isMedium=false, isHard=false, isImpossible=false;
  // bool isSound=true, isMusic=true, isAlarm=true;
  // bool isUser = false;

  // bool btnClicked = false;

  // List users = [];

  final bool isTablat = width>500 && height>800?true:false;

  return Dialog(
    elevation: 0,
    // insetPadding: EdgeInsets.all(10),
    // insetPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
    insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    // insetPadding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
    backgroundColor: Colors.transparent,
    alignment: Alignment.center,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ), //this right here
    child: StatefulBuilder(
        builder: (context, setState) {

          print("width ${MediaQuery.of(context).size.width}");
          print("height ${MediaQuery.of(context).size.height}");

          // return Theme(
          //   data: Theme.of(context).copyWith(
          //       colorScheme: ColorScheme.light(
          //         // primary: Colors.yellow,
          //         // onPrimary: Colors.black,
          //         // onSurface: Colors.teal,
          //         primary: Colors.red,
          //         onPrimary: Colors.white,
          //         onSurface: Colors.black,
          //       ),
          //       textButtonTheme: TextButtonThemeData(
          //           style: TextButton.styleFrom(
          //             // primary: Colors.teal
          //               primary: Colors.black
          //           )
          //       )
          //   ),
          //   child:
          // );

          // bool isSound=true, isMusic=true, isAlarm=true;

          return Container(
            // height: 506,
            // width: 364,
            // color: Colors.transparent,
            // color: Color(0xff1C1C1C).withOpacity(1),

            // width: 364,
            // height: 506,


            child: Stack(
              children: [

                Container(
                  // height: 506-20,
                  // width: 364-20,

                  // height: 506,
                  // width: 364,

                  /*height: (506*scale)/mockupHeight*height,
                  width: (364*width)/mockupWidth*width,*/
                  height: isTablat?600:(506*scale)/mockupHeight*height,
                  width: isTablat?504:(364*scale)/mockupWidth*width,

                  // margin: EdgeInsets.all(20),
                  // margin: EdgeInsets.all(25),
                  // margin: EdgeInsets.all(
                  //     MediaQuery.of(context).size.width*0.025
                  // ),
                  margin: EdgeInsets.all(15),
                  // margin: EdgeInsets.symmetric(
                  //     horizontal: 10,
                  //     vertical: 12
                  // ),

                  decoration: BoxDecoration(
                    // color: Color(0xff1E7455),
                    // color: Color(0xffffffff),
                    // color: colors.white,
                    color: colors.white,
                    // color: Colors.transparent,
                    // border: Border.all(width: 20, color:  Color(0xffffff)),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Container(
                    // height: 506-10,
                    // width: 364-10,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      // color: Color(0xff1E7455),
                      color: colors.green,
                      // color: colors.white,
                      // color: Color(0xffffffff),
                      // border: Border.all(width: 15, color:  Color(0xffffffff)),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Container(
                            decoration: BoxDecoration(
                              // color: Color(0xff1E7455),
                              // color: Color(0xffffffff),
                              color: colors.white,
                              // color: Colors.transparent,
                              // border: Border.all(width: 20, color:  Color(0xffffff)),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              ),
                            ),
                            // height: 58,
                            /*height: (58*scale)/mockupHeight*height,*/
                            height: isTablat?88:(58*scale)/mockupHeight*height,
                            child: Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () async {
                                      // users = await Login.getUsersWithFilter(user!.id);
                                      // setState((){users;});

                                      // setState((){isEasy=true; isMedium=false; isHard=false; isImpossible=false;});

                                      // await methods.playSound(file: "click1")
                                      //     .then((value) {

                                      /*(!user["sound"])? null :
                                      await Sounds.buttonClick;*/
                                      // Future.delayed(const Duration(seconds: 1),() async {
                                      //   Future.delayed(const Duration(milliseconds: 200),() async {
                                      Future.delayed(const Duration(milliseconds: 10),() async {
                                          // users = await Login.getUsersWithFilter(user!.id);
                                        users = await Login.getUsersWithFilter(user.id);
                                          setState((){users;});
                                          setState((){isEasy=true; isMedium=false; isHard=false; isImpossible=false;});
                                        });
                                      // });


                                    },

                                    child: Container(
                                      // width: 308,
                                      // width: (MediaQuery.of(context).size.width-105)/2,
                                      // width: 172-11,
                                      // height: 231,
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(17),
                                      // padding: EdgeInsets.symmetric(vertical: 17),
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                        gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            // colors: [
                                            //   colors.green,
                                            //   colors.lightGreen
                                            // ]

                                            colors: isEasy?[
                                              colors.green,
                                              colors.lightGreen
                                            ]
                                                :[
                                              colors.green.withOpacity(0.3),
                                              colors.lightGreen.withOpacity(0.3),
                                            ]

                                        ),

                                      ),
                                      child: Text(
                                        "Easy",
                                        style: TextStyle(
                                          // color: Color(0xffffffff),
                                          color: isEasy?colors.white:colors.green,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w700,
                                          /*fontSize: 12,*/
                                          fontSize: isTablat?20:12,
                                        ),

                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () async {
                                      // users = await Login.getUsersWithFilter(user!.id, mode: "Medium");
                                      // setState((){users;});
                                      // setState((){isEasy=false; isMedium=true; isHard=false; isImpossible=false;});

                                      // await methods.playSound(file: "click1")
                                      //     .then((value) {

                                      /*(!user["sound"])? null :
                                      await Sounds.buttonClick;*/
                                      // Future.delayed(const Duration(seconds: 1),() async {
                                      //   Future.delayed(const Duration(milliseconds: 200),() async {
                                      Future.delayed(const Duration(milliseconds: 10),() async {
                                          // users = await Login.getUsersWithFilter(user!.id, mode: "Medium");
                                        users = await Login.getUsersWithFilter(user.id, mode: "Medium");
                                          setState((){users;});
                                          setState((){isEasy=false; isMedium=true; isHard=false; isImpossible=false;});
                                        });
                                      // });

                                    },
                                    child: Container(
                                      // width: 308,
                                      // width: MediaQuery.of(context).size.width,
                                      // width: MediaQuery.of(context).size.width/3,
                                      // width: 172-11,
                                      // width: (MediaQuery.of(context).size.width-105)/2,
                                      alignment: Alignment.center,
                                      // height: 231,
                                      // padding: EdgeInsets.all(17),
                                      padding: EdgeInsets.symmetric(vertical: 17),
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                          // bottomRight: Radius.circular(0),
                                        ),
                                        gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            // colors: [
                                            //   // colors.green,
                                            //   // colors.lightGreen
                                            //   colors.green.withOpacity(0.3),
                                            //   colors.lightGreen.withOpacity(0.3),
                                            //
                                            //   // colors.green.withOpacity(0.3),
                                            //   // colors.lightGreen.withOpacity(0.3),
                                            // ]

                                            colors: isMedium?[
                                              colors.green,
                                              colors.lightGreen
                                            ]
                                                :[
                                              colors.green.withOpacity(0.3),
                                              colors.lightGreen.withOpacity(0.3),
                                            ]

                                        ),
                                      ),
                                      child: Text(
                                        "Medium",
                                        style: TextStyle(
                                          // color: Color(0xffffffff),
                                          // color: colors.green,
                                          color: isMedium?colors.white:colors.green,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w700,
                                          /*fontSize: 12,*/
                                          fontSize: isTablat?20:12,
                                        ),

                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () async {
                                      // users = await Login.getUsersWithFilter(user!.id, mode: "Hard");
                                      // setState((){users;});
                                      // setState((){isEasy=false; isMedium=false; isHard=true; isImpossible=false;});

                                      // await methods.playSound(file: "click1")
                                      //     .then((value) {

                                      /*(!user["sound"])? null :
                                      await Sounds.buttonClick;*/
                                      // Future.delayed(const Duration(seconds: 1),() async {
                                      //   Future.delayed(const Duration(milliseconds: 200),() async {
                                      Future.delayed(const Duration(milliseconds: 10),() async {
                                          // users = await Login.getUsersWithFilter(user!.id, mode: "Hard");
                                        users = await Login.getUsersWithFilter(user.id, mode: "Hard");
                                          setState((){users;});
                                          setState((){isEasy=false; isMedium=false; isHard=true; isImpossible=false;});
                                        });
                                      // });

                                    },

                                    child: Container(
                                      // width: 308,
                                      // width: (MediaQuery.of(context).size.width-105)/2,
                                      // width: 172-11,
                                      // height: 231,
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(17),
                                      // padding: EdgeInsets.symmetric(vertical: 17),
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                        gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            // colors: [
                                            //   colors.green,
                                            //   colors.lightGreen
                                            // ]

                                            colors: isHard?[
                                              colors.green,
                                              colors.lightGreen
                                            ]
                                                :[
                                              colors.green.withOpacity(0.3),
                                              colors.lightGreen.withOpacity(0.3),
                                            ]

                                        ),

                                      ),
                                      child: Text(
                                        "Hard",
                                        style: TextStyle(
                                          // color: Color(0xffffffff),
                                          color: isHard?colors.white:colors.green,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w700,
                                          /*fontSize: 12,*/
                                          fontSize: isTablat?20:12,
                                        ),

                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () async {
                                      // users = await Login.getUsersWithFilter(user!.id, mode: "Impossible");
                                      // setState((){users;});
                                      // setState((){isEasy=false; isMedium=false; isHard=false; isImpossible=true;});

                                      // await methods.playSound(file: "click1")
                                      //     .then((value) {
                                        // Future.delayed(const Duration(seconds: 1),() async {

                                      /*(!user["sound"])? null :
                                      await Sounds.buttonClick;*/
                                        // Future.delayed(const Duration(milliseconds: 200),() async {
                                      Future.delayed(const Duration(milliseconds: 10),() async {
                                          // users = await Login.getUsersWithFilter(user!.id, mode: "Impossible");
                                        users = await Login.getUsersWithFilter(user.id, mode: "Impossible");
                                          setState((){users;});
                                          setState((){isEasy=false; isMedium=false; isHard=false; isImpossible=true;});
                                        });
                                      // });

                                    },
                                    child: Container(
                                      // width: 308,
                                      // width: MediaQuery.of(context).size.width,
                                      // width: MediaQuery.of(context).size.width/3,
                                      // width: 172-11,
                                      // width: (MediaQuery.of(context).size.width-105)/2,
                                      alignment: Alignment.center,
                                      // height: 231,
                                      // padding: EdgeInsets.all(17),
                                      padding: EdgeInsets.symmetric(vertical: 17),
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                          // bottomRight: Radius.circular(0),
                                        ),
                                        gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            // colors: [
                                            //   // colors.green,
                                            //   // colors.lightGreen
                                            //   colors.green.withOpacity(0.3),
                                            //   colors.lightGreen.withOpacity(0.3),
                                            //
                                            //   // colors.green.withOpacity(0.3),
                                            //   // colors.lightGreen.withOpacity(0.3),
                                            // ]

                                            colors: isImpossible?[
                                              colors.green,
                                              colors.lightGreen
                                            ]
                                                :[
                                              colors.green.withOpacity(0.3),
                                              colors.lightGreen.withOpacity(0.3),
                                            ]

                                        ),
                                      ),
                                      child: Text(
                                        "Impossible",
                                        style: TextStyle(
                                          // color: Color(0xffffffff),
                                          // color: colors.green,
                                          color: isImpossible?colors.white:colors.green,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w700,
                                          /*fontSize: 12,*/
                                          fontSize: isTablat?20:12,
                                        ),

                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          //isEasy?
                          // Column(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   crossAxisAlignment: CrossAxisAlignment.center,
                          //   children: [
                          //
                          //     SizedBox(height: 20,),
                          //
                          //     Container(
                          //       margin: EdgeInsets.all(5),
                          //       child: Row(
                          //         mainAxisAlignment: MainAxisAlignment.center,
                          //         crossAxisAlignment: CrossAxisAlignment.center,
                          //         children: [
                          //           InkWell(
                          //             onTap: (){
                          //               isMusic = !isMusic;
                          //               setState((){isMusic;});
                          //             },
                          //             // child: Image.asset("assets/images/Component 1.png", scale: 5,),
                          //             child: Image.asset("assets/images/${isMusic?"Component 1":"Component 1-1"}.png", scale: 5,),
                          //           ),
                          //           InkWell(
                          //             onTap: (){
                          //               isSound = !isSound;
                          //               setState((){isSound;});
                          //             },
                          //             // child: Image.asset("assets/images/${isSound?"Component 2":"Component 2_1"}.png", scale: 5,),
                          //             child: Image.asset("${isSound?"assets/images/Component 2.png":"assets/images/Component 2_1.png"}", scale: 5,),
                          //           ),
                          //           InkWell(
                          //             onTap: (){
                          //               isAlarm = !isAlarm;
                          //               setState((){isAlarm;});
                          //             },
                          //             // child: Image.asset("assets/images/Component 3.png", scale: 5,),
                          //             child: Image.asset("assets/images/${isAlarm?"Component 3":"Component 3-1"}.png", scale: 5,),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //
                          //     Container(
                          //       margin: EdgeInsets.all(5),
                          //       child: InkWell(
                          //         onTap: (){},
                          //         child: Image.asset("assets/images/support.png", scale: 5,),
                          //       ),
                          //     ),
                          //
                          //     Container(
                          //       margin: EdgeInsets.all(5),
                          //       child: InkWell(
                          //         onTap: (){},
                          //         child: Image.asset("assets/images/terms.png", scale: 5,),
                          //       ),
                          //     ),
                          //
                          //     Container(
                          //       margin: EdgeInsets.all(5),
                          //       child: InkWell(
                          //         onTap: (){},
                          //         child: Image.asset("assets/images/signout.png", scale: 5,),
                          //       ),
                          //     ),
                          //   ],
                          // )



                          SingleChildScrollView(
                            child: Container(
                              child: Column(
                                children:
                                // [
                                //   {
                                //     'img':"https://s3-alpha-sig.figma.com/img/a63f/33dc/513b7d1b6dd7f5b68fbf6b30c4648595?Expires=1652054400&Signature=Q-PYn8ren-JrBAoG8jrgaLEnjMxyZ5yefkwiG~zcphRt90AdgpuFSDiQs1lmtT1MR0shidUz506B2zQh62SQEtAZBmJc0i~dcPbOtcU29gYm4gcxCHhGu1OJrDK3t5lHMiAuYO7-CCtLVDdBQpFsOOTppkg42cYGfUdTtMcl7ofzZZt2tWXo8wJIwISKnxfgsWwPIGw81UfK~L9uHBeiYlfyk0VOF8ggFewZYV-zJfkfU513qBa38qgzUnNKlyfyw-ylI1enz8ie8C3z5NwzmSLFGeEN9YwEjhc7klMFm1Kx6YO-qWno7U4PjyjdXXg~O68w01HtqW4s-A5qndTXNQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
                                //     'name':"Magic Turkey",
                                //     'points':5,
                                //     'medal':"Gold",
                                //     'user':false,
                                //   },
                                //   {
                                //     'img':"https://s3-alpha-sig.figma.com/img/0ab4/d980/a8924977f52389fde514322490ade0de?Expires=1652054400&Signature=UVtx5k5N3kyDlWE81B-Lr3~hbJs5Y2H0Oaj~SIhhRwwCdDp0o5KlhyEAYkM-0YL5UCx6eMA7h11VTo63kkOIhdd6WFEcNaFIHCKomVlL1Wudgd2ge8OHtbRFAWEtKLWC6RuVL5WVGuXdbj9GdhX4dgMeO4UH8POJdZq--IytLf2RnGJjgXI6NPsBE95jmYWqxbx7650lv2RqyNSR8EceP-Pmx8JbrMyExRsh8xvdyOpQvJ9GL~QMC5Owdw47KLzM12fhZxNrVrJmS10YXQGcM2M0JnRY9aBW7NLbZjlBcNZhYfMzpc1vLnCoOxZtKDnOwuPKgPUqTA0HJvDY3eRU7g__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
                                //     'name':"Sarcastic Genius",
                                //     'points':5,
                                //     'medal':"Silver",
                                //     'user':false,
                                //   },
                                //   {
                                //     'img':"https://s3-alpha-sig.figma.com/img/cc55/03d4/0aad3530709e4a14787fd5c16f378c2a?Expires=1652054400&Signature=ZzyNAECHGsnKdQbkqRi7fQMOOVlqxUuLRsMpfLm01iqxgVuYwoPMhpeiaI0swIJ~T-vTgpc6BsjV0pflQ3QTrHuyKKChKEo-0-cZmuJHhAiAzFnrskf3cheDj0VbbwQLDGF4YpWpJJCQCIioOVoplEqlS7MneZawqw7lo-WZPhWgjk68V4E1iCaQw2ZnkeGft2wlmolxDXi1mtYHCL~LPsYrtFOWUFTjsSDBpiH6t6Jf3uyfHhzkPNFZ7-GegAWPF5VDJPtJ~2ZOOCCAeKVIt5dB53XpAzKEjvDngNPb1J-zvU~-x2Mp5sBNuvVWezFTwwSKLKBlSB2sBEluCqDzUQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
                                //     'name':"Peppy ibis",
                                //     'points':5,
                                //     'medal':"Bronze",
                                //     'user':false,
                                //   },
                                //   {
                                //     'img':"https://s3-alpha-sig.figma.com/img/d930/bae1/1b9d34bb4aaa8ad5fc46f3d79bddb528?Expires=1652054400&Signature=eJQGhC~31mLYe5olQZdc-SdXzhMnyIh5GFBr1Xt87XTeZQGjxL7qKdUV4hboZOv~hQ3B3r2lYPTvxMm~BIIdgK4YuHfJEenDumvgCwB5eOMEju-ZL5sbq402~VujwK-0BUGm0r1IS-LUKjuyHN0cBmJljVzTYtD5uZ~eAkxmsvZpG1AYiQwqa5AofM6gFHpaFVJADetZE2MJK8mEq1Q5VVEYGXppHnnnabIWbzsYilTgaemtn-6D4diUXwxRIxYIPAq6k~rSuPPqCdVVqHVDD1ohkfJSDpEEktnsMQRPRsAMKIKEuPQHJ3LzXQoFA7NaJAJ1nObdSf3BnjNujq5sRw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
                                //     'name':"Grand Badger",
                                //     'points':4,
                                //     'medal':"",
                                //     'user':false,
                                //   },
                                //   {
                                //     'img':"https://s3-alpha-sig.figma.com/img/5d71/a72c/7334645bc59534fecf6563fa5539d0d2?Expires=1652054400&Signature=JnXoX8XaO-Ssh0K0EQ7cz0~zOnrR0LLbKgeFwxY8taESN7j3tWGPihZBwBqrYyT~bJGBFOl7njJb-NJpGo2CWMA1bkFVOfxQDxE8aZJFJ3rmVvhTi9j0Ou34ORK98SArJ93RemeabzszdwLSAar9aT4NY~HJ4QHumAFALHVv8bSwt7~GzXcwT7AudxMlMwk0jGZHgzxK5AofjOYopY676qQ5UsZnF-gSqDNj5hd0BQ3EKENo~7DGZEJfZbCetBDggp55KFG6-jgMy2itbg1oagoWt0UwzizsHuQcXQ98Ndl9AbkCnrEACftPYcghUDv8gMzjF4c05M~quO-KxsFxHg__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
                                //     'name':"Curly Beak",
                                //     'points':5,
                                //     'medal':"",
                                //     'user':false,
                                //   },
                                //   // {
                                //   //   'img':"https://s3-alpha-sig.figma.com/img/3db4/1314/ecfc86a48fc2d1edf4b52bef6fba5259?Expires=1652054400&Signature=NQy0tJ84IJHrwQBvR2A6eg6ZYiUNEubUpUHOOl~Anoag81gPnNUhJlWVnXAWEBK5If5-XEqMJuYcp2aNhOTsOLkDxXhRvYlL3VY~RsbKsw2LOJGebgkoG3wfl8TBb0huTeQDpQxbgZ6o2iNlkt2~PvHAPSQ1nLRIVyeXJasZMIY9SobtkK45-JJ16S4Ov7KvUYamN2eLvloBIMqlPo5sLkBeKhNz8vwlnZJWFuwSRPl4ykaaJY1ZhhPELeb4wdhIJDzNOCkveJXBx7VDP77hyr3GSKXyUuqRe79a4-3tR-aytElpuJvo1H5~pbzd0v16kC8tgZDIGtvR9VUkkP2XbQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
                                //   //   'name':"Dreamy Pooh",
                                //   //   'points':611,
                                //   //   'medal':"",
                                //   //   'user':true,
                                //   // }
                                //   {
                                //     'img': user["pic"],
                                //     'name':user["name"],
                                //     'points':user["points"],
                                //     // 'medal': user["medals"]["bronze"]>0?"Bronze"
                                //     //     :user["medals"]["gold"]>0?"Gold"
                                //     //     :user["medals"]["silver"]>0?"Silver":"",
                                //     'medal': "",
                                //     'user':true,
                                //   }
                                // ]
                                users
                                .map((e){
                                  return Container(

                                    child: Container(
                                      child: Column(
                                        children: [
                                          Container(
                                            // width: 308,
                                            // height: 60,

                                            // width: 344,
                                            // // height: 75,
                                            // height: (e["user"] as bool)?75:65,

                                            /*width: (344*scale)/mockupWidth*width,
                                            height: (((e["user"] as bool)?75:65)*scale)/mockupHeight*height,*/
                                            width: isTablat?344:(344*scale)/mockupWidth*width,
                                            height: isTablat?75:(((e["user"] as bool)?75:65)*scale)/mockupHeight*height,

                                            // color: isUser?colors.white:colors.green,
                                            color: (e["user"] as bool)?colors.white:colors.green,

                                            padding: EdgeInsets.all(17),

                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  // flex: 2,
                                                  child: Container(
                                                    // height: 60,
                                                    // width: 60,
                                                    // height: 50,
                                                    // width: 50,
                                                    /*height: (50*scale)/mockupHeight*height,
                                                    width: (50*scale)/mockupWidth*width,*/
                                                    height: isTablat?65:(50*scale)/mockupHeight*height,
                                                    width: isTablat?65:(50*scale)/mockupWidth*width,
                                                    // height: 43,
                                                    // width: 43,
                                                    decoration: BoxDecoration(
                                                      // color: Color(0xff1E7455),
                                                      // color: Color(0xffC3333C),
                                                      // color: Color(0xffffffff),
                                                      // color: colors.white,
                                                      // border: Border.all(width: 5, color: Color(0xffffffff)),
                                                      // border: Border.all(width: 1, color: Color(0xffFFFDF9)),
                                                      borderRadius: BorderRadius.circular(180),
                                                      //drop shadow effect
                                                      // boxShadow: [
                                                      //   BoxShadow(
                                                      //     color: Colors.black.withOpacity(0.25),
                                                      //     spreadRadius: 4,
                                                      //     blurRadius: 4,
                                                      //     offset: const Offset(0,4),
                                                      //   ),
                                                      // ],
                                                    ),
                                                    // child: Image.asset("assets/images/close.png", scale: 3,),
                                                    child: CircleAvatar(
                                                      radius: 180,
                                                      backgroundImage: NetworkImage(
                                                        // "https://s3-alpha-sig.figma.com/img/3db4/1314/ecfc86a48fc2d1edf4b52bef6fba5259?Expires=1652054400&Signature=NQy0tJ84IJHrwQBvR2A6eg6ZYiUNEubUpUHOOl~Anoag81gPnNUhJlWVnXAWEBK5If5-XEqMJuYcp2aNhOTsOLkDxXhRvYlL3VY~RsbKsw2LOJGebgkoG3wfl8TBb0huTeQDpQxbgZ6o2iNlkt2~PvHAPSQ1nLRIVyeXJasZMIY9SobtkK45-JJ16S4Ov7KvUYamN2eLvloBIMqlPo5sLkBeKhNz8vwlnZJWFuwSRPl4ykaaJY1ZhhPELeb4wdhIJDzNOCkveJXBx7VDP77hyr3GSKXyUuqRe79a4-3tR-aytElpuJvo1H5~pbzd0v16kC8tgZDIGtvR9VUkkP2XbQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
                                                        "${e["img"]}",
                                                        // fit: BoxFit.cover,
                                                      ),
                                                      // child: Image.network(
                                                      //   "https://s3-alpha-sig.figma.com/img/3db4/1314/ecfc86a48fc2d1edf4b52bef6fba5259?Expires=1652054400&Signature=NQy0tJ84IJHrwQBvR2A6eg6ZYiUNEubUpUHOOl~Anoag81gPnNUhJlWVnXAWEBK5If5-XEqMJuYcp2aNhOTsOLkDxXhRvYlL3VY~RsbKsw2LOJGebgkoG3wfl8TBb0huTeQDpQxbgZ6o2iNlkt2~PvHAPSQ1nLRIVyeXJasZMIY9SobtkK45-JJ16S4Ov7KvUYamN2eLvloBIMqlPo5sLkBeKhNz8vwlnZJWFuwSRPl4ykaaJY1ZhhPELeb4wdhIJDzNOCkveJXBx7VDP77hyr3GSKXyUuqRe79a4-3tR-aytElpuJvo1H5~pbzd0v16kC8tgZDIGtvR9VUkkP2XbQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
                                                      //   // "${e["img"]}",
                                                      //   // fit: BoxFit.cover,
                                                      // ),
                                                      // backgroundColor: colors.white,
                                                      backgroundColor: (e["user"] as bool)?colors.green:colors.white,
                                                    ),
                                                  ),
                                                ),
                                                // SizedBox(width: 14,),
                                                Expanded(
                                                  flex: 3,
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    child: Text( //"Dreamy Pooh",
                                                      // "${e["name"]}",

                                                      // "${e["name"] ?? (e["email"] as String).replaceAll(".com", "")}",
                                                      "${e["name"] ?? (e["email"] as String).split("@")[0]}",
                                                      // "${e["login_mode"]=="Email"? (e["email"] as String).replaceAll(".com", ""): e["name"]}",

                                                      // textAlign: TextAlign.justify,

                                                      style: TextStyle(
                                                        //color: Color(0xffffffff),
                                                        // color: isUser?colors.green:colors.white,
                                                        color: (e["user"] as bool)?colors.green:colors.white,
                                                        fontFamily: 'Roboto',
                                                        fontWeight: FontWeight.w700,
                                                        // fontSize: 20,
                                                        // fontSize: 16,
                                                        // fontSize: (width<=360?14:16*scale)/mockupWidth*width,
                                                        /*fontSize: (width<=360?14:((user["name"] as String).length>14?14:16)*scale)/mockupWidth*width,*/
                                                        fontSize: isTablat?18:(width<=360?14:((user["name"] as String).length>14?14:16)*scale)/mockupWidth*width,
                                                        // fontSize: (e["name"] as String).length>15?16:20,
                                                      ),

                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child:
                                                  e["medal"]!=""?
                                                  Container(
                                                    alignment: Alignment.center,
                                                    child: Image.asset(
                                                        e["medal"]=="Gold"?"assets/images/medal-gold.png"
                                                        :e["medal"]=="Silver"?"assets/images/medal-silver.png"
                                                        :e["medal"]=="Bronze"?"assets/images/medal-bronze.png"
                                                            :""
                                                    ),
                                                  )
                                                  :
                                                  Container(
                                                    alignment: Alignment.center,
                                                    child: Text(//"611",
                                                      // "${e["points"]}",
                                                      // "${e["points"]["easy"]}",
                                                      "${e["points"]["${isEasy?"easy":
                                                        isMedium?"medium":isHard?"hard":
                                                        isImpossible?"impossible":""}"]}",
                                                      // textAlign: TextAlign.justify,

                                                      style: TextStyle(
                                                        // color: Color(0xffffffff),
                                                        // color: isUser?colors.green:colors.white,
                                                        color: (e["user"] as bool)?colors.green:colors.white,
                                                        fontFamily: 'Roboto',
                                                        fontWeight: FontWeight.w700,
                                                        // fontSize: 20,
                                                        /*fontSize: (width<=360?16:20*scale)/mockupWidth*width,*/
                                                        fontSize: isTablat?20:(width<=360?16:20*scale)/mockupWidth*width,
                                                      ),

                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          (e["user"] as bool)?Container():Container(
                                            height: 1,
                                            width: MediaQuery.of(context).size.width,
                                            margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/6),
                                            color: colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                              //:Container(),

                          /**/


                          /*
                          Container(
                            child: FutureBuilder(
                              // future: users,
                              future: Login.getUsersWithFilter(user!.id, mode: isImpossible?"Impossible":isHard?"Hard":isMedium?"Medium":"Easy"),
                              builder: (context, snapshot){
                                if(snapshot.hasData){
                                  users = snapshot.data as List<dynamic>;
                                  // setState((){users;});
                                  return ListView.builder(
                                    itemCount: users.length,
                                      itemBuilder: (context, index){
                                        final e = users[index];
                                        return Container(

                                          child: Container(
                                            child: Column(
                                              children: [
                                                Container(
                                                  // width: 308,
                                                  // height: 60,

                                                  // width: 344,
                                                  // // height: 75,
                                                  // height: (e["user"] as bool)?75:65,

                                                  width: (344*scale)/mockupWidth*width,
                                                  height: (((e["user"] as bool)?75:65)*scale)/mockupHeight*height,

                                                  // color: isUser?colors.white:colors.green,
                                                  color: (e["user"] as bool)?colors.white:colors.green,

                                                  padding: EdgeInsets.all(17),

                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Expanded(
                                                        // flex: 2,
                                                        child: Container(
                                                          // height: 60,
                                                          // width: 60,
                                                          // height: 50,
                                                          // width: 50,
                                                          height: (50*scale)/mockupHeight*height,
                                                          width: (50*scale)/mockupWidth*width,
                                                          // height: 43,
                                                          // width: 43,
                                                          decoration: BoxDecoration(
                                                            // color: Color(0xff1E7455),
                                                            // color: Color(0xffC3333C),
                                                            // color: Color(0xffffffff),
                                                            // color: colors.white,
                                                            // border: Border.all(width: 5, color: Color(0xffffffff)),
                                                            // border: Border.all(width: 1, color: Color(0xffFFFDF9)),
                                                            borderRadius: BorderRadius.circular(180),
                                                            //drop shadow effect
                                                            // boxShadow: [
                                                            //   BoxShadow(
                                                            //     color: Colors.black.withOpacity(0.25),
                                                            //     spreadRadius: 4,
                                                            //     blurRadius: 4,
                                                            //     offset: const Offset(0,4),
                                                            //   ),
                                                            // ],
                                                          ),
                                                          // child: Image.asset("assets/images/close.png", scale: 3,),
                                                          child: CircleAvatar(
                                                            radius: 180,
                                                            backgroundImage: NetworkImage(
                                                              // "https://s3-alpha-sig.figma.com/img/3db4/1314/ecfc86a48fc2d1edf4b52bef6fba5259?Expires=1652054400&Signature=NQy0tJ84IJHrwQBvR2A6eg6ZYiUNEubUpUHOOl~Anoag81gPnNUhJlWVnXAWEBK5If5-XEqMJuYcp2aNhOTsOLkDxXhRvYlL3VY~RsbKsw2LOJGebgkoG3wfl8TBb0huTeQDpQxbgZ6o2iNlkt2~PvHAPSQ1nLRIVyeXJasZMIY9SobtkK45-JJ16S4Ov7KvUYamN2eLvloBIMqlPo5sLkBeKhNz8vwlnZJWFuwSRPl4ykaaJY1ZhhPELeb4wdhIJDzNOCkveJXBx7VDP77hyr3GSKXyUuqRe79a4-3tR-aytElpuJvo1H5~pbzd0v16kC8tgZDIGtvR9VUkkP2XbQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
                                                              "${e["img"]}",
                                                              // fit: BoxFit.cover,
                                                            ),
                                                            // child: Image.network(
                                                            //   "https://s3-alpha-sig.figma.com/img/3db4/1314/ecfc86a48fc2d1edf4b52bef6fba5259?Expires=1652054400&Signature=NQy0tJ84IJHrwQBvR2A6eg6ZYiUNEubUpUHOOl~Anoag81gPnNUhJlWVnXAWEBK5If5-XEqMJuYcp2aNhOTsOLkDxXhRvYlL3VY~RsbKsw2LOJGebgkoG3wfl8TBb0huTeQDpQxbgZ6o2iNlkt2~PvHAPSQ1nLRIVyeXJasZMIY9SobtkK45-JJ16S4Ov7KvUYamN2eLvloBIMqlPo5sLkBeKhNz8vwlnZJWFuwSRPl4ykaaJY1ZhhPELeb4wdhIJDzNOCkveJXBx7VDP77hyr3GSKXyUuqRe79a4-3tR-aytElpuJvo1H5~pbzd0v16kC8tgZDIGtvR9VUkkP2XbQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
                                                            //   // "${e["img"]}",
                                                            //   // fit: BoxFit.cover,
                                                            // ),
                                                            // backgroundColor: colors.white,
                                                            backgroundColor: (e["user"] as bool)?colors.green:colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                      // SizedBox(width: 14,),
                                                      Expanded(
                                                        flex: 3,
                                                        child: Container(
                                                          alignment: Alignment.center,
                                                          child: Text( //"Dreamy Pooh",
                                                            // "${e["name"]}",

                                                            // "${e["name"] ?? (e["email"] as String).replaceAll(".com", "")}",
                                                            "${e["name"] ?? (e["email"] as String).split("@")[0]}",
                                                            // "${e["login_mode"]=="Email"? (e["email"] as String).replaceAll(".com", ""): e["name"]}",

                                                            // textAlign: TextAlign.justify,

                                                            style: TextStyle(
                                                              //color: Color(0xffffffff),
                                                              // color: isUser?colors.green:colors.white,
                                                              color: (e["user"] as bool)?colors.green:colors.white,
                                                              fontFamily: 'Roboto',
                                                              fontWeight: FontWeight.w700,
                                                              // fontSize: 20,
                                                              // fontSize: 16,
                                                              // fontSize: (width<=360?14:16*scale)/mockupWidth*width,
                                                              fontSize: (width<=360?14:((user["name"] as String).length>14?14:16)*scale)/mockupWidth*width,
                                                              // fontSize: (e["name"] as String).length>15?16:20,
                                                            ),

                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child:
                                                        e["medal"]!=""?
                                                        Container(
                                                          alignment: Alignment.center,
                                                          child: Image.asset(
                                                              e["medal"]=="Gold"?"assets/images/medal-gold.png"
                                                                  :e["medal"]=="Silver"?"assets/images/medal-silver.png"
                                                                  :e["medal"]=="Bronze"?"assets/images/medal-bronze.png"
                                                                  :""
                                                          ),
                                                        )
                                                            :
                                                        Container(
                                                          alignment: Alignment.center,
                                                          child: Text(//"611",
                                                            // "${e["points"]}",
                                                            // "${e["points"]["easy"]}",
                                                            "${e["points"]["${isEasy?"easy":
                                                            isMedium?"medium":isHard?"hard":
                                                            isImpossible?"impossible":""}"]}",
                                                            // textAlign: TextAlign.justify,

                                                            style: TextStyle(
                                                              // color: Color(0xffffffff),
                                                              // color: isUser?colors.green:colors.white,
                                                              color: (e["user"] as bool)?colors.green:colors.white,
                                                              fontFamily: 'Roboto',
                                                              fontWeight: FontWeight.w700,
                                                              // fontSize: 20,
                                                              fontSize: (width<=360?16:20*scale)/mockupWidth*width,
                                                            ),

                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                (e["user"] as bool)?Container():Container(
                                                  height: 1,
                                                  width: MediaQuery.of(context).size.width,
                                                  margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/6),
                                                  color: colors.white,
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }
                                  );
                                }
                                return Center(child: CircularProgressIndicator(color: Colors.white,),);
                              },
                            ),
                          ),
                          */



                          // isMedium?
                          // // Column(
                          // //   children: faqs.map((Map<String, dynamic> e) {
                          // //     return Container (
                          // //       width: MediaQuery.of(context).size.width,
                          // //       margin: EdgeInsets.all(10),
                          // //       padding: EdgeInsets.all(10),
                          // //       child: Column(
                          // //         mainAxisAlignment: MainAxisAlignment.start,
                          // //         crossAxisAlignment: CrossAxisAlignment.start,
                          // //         children: [
                          // //           Text(
                          // //             "${e["title"]}",
                          // //             style: TextStyle(
                          // //               // color: Color(0xffffffff),
                          // //               color: colors.white,
                          // //               fontFamily: 'Roboto',
                          // //               fontWeight: FontWeight.w700,
                          // //               fontSize: 12,
                          // //             ),
                          // //           ),
                          // //           Container(
                          // //             padding: EdgeInsets.only(top: 8, left: 10),
                          // //             child: Text(
                          // //               "${e["subtext"]}",
                          // //               style: TextStyle(
                          // //                 // color: Color(0xffffffff),
                          // //                 color: colors.white,
                          // //                 fontFamily: 'Roboto',
                          // //                 fontWeight: FontWeight.w400,
                          // //                 fontSize: 12,
                          // //               ),
                          // //             ),
                          // //           ),
                          // //         ],
                          // //       ),
                          // //     );
                          // //   }).toList(),
                          // // )
                          // Container()
                          //     :Container(),

                        ],
                      ),
                    ),
                  ),
                ),

                Positioned(
                  // top: -30,
                  // right: -30,

                  // right: 10,
                  top: 0,
                  right: 0,

                  // top: -5,
                  // right: -5,
                  // left: 325,
                  // top:MediaQuery.of(context).size.width,

                  child: GestureDetector(
                    // onTap: (){
                    //   Navigator.of(context).pop();
                    // },
                    onTap: () async {
                      // Navigator.of(context).pop();

                      // await methods.playSound(file: "soundscrate-graphics-game-blip-2")
                      // // await methods.playSound(file: "Wooden-Button-Click-Sound-Effect")
                      //     .then((value) {
                      //   Navigator.of(context).pop();
                      // });

                      /*(!user["sound"])? null :
                      await Sounds.buttonClick;*/
                      Navigator.of(context).pop();

                    },
                    child: Container(
                      // height: 60,
                      // width: 60,
                      // height: 50,
                      // width: 50,
                      /*height: (50*scale)/mockupHeight*height,
                      width: (50*scale)/mockupWidth*width,*/
                      height: isTablat?60:(50*scale)/mockupHeight*height,
                      width: isTablat?60:(50*scale)/mockupWidth*width,
                      decoration: BoxDecoration(
                        // color: Color(0xff1E7455),
                        color: Color(0xffC3333C),
                        // color: Color(0xffffffff),
                        // border: Border.all(width: 5, color: Color(0xffffffff)),
                        border: Border.all(width: 3, color: Color(0xffFFFDF9)),
                        borderRadius: BorderRadius.circular(180),
                        //drop shadow effect
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.black.withOpacity(0.25),
                        //     spreadRadius: 4,
                        //     blurRadius: 4,
                        //     offset: const Offset(0,4),
                        //   ),
                        // ],
                      ),
                      child: Image.asset("assets/images/close.png", scale: 3 * scale,),
                      /*child: Image.asset("assets/images/close.png", scale: isTablat?4:3 * scale,),*/
                    ),
                  ),
                ),

              ],
            ),
          );
        }),
  );
}

/*
Dialog dialogClose (BuildContext context, {required DocumentSnapshot user, required MAudio mAudio}){

  Size display = MediaQuery.of(context).size;
  double width = display.width;
  double height = display.height;

  const mockupWidth = 390;
  const mockupHeight = 844;

  final scale = mockupWidth / width;

  return Dialog(
    elevation: 0,
    // insetPadding: EdgeInsets.all(10),
    insetPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
    backgroundColor: Colors.transparent,
    alignment: Alignment.center,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ), //this right here
    child: StatefulBuilder(
        builder: (context, setState) {

          print("width ${MediaQuery.of(context).size.width}");
          print("height ${MediaQuery.of(context).size.height}");

          // return Theme(
          //   data: Theme.of(context).copyWith(
          //       colorScheme: ColorScheme.light(
          //         // primary: Colors.yellow,
          //         // onPrimary: Colors.black,
          //         // onSurface: Colors.teal,
          //         primary: Colors.red,
          //         onPrimary: Colors.white,
          //         onSurface: Colors.black,
          //       ),
          //       textButtonTheme: TextButtonThemeData(
          //           style: TextButton.styleFrom(
          //             // primary: Colors.teal
          //               primary: Colors.black
          //           )
          //       )
          //   ),
          //   child:
          // );

          return Container(
            // height: 506,
            // width: 364,
            // color: Colors.transparent,
            // color: Color(0xff1C1C1C).withOpacity(1),

            // width: 364,
            // height: 506,

            child: Stack(
              children: [

                Container(
                  // height: 506-20,
                  // width: 364-20,

                  // height: 506,
                  // width: 364,

                  // width: 343,
                  // height: 191,
                  width: (343*scale)/mockupWidth*width,
                  height: (191*scale)/mockupHeight*height,

                  // margin: EdgeInsets.all(20),
                  // margin: EdgeInsets.all(25),
                  margin: EdgeInsets.all(
                      MediaQuery.of(context).size.width*0.025
                  ),
                  // margin: EdgeInsets.symmetric(
                  //     horizontal: 10,
                  //     vertical: 12
                  // ),

                  decoration: BoxDecoration(
                    // color: Color(0xff1E7455),
                    // color: Color(0xffffffff),
                    color: colors.white,
                    // color: Colors.transparent,
                    // border: Border.all(width: 20, color:  Color(0xffffff)),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Container(
                    // height: 506-10,
                    // width: 364-10,
                    // margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      // color: Color(0xff1E7455),
                      // color: colors.green,
                      // color: Color(0xffffffff),
                      // border: Border.all(width: 15, color:  Color(0xffffffff)),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: ,
                        children: [

                          Container(
                            // width: 308,
                            width: MediaQuery.of(context).size.width,
                            // height: 231,
                            alignment: Alignment.center,
                            // padding: EdgeInsets.all(17),
                            // margin: EdgeInsets.symmetric(vertical: 37),
                            margin: EdgeInsets.only(top: 37),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              // gradient: LinearGradient(
                              //     begin: Alignment.centerLeft,
                              //     end: Alignment.centerRight,
                              //     colors: [
                              //       colors.green,
                              //       colors.lightGreen
                              //     ]
                              // ),
                            ),
                            child: Text(
                              "Are you sure you want to exit?",
                              style: TextStyle(
                                // color: Color(0xffffffff),
                                color: colors.green,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                // fontSize: 20,
                                fontSize: (width<=360?14:20*scale)/mockupWidth*width,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    // Navigator.of(context).pop();
                                    // Navigator.of(context).push(
                                    //   MaterialPageRoute(
                                    //       // builder: (context) => Screen2()
                                    //       builder: (context) => Screen2(user: user,)
                                    //   ),
                                    // );

                                    // await methods.playSound(file: "soundscrate-graphics-game-blip-2")
                                    //     .then((value) {
                                    //   Navigator.of(context).pop();
                                      // Navigator.push(context,

                                    (!user["sound"])? null :
                                    await Sounds.buttonClick;
                                    Navigator.of(context).pop();

                                      // user["login_mode"]=="Guest"?
                                      // Navigator.of(context).pushReplacement(
                                      // // Navigator.of(context).push(
                                      //   MaterialPageRoute(
                                      //       builder: (context) => Screen2(user: user,)
                                      //   ),
                                      // ):
                                      // Navigator.pushReplacement(context,
                                      //   NavigateWithOpaque(
                                      //     child: AuthScreen(),
                                      //     direction: AxisDirection.down,
                                      //   ),
                                      // );

                                    Navigator.of(context).pushReplacement(
                                      NavigateWithOpaque(
                                        // child: Screen3(user: user!, mAudio: mAudio,),
                                        // child: Screen3(user: user!, mAudio: mAudio, isClosed: true),
                                        child: Screen3(user: user,  isClosed: true),
                                        // duration: 200,
                                        direction: AxisDirection.left,
                                      ),
                                    );


                                    // });

                                  },
                                  child: Image.asset("assets/images/Group 28.png", scale: 5 * scale,),
                                ),
                                InkWell(
                                  onTap: () async {
                                    //Navigator.of(context).pop();
                                    // await methods.playSound(file: "soundscrate-graphics-game-blip-2")
                                    //     .then((value) {
                                    //   Navigator.of(context).pop();
                                    // });

                                    (!user["sound"])? null :
                                    await Sounds.buttonClick;
                                    Navigator.of(context).pop();

                                  },
                                  child: Image.asset("assets/images/Group 27.png", scale: 5 * scale,),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),

                // Positioned(
                //   // top: -30,
                //   // right: -30,
                //   top: 0,
                //   // right: 10,
                //   right: 0,
                //
                //   // top:MediaQuery.of(context).size.width,
                //
                //   child: GestureDetector(
                //     onTap: (){
                //       Navigator.of(context).pop();
                //     },
                //     child: Container(
                //       // height: 60,
                //       // width: 60,
                //       height: 50,
                //       width: 50,
                //       decoration: BoxDecoration(
                //         // color: Color(0xff1E7455),
                //         color: Color(0xffC3333C),
                //         // color: Color(0xffffffff),
                //         // border: Border.all(width: 5, color: Color(0xffffffff)),
                //         border: Border.all(width: 3, color: Color(0xffFFFDF9)),
                //         borderRadius: BorderRadius.circular(180),
                //         //drop shadow effect
                //         // boxShadow: [
                //         //   BoxShadow(
                //         //     color: Colors.black.withOpacity(0.25),
                //         //     spreadRadius: 4,
                //         //     blurRadius: 4,
                //         //     offset: const Offset(0,4),
                //         //   ),
                //         // ],
                //       ),
                //       child: Image.asset("assets/images/close.png", scale: 3,),
                //     ),
                //   ),
                // ),

              ],
            ),
          );
        }),
  );
}
*/
Dialog dialogClose (BuildContext context, {required DocumentSnapshot user}){

  Size display = MediaQuery.of(context).size;
  double width = display.width;
  double height = display.height;

  const mockupWidth = 390;
  const mockupHeight = 844;

  final scale = mockupWidth / width;

  final bool isTablat = width>500 && height>800?true:false;


  return Dialog(
    elevation: 0,
    // insetPadding: EdgeInsets.all(10),
    insetPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
    backgroundColor: Colors.transparent,
    alignment: Alignment.center,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ), //this right here
    child: StatefulBuilder(
        builder: (context, setState) {

          print("width ${MediaQuery.of(context).size.width}");
          print("height ${MediaQuery.of(context).size.height}");

          // return Theme(
          //   data: Theme.of(context).copyWith(
          //       colorScheme: ColorScheme.light(
          //         // primary: Colors.yellow,
          //         // onPrimary: Colors.black,
          //         // onSurface: Colors.teal,
          //         primary: Colors.red,
          //         onPrimary: Colors.white,
          //         onSurface: Colors.black,
          //       ),
          //       textButtonTheme: TextButtonThemeData(
          //           style: TextButton.styleFrom(
          //             // primary: Colors.teal
          //               primary: Colors.black
          //           )
          //       )
          //   ),
          //   child:
          // );

          return Container(
            // height: 506,
            // width: 364,
            // color: Colors.transparent,
            // color: Color(0xff1C1C1C).withOpacity(1),

            // width: 364,
            // height: 506,

            child: Stack(
              children: [

                Container(
                  // height: 506-20,
                  // width: 364-20,

                  // height: 506,
                  // width: 364,

                  // width: 343,
                  // height: 191,
                  /*width: (343*scale)/mockupWidth*width,
                  height: (191*scale)/mockupHeight*height,*/
                  width: isTablat?443:(343*scale)/mockupWidth*width,
                  height: isTablat?220:(191*scale)/mockupHeight*height,

                  // margin: EdgeInsets.all(20),
                  // margin: EdgeInsets.all(25),
                  margin: EdgeInsets.all(
                      MediaQuery.of(context).size.width*0.025
                  ),
                  // margin: EdgeInsets.symmetric(
                  //     horizontal: 10,
                  //     vertical: 12
                  // ),

                  decoration: BoxDecoration(
                    // color: Color(0xff1E7455),
                    // color: Color(0xffffffff),
                    color: colors.white,
                    // color: Colors.transparent,
                    // border: Border.all(width: 20, color:  Color(0xffffff)),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Container(
                    // height: 506-10,
                    // width: 364-10,
                    // margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      // color: Color(0xff1E7455),
                      // color: colors.green,
                      // color: Color(0xffffffff),
                      // border: Border.all(width: 15, color:  Color(0xffffffff)),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: ,
                        children: [

                          Container(
                            // width: 308,
                            width: MediaQuery.of(context).size.width,
                            // height: 231,
                            alignment: Alignment.center,
                            // padding: EdgeInsets.all(17),
                            // margin: EdgeInsets.symmetric(vertical: 37),
                            margin: EdgeInsets.only(top: 37),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              // gradient: LinearGradient(
                              //     begin: Alignment.centerLeft,
                              //     end: Alignment.centerRight,
                              //     colors: [
                              //       colors.green,
                              //       colors.lightGreen
                              //     ]
                              // ),
                            ),
                            child: Text(
                              "Are you sure you want to exit?",
                              style: TextStyle(
                                // color: Color(0xffffffff),
                                color: colors.green,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                // fontSize: 20,
                                /*fontSize: (width<=360?14:20*scale)/mockupWidth*width,*/
                                fontSize: isTablat?26:(width<=360?14:20*scale)/mockupWidth*width,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    // Navigator.of(context).pop();
                                    // Navigator.of(context).push(
                                    //   MaterialPageRoute(
                                    //       // builder: (context) => Screen2()
                                    //       builder: (context) => Screen2(user: user,)
                                    //   ),
                                    // );

                                    // await methods.playSound(file: "soundscrate-graphics-game-blip-2")
                                    //     .then((value) {
                                    //   Navigator.of(context).pop();
                                    // Navigator.push(context,

                                    /*(!user["sound"])? null :
                                    await Sounds.buttonClick;*/
                                    Navigator.of(context).pop();

                                    // user["login_mode"]=="Guest"?
                                    // Navigator.of(context).pushReplacement(
                                    // // Navigator.of(context).push(
                                    //   MaterialPageRoute(
                                    //       builder: (context) => Screen2(user: user,)
                                    //   ),
                                    // ):
                                    // Navigator.pushReplacement(context,
                                    //   NavigateWithOpaque(
                                    //     child: AuthScreen(),
                                    //     direction: AxisDirection.down,
                                    //   ),
                                    // );

                                    Navigator.of(context).pushReplacement(
                                      NavigateWithOpaque(
                                        // child: Screen3(user: user!, mAudio: mAudio,),
                                        // child: Screen3(user: user!, mAudio: mAudio, isClosed: true),
                                        child: Screen3(user: user,  isClosed: true),
                                        // duration: 200,
                                        direction: AxisDirection.left,
                                      ),
                                    );


                                    // });

                                  },
                                  child: Image.asset("assets/images/Group 28.png", scale: 5 * scale,),
                                ),
                                InkWell(
                                  onTap: () async {
                                    //Navigator.of(context).pop();
                                    // await methods.playSound(file: "soundscrate-graphics-game-blip-2")
                                    //     .then((value) {
                                    //   Navigator.of(context).pop();
                                    // });

                                    /*(!user["sound"])? null :
                                    await Sounds.buttonClick;*/
                                    Navigator.of(context).pop();

                                  },
                                  child: Image.asset("assets/images/Group 27.png", scale: 5 * scale,),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),

                // Positioned(
                //   // top: -30,
                //   // right: -30,
                //   top: 0,
                //   // right: 10,
                //   right: 0,
                //
                //   // top:MediaQuery.of(context).size.width,
                //
                //   child: GestureDetector(
                //     onTap: (){
                //       Navigator.of(context).pop();
                //     },
                //     child: Container(
                //       // height: 60,
                //       // width: 60,
                //       height: 50,
                //       width: 50,
                //       decoration: BoxDecoration(
                //         // color: Color(0xff1E7455),
                //         color: Color(0xffC3333C),
                //         // color: Color(0xffffffff),
                //         // border: Border.all(width: 5, color: Color(0xffffffff)),
                //         border: Border.all(width: 3, color: Color(0xffFFFDF9)),
                //         borderRadius: BorderRadius.circular(180),
                //         //drop shadow effect
                //         // boxShadow: [
                //         //   BoxShadow(
                //         //     color: Colors.black.withOpacity(0.25),
                //         //     spreadRadius: 4,
                //         //     blurRadius: 4,
                //         //     offset: const Offset(0,4),
                //         //   ),
                //         // ],
                //       ),
                //       child: Image.asset("assets/images/close.png", scale: 3,),
                //     ),
                //   ),
                // ),

              ],
            ),
          );
        }),
  );
}


Dialog dialogAppClose (BuildContext context){//, {DocumentSnapshot? user}

  Size display = MediaQuery.of(context).size;
  double width = display.width;
  double height = display.height;

  const mockupWidth = 390;
  const mockupHeight = 844;

  final scale = mockupWidth / width;

  final bool isTablat = width>500 && height>800?true:false;

  return Dialog(
    elevation: 0,
    // insetPadding: EdgeInsets.all(10),
    insetPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
    backgroundColor: Colors.transparent,
    alignment: Alignment.center,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ), //this right here
    child: StatefulBuilder(
        builder: (context, setState) {

          return Container(
            // height: 506,
            // width: 364,
            // color: Colors.transparent,
            // color: Color(0xff1C1C1C).withOpacity(1),

            // width: 364,
            // height: 506,

            child: Stack(
              children: [

                Container(
                  // height: 506-20,
                  // width: 364-20,

                  // height: 506,
                  // width: 364,

                  // width: 343,
                  // height: 191,
                  /*width: (343*scale)/mockupWidth*width,
                  height: (191*scale)/mockupHeight*height,*/
                  width: isTablat?443:(343*scale)/mockupWidth*width,
                  height: isTablat?220:(191*scale)/mockupHeight*height,

                  // margin: EdgeInsets.all(20),
                  // margin: EdgeInsets.all(25),
                  margin: EdgeInsets.all(
                      MediaQuery.of(context).size.width*0.025
                  ),
                  // margin: EdgeInsets.symmetric(
                  //     horizontal: 10,
                  //     vertical: 12
                  // ),

                  decoration: BoxDecoration(
                    // color: Color(0xff1E7455),
                    // color: Color(0xffffffff),
                    color: colors.white,
                    // color: Colors.transparent,
                    // border: Border.all(width: 20, color:  Color(0xffffff)),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Container(
                    // height: 506-10,
                    // width: 364-10,
                    // margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      // color: Color(0xff1E7455),
                      // color: colors.green,
                      // color: Color(0xffffffff),
                      // border: Border.all(width: 15, color:  Color(0xffffffff)),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: ,
                        children: [

                          Container(
                            // width: 308,
                            width: MediaQuery.of(context).size.width,
                            // height: 231,
                            alignment: Alignment.center,
                            // padding: EdgeInsets.all(17),
                            // margin: EdgeInsets.symmetric(vertical: 37),
                            margin: EdgeInsets.only(top: 37),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              // gradient: LinearGradient(
                              //     begin: Alignment.centerLeft,
                              //     end: Alignment.centerRight,
                              //     colors: [
                              //       colors.green,
                              //       colors.lightGreen
                              //     ]
                              // ),
                            ),
                            child: Text(
                              "Are you sure you want to exit the App?",
                              style: TextStyle(
                                // color: Color(0xffffffff),
                                color: colors.green,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                // fontSize: 20,
                                /*fontSize: (width<=360?14:16*scale)/mockupWidth*width,*/
                                fontSize: isTablat?24:(width<=360?14:16*scale)/mockupWidth*width,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () async {

                                    // if(user!=null){
                                    //   (!user["sound"])? null :
                                    //   await Sounds.buttonClick;
                                    // }

                                    // Navigator.of(context).pop();
                                    //
                                    // Navigator.of(context).pushReplacement(
                                    //   NavigateWithOpaque(
                                    //     child: Screen3(user: user!,),
                                    //     // duration: 200,
                                    //     direction: AxisDirection.left,
                                    //   ),
                                    // );

                                    exit(0);

                                  },
                                  child: Image.asset("assets/images/Group 28.png", scale: 5 * scale,),
                                ),
                                InkWell(
                                  onTap: () async {

                                    // (!user["sound"])? null :
                                    // await Sounds.buttonClick;

                                    // if(user!=null){
                                    //   (!user["sound"])? null :
                                    //   await Sounds.buttonClick;
                                    // }
                                    Navigator.of(context).pop();

                                  },
                                  child: Image.asset("assets/images/Group 27.png", scale: 5 * scale,),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          );
        }),
  );
}

Dialog dialogShowRankBoard (BuildContext context, DocumentSnapshot user) {

  Size display = MediaQuery.of(context).size;
  double width = display.width;
  double height = display.height;

  const mockupWidth = 390;
  const mockupHeight = 844;

  final scale = mockupWidth / width;

  // bool isEasy=true, isMedium=false, isHard=false, isImpossible=false;
  // bool isSound=true, isMusic=true, isAlarm=true;
  // bool isUser = false;

  // bool btnClicked = false;

  List users = [];
  // , List users

  final bool isTablat = width>500 && height>800?true:false;

  return Dialog(
    elevation: 0,
    // insetPadding: EdgeInsets.all(10),
    // insetPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
    insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    // insetPadding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
    backgroundColor: Colors.transparent,
    alignment: Alignment.center,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ), //this right here
    child: StatefulBuilder(
        builder: (context, setState) {

          print("width ${MediaQuery.of(context).size.width}");
          print("height ${MediaQuery.of(context).size.height}");

          return Container(
            child: Stack(
              children: [

                Container(
                  /*height: (506*scale)/mockupHeight*height,
                  width: (364*width)/mockupWidth*width,*/
                  width: isTablat?400:(375*scale)/mockupWidth*width,
                  height: isTablat?390:(251.38*scale)/mockupHeight*height,
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: colors.green,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          /*
                          Container(
                            decoration: BoxDecoration(
                              color: colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              ),
                            ),
                            // height: 58,
                            height: (58*scale)/mockupHeight*height,
                            child: Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () async {
                                      (!user["sound"])? null :
                                      await Sounds.buttonClick;

                                      Future.delayed(const Duration(milliseconds: 10),() async {
                                        users = await Login.getUsersWithFilter(user!.id);
                                        setState((){users;});
                                        setState((){isEasy=true; isMedium=false; isHard=false; isImpossible=false;});
                                      });

                                    },

                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(17),
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                        gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: isEasy?[
                                              colors.green,
                                              colors.lightGreen
                                            ]
                                                :[
                                              colors.green.withOpacity(0.3),
                                              colors.lightGreen.withOpacity(0.3),
                                            ]

                                        ),

                                      ),
                                      child: Text(
                                        "Easy",
                                        style: TextStyle(
                                          // color: Color(0xffffffff),
                                          color: isEasy?colors.white:colors.green,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                        ),

                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () async {
                                      // users = await Login.getUsersWithFilter(user!.id, mode: "Medium");
                                      // setState((){users;});
                                      // setState((){isEasy=false; isMedium=true; isHard=false; isImpossible=false;});

                                      // await methods.playSound(file: "click1")
                                      //     .then((value) {

                                      (!user["sound"])? null :
                                      await Sounds.buttonClick;
                                      // Future.delayed(const Duration(seconds: 1),() async {
                                      //   Future.delayed(const Duration(milliseconds: 200),() async {
                                      Future.delayed(const Duration(milliseconds: 10),() async {
                                        users = await Login.getUsersWithFilter(user!.id, mode: "Medium");
                                        setState((){users;});
                                        setState((){isEasy=false; isMedium=true; isHard=false; isImpossible=false;});
                                      });
                                      // });

                                    },
                                    child: Container(
                                      // width: 308,
                                      // width: MediaQuery.of(context).size.width,
                                      // width: MediaQuery.of(context).size.width/3,
                                      // width: 172-11,
                                      // width: (MediaQuery.of(context).size.width-105)/2,
                                      alignment: Alignment.center,
                                      // height: 231,
                                      // padding: EdgeInsets.all(17),
                                      padding: EdgeInsets.symmetric(vertical: 17),
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                          // bottomRight: Radius.circular(0),
                                        ),
                                        gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            // colors: [
                                            //   // colors.green,
                                            //   // colors.lightGreen
                                            //   colors.green.withOpacity(0.3),
                                            //   colors.lightGreen.withOpacity(0.3),
                                            //
                                            //   // colors.green.withOpacity(0.3),
                                            //   // colors.lightGreen.withOpacity(0.3),
                                            // ]

                                            colors: isMedium?[
                                              colors.green,
                                              colors.lightGreen
                                            ]
                                                :[
                                              colors.green.withOpacity(0.3),
                                              colors.lightGreen.withOpacity(0.3),
                                            ]

                                        ),
                                      ),
                                      child: Text(
                                        "Medium",
                                        style: TextStyle(
                                          // color: Color(0xffffffff),
                                          // color: colors.green,
                                          color: isMedium?colors.white:colors.green,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                        ),

                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () async {
                                      // users = await Login.getUsersWithFilter(user!.id, mode: "Hard");
                                      // setState((){users;});
                                      // setState((){isEasy=false; isMedium=false; isHard=true; isImpossible=false;});

                                      // await methods.playSound(file: "click1")
                                      //     .then((value) {

                                      (!user["sound"])? null :
                                      await Sounds.buttonClick;
                                      // Future.delayed(const Duration(seconds: 1),() async {
                                      //   Future.delayed(const Duration(milliseconds: 200),() async {
                                      Future.delayed(const Duration(milliseconds: 10),() async {
                                        users = await Login.getUsersWithFilter(user!.id, mode: "Hard");
                                        setState((){users;});
                                        setState((){isEasy=false; isMedium=false; isHard=true; isImpossible=false;});
                                      });
                                      // });

                                    },

                                    child: Container(
                                      // width: 308,
                                      // width: (MediaQuery.of(context).size.width-105)/2,
                                      // width: 172-11,
                                      // height: 231,
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(17),
                                      // padding: EdgeInsets.symmetric(vertical: 17),
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                        gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            // colors: [
                                            //   colors.green,
                                            //   colors.lightGreen
                                            // ]

                                            colors: isHard?[
                                              colors.green,
                                              colors.lightGreen
                                            ]
                                                :[
                                              colors.green.withOpacity(0.3),
                                              colors.lightGreen.withOpacity(0.3),
                                            ]

                                        ),

                                      ),
                                      child: Text(
                                        "Hard",
                                        style: TextStyle(
                                          // color: Color(0xffffffff),
                                          color: isHard?colors.white:colors.green,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                        ),

                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () async {
                                      // users = await Login.getUsersWithFilter(user!.id, mode: "Impossible");
                                      // setState((){users;});
                                      // setState((){isEasy=false; isMedium=false; isHard=false; isImpossible=true;});

                                      // await methods.playSound(file: "click1")
                                      //     .then((value) {
                                      // Future.delayed(const Duration(seconds: 1),() async {

                                      (!user["sound"])? null :
                                      await Sounds.buttonClick;
                                      // Future.delayed(const Duration(milliseconds: 200),() async {
                                      Future.delayed(const Duration(milliseconds: 10),() async {
                                        users = await Login.getUsersWithFilter(user!.id, mode: "Impossible");
                                        setState((){users;});
                                        setState((){isEasy=false; isMedium=false; isHard=false; isImpossible=true;});
                                      });
                                      // });

                                    },
                                    child: Container(
                                      // width: 308,
                                      // width: MediaQuery.of(context).size.width,
                                      // width: MediaQuery.of(context).size.width/3,
                                      // width: 172-11,
                                      // width: (MediaQuery.of(context).size.width-105)/2,
                                      alignment: Alignment.center,
                                      // height: 231,
                                      // padding: EdgeInsets.all(17),
                                      padding: EdgeInsets.symmetric(vertical: 17),
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                          // bottomRight: Radius.circular(0),
                                        ),
                                        gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            // colors: [
                                            //   // colors.green,
                                            //   // colors.lightGreen
                                            //   colors.green.withOpacity(0.3),
                                            //   colors.lightGreen.withOpacity(0.3),
                                            //
                                            //   // colors.green.withOpacity(0.3),
                                            //   // colors.lightGreen.withOpacity(0.3),
                                            // ]

                                            colors: isImpossible?[
                                              colors.green,
                                              colors.lightGreen
                                            ]
                                                :[
                                              colors.green.withOpacity(0.3),
                                              colors.lightGreen.withOpacity(0.3),
                                            ]

                                        ),
                                      ),
                                      child: Text(
                                        "Impossible",
                                        style: TextStyle(
                                          // color: Color(0xffffffff),
                                          // color: colors.green,
                                          color: isImpossible?colors.white:colors.green,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                        ),

                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          */

                         /*
                          SingleChildScrollView(
                            child: Container(
                              child: Column(
                                children:
                                users.map((e){
                                  return Container(
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Container(
                                            width: (344*scale)/mockupWidth*width,
                                            height: (((e["user"] as bool)?75:65)*scale)/mockupHeight*height,
                                            color: (e["user"] as bool)?colors.white:colors.green,
                                            padding: EdgeInsets.all(17),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  // flex: 2,
                                                  child: Container(
                                                    height: (50*scale)/mockupHeight*height,
                                                    width: (50*scale)/mockupWidth*width,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(180),
                                                    ),
                                                    child: CircleAvatar(
                                                      radius: 180,
                                                      backgroundImage: NetworkImage(
                                                        "${e["img"]}",
                                                        // fit: BoxFit.cover,
                                                      ),
                                                      backgroundColor: (e["user"] as bool)?colors.green:colors.white,
                                                    ),
                                                  ),
                                                ),
                                                // SizedBox(width: 14,),
                                                Expanded(
                                                  flex: 3,
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "${e["name"] ?? (e["email"] as String).split("@")[0]}",
                                                      style: TextStyle(
                                                        color: (e["user"] as bool)?colors.green:colors.white,
                                                        fontFamily: 'Roboto',
                                                        fontWeight: FontWeight.w700,
                                                        fontSize: (width<=360?14:((user["name"] as String).length>14?14:16)*scale)/mockupWidth*width,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child:
                                                  e["medal"]!=""?
                                                  Container(
                                                    alignment: Alignment.center,
                                                    child: Image.asset(
                                                        e["medal"]=="Gold"?"assets/images/medal-gold.png"
                                                            :e["medal"]=="Silver"?"assets/images/medal-silver.png"
                                                            :e["medal"]=="Bronze"?"assets/images/medal-bronze.png"
                                                            :""
                                                    ),
                                                  )
                                                      :
                                                  Container(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "${e["points"]["${isEasy?"easy":
                                                      isMedium?"medium":isHard?"hard":
                                                      isImpossible?"impossible":""}"]}",
                                                      style: TextStyle(
                                                        color: (e["user"] as bool)?colors.green:colors.white,
                                                        fontFamily: 'Roboto',
                                                        fontWeight: FontWeight.w700,
                                                        fontSize: (width<=360?16:20*scale)/mockupWidth*width,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          (e["user"] as bool)?Container():Container(
                                            height: 1,
                                            width: MediaQuery.of(context).size.width,
                                            margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/6),
                                            color: colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          */

                          SingleChildScrollView(
                            child: FutureBuilder(
                              // future: Login.getUsersRank(user!.id),
                                future: Login.getUsersRank(user.id),
                              builder: (context, AsyncSnapshot<List<Map<String,dynamic>>> snapShot){
                                if(snapShot.hasData){
                                  users = snapShot.data! as List<Map<String,dynamic>>;
                                  // setState((){users;});
                                  return Container(
                                    child: Column(
                                      children: users.map((e) {
                                        return Container(
                                          child: Container(
                                            child: Column(
                                              children: [
                                                Container(
                                                  /*width: (344*scale)/mockupWidth*width,*/
                                                  width: isTablat?365:(344*scale)/mockupWidth*width,
                                                  /*height: (((e["user"] as bool)?75:65)*scale)/mockupHeight*height,*/
                                                  height: isTablat?70:(((e["user"] as bool)?75:65)*scale)/mockupHeight*height,
                                                  color: (e["user"] as bool)?colors.white:colors.green,
                                                  padding: EdgeInsets.all(17),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Expanded(
                                                        // flex: 2,
                                                        child: Container(
                                                          /*height: (50*scale)/mockupHeight*height,
                                                          width: (50*scale)/mockupWidth*width,*/
                                                          height: isTablat?70:(50*scale)/mockupHeight*height,
                                                          width: isTablat?70:(50*scale)/mockupWidth*width,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(180),
                                                          ),
                                                          child: CircleAvatar(
                                                            radius: 180,
                                                            backgroundImage: NetworkImage(
                                                              "${e["img"]}",
                                                              // fit: BoxFit.cover,
                                                            ),
                                                            backgroundColor: (e["user"] as bool)?colors.green:colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                      // SizedBox(width: 14,),
                                                      Expanded(
                                                        flex: 3,
                                                        child: Container(
                                                          alignment: Alignment.center,
                                                          child: Text(
                                                            "${e["name"] ?? (e["email"] as String).split("@")[0]}",
                                                            style: TextStyle(
                                                              color: (e["user"] as bool)?colors.green:colors.white,
                                                              fontFamily: 'Roboto',
                                                              fontWeight: FontWeight.w700,
                                                              /*fontSize: (width<=360?12:((user["name"] as String).length>14?12:14)*scale)/mockupWidth*width,*/
                                                              fontSize: isTablat?17:(width<=360?12:((user["name"] as String).length>14?12:14)*scale)/mockupWidth*width,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child:
                                                        e["medal"]!=""?
                                                        Container(
                                                          alignment: Alignment.center,
                                                          child: Image.asset(
                                                              e["medal"]=="Gold"?"assets/images/medal-gold.png"
                                                                  :e["medal"]=="Silver"?"assets/images/medal-silver.png"
                                                                  :e["medal"]=="Bronze"?"assets/images/medal-bronze.png"
                                                                  :""
                                                          ),
                                                        )
                                                            :
                                                        Container(
                                                          alignment: Alignment.center,
                                                          child: Text(
                                                            // "${e["points"]["${isEasy?"easy":
                                                            // isMedium?"medium":isHard?"hard":
                                                            // isImpossible?"impossible":""}"]}",

                                                            "${e["history"]["total_points"]}",
                                                            // "${(e["history"]["total_points"] as int)>?e["history"]["total_points"]:"${e["history"]["total_points"]}"}",
                                                            style: TextStyle(
                                                              color: (e["user"] as bool)?colors.green:colors.white,
                                                              fontFamily: 'Roboto',
                                                              fontWeight: FontWeight.w700,
                                                              // fontSize: (width<=360?16:20*scale)/mockupWidth*width,
                                                              /*fontSize: (width<=360?12:14*scale)/mockupWidth*width,*/
                                                              fontSize: isTablat?16:(width<=360?12:14*scale)/mockupWidth*width,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                (e["user"] as bool)?Container():Container(
                                                  height: 1,
                                                  width: MediaQuery.of(context).size.width,
                                                  margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/6),
                                                  color: colors.white,
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  );
                                }

                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                );
                              }
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),

                //close
                Positioned(
                  top: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () async {
                      /*(!user["sound"])? null :
                      await Sounds.buttonClick;*/
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      /*height: (50*scale)/mockupHeight*height,
                      width: (50*scale)/mockupWidth*width,*/
                      height: isTablat?60:(50*scale)/mockupHeight*height,
                      width: isTablat?60:(50*scale)/mockupWidth*width,
                      decoration: BoxDecoration(
                        color: Color(0xffC3333C),
                        border: Border.all(width: 3, color: Color(0xffFFFDF9)),
                        borderRadius: BorderRadius.circular(180),
                      ),
                      child: Image.asset("assets/images/close.png", scale: 3 * scale,),
                    ),
                  ),
                ),

              ],
            ),
          );
        }),
  );
}

Dialog dialogUserBoard (BuildContext context, String mode, String level, DocumentSnapshot user, Map<String, dynamic> data, AdProvider adProvider, {bool isDailyChallange = false}){

  Size display = MediaQuery.of(context).size;
  double width = display.width;
  double height = display.height;

  const mockupWidth = 390;
  const mockupHeight = 844;

  final scale = mockupWidth / width;
  // final divide = mockupWidth * width;

  if(!adProvider.isRewardedLoaded){
    adProvider.initializeRewarded();
  }

  bool showProgress = false;

  final bool isTablat = width>500 && height>800?true:false;

  return Dialog(
    elevation: 0,
    // insetPadding: EdgeInsets.all(10),
    insetPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
    backgroundColor: Colors.transparent,
    alignment: Alignment.center,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ), //this right here
    child: StatefulBuilder(
        builder: (context, setState) {

          print("width ${MediaQuery.of(context).size.width}");
          print("height ${MediaQuery.of(context).size.height}");

          // return Theme(
          //   data: Theme.of(context).copyWith(
          //       colorScheme: ColorScheme.light(
          //         // primary: Colors.yellow,
          //         // onPrimary: Colors.black,
          //         // onSurface: Colors.teal,
          //         primary: Colors.red,
          //         onPrimary: Colors.white,
          //         onSurface: Colors.black,
          //       ),
          //       textButtonTheme: TextButtonThemeData(
          //           style: TextButton.styleFrom(
          //             // primary: Colors.teal
          //               primary: Colors.black
          //           )
          //       )
          //   ),
          //   child:
          // );

          //return Container(
            /*// height: 506,
            // width: 364,
            // color: Colors.transparent,
            // color: Color(0xff1C1C1C).withOpacity(1),

            // width: 364,
            // height: 506,*/



        //    child:
          return
          Stack(
            alignment: Alignment.center,
              children: [

                Container(
                  // height: 506-20,
                  // width: 364-20,

                  // height: 506,
                  // width: 364,

                  // width: 375,
                  // height: 231.38,
                  /*width: (375*scale)/mockupWidth*width,
                  // height: (231.38*scale)/mockupHeight*height,
                  height: (251.38*scale)/mockupHeight*height,*/
                  /*width: isTablat?400:(375*scale)/mockupWidth*width,
                  height: isTablat?325:(251.38*scale)/mockupHeight*height,*/
                  width: isTablat?430:(375*scale)/mockupWidth*width,
                  height: isTablat?360:(251.38*scale)/mockupHeight*height,

                  // margin: EdgeInsets.all(20),
                  // margin: EdgeInsets.all(25),
                  margin: EdgeInsets.all(
                      MediaQuery.of(context).size.width*0.025
                  ),
                  // margin: EdgeInsets.symmetric(
                  //     horizontal: 10,
                  //     vertical: 12
                  // ),

                  decoration: BoxDecoration(
                    // color: Color(0xff1E7455),
                    // color: Color(0xffffffff),
                    color: colors.white,
                    // color: Colors.transparent,
                    // border: Border.all(width: 20, color:  Color(0xffffff)),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Container(
                    // height: 506-10,
                    // width: 364-10,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      // color: Color(0xff1E7455),
                      color: colors.green,
                      // color: Color(0xffffffff),
                      // border: Border.all(width: 15, color:  Color(0xffffffff)),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Stack(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              // Container(
                              //   // width: 308,
                              //   width: MediaQuery.of(context).size.width,
                              //   // height: 231,
                              //   alignment: Alignment.center,
                              //   // padding: EdgeInsets.all(17),
                              //   // margin: EdgeInsets.symmetric(vertical: 37),
                              //   margin: EdgeInsets.only(top: 37),
                              //   decoration: BoxDecoration(
                              //     borderRadius: const BorderRadius.only(
                              //       topLeft: Radius.circular(20),
                              //       topRight: Radius.circular(20),
                              //     ),
                              //     // gradient: LinearGradient(
                              //     //     begin: Alignment.centerLeft,
                              //     //     end: Alignment.centerRight,
                              //     //     colors: [
                              //     //       colors.green,
                              //     //       colors.lightGreen
                              //     //     ]
                              //     // ),
                              //   ),
                              //   child: Text(
                              //     "Are you sure you want to exit?",
                              //     style: TextStyle(
                              //       // color: Color(0xffffffff),
                              //       // color: colors.green,
                              //       color: colors.white,
                              //       fontFamily: 'Roboto',
                              //       fontWeight: FontWeight.w700,
                              //       fontSize: 20,
                              //     ),
                              //     textAlign: TextAlign.justify,
                              //   ),
                              // ),

                              Container(
                                // width: 308,
                                width: (308*scale)/mockupWidth*width,
                                // height: 60,
                                margin: EdgeInsets.all(17),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // height: 60,
                                      // width: 60,
                                      // height: 50,
                                      // width: 50,

                                      // height: 25,
                                      // width: 25,

                                      // height: 43,
                                      // width: 43,
                                      /*height: (43*scale)/mockupHeight*height,
                                      width: (43*scale)/mockupWidth*width,*/
                                      height: (isTablat?50:43*scale)/mockupHeight*height,
                                      width: (isTablat?50:43*scale)/mockupWidth*width,
                                      decoration: BoxDecoration(
                                        // color: Color(0xff1E7455),
                                        // color: Color(0xffC3333C),
                                        // color: Color(0xffffffff),
                                        // color: colors.white,
                                        // border: Border.all(width: 5, color: Color(0xffffffff)),
                                        // border: Border.all(width: 1, color: Color(0xffFFFDF9)),
                                        borderRadius: BorderRadius.circular(180),
                                        //drop shadow effect
                                        // boxShadow: [
                                        //   BoxShadow(
                                        //     color: Colors.black.withOpacity(0.25),
                                        //     spreadRadius: 4,
                                        //     blurRadius: 4,
                                        //     offset: const Offset(0,4),
                                        //   ),
                                        // ],
                                      ),
                                      // child: Image.asset("assets/images/close.png", scale: 3,),
                                      child: CircleAvatar(
                                        radius: 180,
                                        backgroundImage: user["pic"]==null? null:
                                        NetworkImage(
                                          //"https://s3-alpha-sig.figma.com/img/3db4/1314/ecfc86a48fc2d1edf4b52bef6fba5259?Expires=1652054400&Signature=NQy0tJ84IJHrwQBvR2A6eg6ZYiUNEubUpUHOOl~Anoag81gPnNUhJlWVnXAWEBK5If5-XEqMJuYcp2aNhOTsOLkDxXhRvYlL3VY~RsbKsw2LOJGebgkoG3wfl8TBb0huTeQDpQxbgZ6o2iNlkt2~PvHAPSQ1nLRIVyeXJasZMIY9SobtkK45-JJ16S4Ov7KvUYamN2eLvloBIMqlPo5sLkBeKhNz8vwlnZJWFuwSRPl4ykaaJY1ZhhPELeb4wdhIJDzNOCkveJXBx7VDP77hyr3GSKXyUuqRe79a4-3tR-aytElpuJvo1H5~pbzd0v16kC8tgZDIGtvR9VUkkP2XbQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
                                          user["pic"] ?? "",
                                          // fit: BoxFit.cover,
                                        ),
                                        backgroundColor: colors.white,
                                      ),
                                    ),
                                    // SizedBox(width: 14,),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Text(//"Dreamy Pooh",
                                          user["name"]??"Na",

                                          textAlign: TextAlign.justify,

                                          style: TextStyle(
                                            color: Color(0xffffffff),
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w700,
                                            // fontSize: 20,
                                            // fontSize: 16,
                                            // fontSize: (((user["name"]??"") as String)).length>15?16:20,
                                            // fontSize: (width<=360?12:(((user["name"]??"") as String)).length>15?16:20*scale)/mockupWidth*width,
                                            /*fontSize: (width<=384?12:(((user["name"]??"") as String)).length>15?16:20*scale)/mockupWidth*width,*/
                                            fontSize: isTablat?20:(width<=384?12:(((user["name"]??"") as String)).length>15?16:20*scale)/mockupWidth*width,
                                          ),

                                        ),
                                      ),
                                    ),

                                    SizedBox(width: 8,),

                                    Container(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Time",
                                            style: GoogleFonts.roboto(
                                              // color: Color(0xff459F67),
                                              color: colors.white,
                                              // fontSize: 20.0,
                                              // fontSize: (width<=360?16:20.0*scale)/mockupWidth*width,
                                              /*fontSize: (width<=384?16:20.0*scale)/mockupWidth*width,*/
                                              fontSize: isTablat?20:(width<=384?16:20.0*scale)/mockupWidth*width,
                                              // letterSpacing: -1.5,
                                              fontWeight: FontWeight.w700,
                                              // height: 23.44,
                                            ),
                                          ),
                                          Text(
                                            //"13:47",
                                            data["total-time"]??"Na",
                                            style: GoogleFonts.roboto(
                                              // color: Color(0xff74C171),
                                              color: colors.white,
                                              /*fontSize: 12.0,*/
                                              fontSize: isTablat?15:12.0,
                                              // letterSpacing: -1.5,
                                              fontWeight: FontWeight.w500,
                                              // height: 23.44,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),


                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 15),
                                // margin: EdgeInsets.only(horizontal: 15),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          // height: 42.68,
                                          // height: 50,
                                          margin: EdgeInsets.all(5),
                                          alignment: Alignment.center,
                                          child: Text(
                                            // "Correct Words     :            ${20}",
                                            // "Correct Words     :            ${data["correct-word"]}",
                                            "Correct Character      :            ${data["correct-word"]??"Na"}",
                                            style: GoogleFonts.roboto(
                                              // color: Color(0xff74C171),
                                              color: colors.white,
                                              /*fontSize: 10.0,*/
                                              fontSize: isTablat?16:10.0,
                                              // letterSpacing: -1.5,
                                              fontWeight: FontWeight.w500,
                                              // height: 23.44,
                                            ),
                                          ),
                                        ),


                                      ],
                                    ),
                                    // Row(
                                    //   children: [
                                    //     Container(
                                    //       // height: 42.68,
                                    //       // height: 50,
                                    //       margin: EdgeInsets.all(5),
                                    //       alignment: Alignment.center,
                                    //       child: Text(
                                    //         // "Time Taken          :            ${"7:27"}",
                                    //         "Time Taken          :            ${data["time-taken"]}",
                                    //         style: GoogleFonts.roboto(
                                    //           // color: Color(0xff74C171),
                                    //           color: colors.white,
                                    //           fontSize: 10.0,
                                    //           // letterSpacing: -1.5,
                                    //           fontWeight: FontWeight.w500,
                                    //           // height: 23.44,
                                    //         ),
                                    //       ),
                                    //     ),
                                    //
                                    //
                                    //   ],
                                    // ),
                                    Row(
                                      children: [
                                        Container(
                                          // height: 42.68,
                                          // height: 50,
                                          margin: EdgeInsets.all(5),
                                          alignment: Alignment.center,
                                          child: RichText(
                                            text: TextSpan(
                                              // "Hint Used          :  ${"5 (+6:20)"}",
                                              // "Hint Used          :  ${5}",
                                              // style: GoogleFonts.roboto(
                                              //   // color: Color(0xff74C171),
                                              //   color: colors.white,
                                              //   fontSize: 10.0,
                                              //   // letterSpacing: -1.5,
                                              //   fontWeight: FontWeight.w500,
                                              //   // height: 23.44,
                                              // ),
                                              children: [
                                                TextSpan(
                                                  //text: "Hint Used              :            ${5}",
                                                  // text: "Hint Used              :            ${data["hint-used"]}",
                                                  text: "Hint Used                    :            ${data["hint-used"]??"Na"}",

                                                  style: GoogleFonts.roboto(
                                                    // color: Color(0xff74C171),
                                                    color: colors.white,
                                                    /*fontSize: 10.0,*/
                                                    fontSize: isTablat?16:10.0,
                                                    // letterSpacing: -1.5,
                                                    fontWeight: FontWeight.w500,
                                                    // height: 23.44,
                                                  ),
                                                ),
                                                TextSpan(text: " (",
                                                  style: GoogleFonts.roboto(
                                                    // color: Color(0xff74C171),
                                                    color: colors.white,
                                                    /*fontSize: 10.0,*/
                                                    fontSize: isTablat?16:10.0,
                                                    // letterSpacing: -1.5,
                                                    fontWeight: FontWeight.w500,
                                                    // height: 23.44,
                                                  ),
                                                ),
                                                TextSpan(
                                                  //text: "+6:20",
                                                  // text: '+${user["hint-credit"]}',
                                                  // text: '+${user["hint-time"]??'00:00'}',
                                                  // text: '+${user["history.hint_time"]??'00:00'}',
                                                  text: '+${data["hint-time"]??'00:00'}',
                                                  style: GoogleFonts.roboto(
                                                    // color: Color(0xff74C171),
                                                    color: colors.orange,
                                                    /*fontSize: 10.0,*/
                                                    fontSize: isTablat?16:10.0,
                                                    // letterSpacing: -1.5,
                                                    fontWeight: FontWeight.w500,
                                                    // height: 23.44,
                                                  ),
                                                ),
                                                TextSpan(text: ")",
                                                  style: GoogleFonts.roboto(
                                                    // color: Color(0xff74C171),
                                                    color: colors.white,
                                                    /*fontSize: 10.0,*/
                                                    fontSize: isTablat?16:10.0,
                                                    // letterSpacing: -1.5,
                                                    fontWeight: FontWeight.w500,
                                                    // height: 23.44,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),


                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          // height: 42.68,
                                          // height: 50,
                                          margin: EdgeInsets.all(5),
                                          alignment: Alignment.center,
                                          child: Text(
                                            //"Total Time             :            ${"13:47"}",
                                            // "Total Time             :            ${data["total-time"]}",
                                            "Total Time                   :            ${data["total-time"]??"Na"}",
                                            style: GoogleFonts.roboto(
                                              // color: Color(0xff74C171),
                                              color: colors.white,
                                              /*fontSize: 10.0,*/
                                              fontSize: isTablat?16:10.0,
                                              // letterSpacing: -1.5,
                                              fontWeight: FontWeight.w500,
                                              // height: 23.44,
                                            ),
                                          ),
                                        ),


                                      ],
                                    ),

                                    InkWell(
                                      onTap: (){
                                        print('show rank...');
                                        showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (context) => dialogShowRankBoard(context, user)
                                        );
                                      },
                                      child: Container(
                                        margin: EdgeInsets.all(5),
                                        padding: EdgeInsets.all(5),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: colors.white,
                                        ),
                                        child: Text(
                                          "Show Rank...",
                                          style: GoogleFonts.roboto(
                                            // color: colors.white,
                                            color: colors.red,
                                            // fontSize: 10.0,
                                            /*fontSize: 14.0,*/
                                            fontSize: isTablat?20:14.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),



                              Container(
                                // height: 60,
                                // margin: EdgeInsets.all(10),
                                margin: EdgeInsets.only(left: 20, bottom: 10),
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    Container(
                                      // height: 42.68,
                                      // height: 50,
                                      margin: EdgeInsets.only(bottom: 5),
                                      alignment: Alignment.center,
                                      child: Text(
                                        // "Points Earned  :  ${15}",
                                        "Points Earned  :  ${data["point"]??"Na"}",
                                        style: GoogleFonts.roboto(
                                          // color: Color(0xff74C171),
                                          color: colors.white,
                                          // fontSize: 17.0,
                                          // fontSize: (width<=360?15:17.0*scale)/mockupWidth*width,
                                          /*fontSize: (width<=384?15:17.0*scale)/mockupWidth*width,*/
                                          fontSize: isTablat?18:(width<=384?15:17.0*scale)/mockupWidth*width,
                                          // letterSpacing: -1.5,
                                          fontWeight: FontWeight.w600,
                                          // height: 23.44,
                                        ),
                                      ),
                                    ),

                                    Expanded(
                                      flex: 3,
                                      child: Container(),
                                    ),


                                    SingleChildScrollView(
                                      child: Container(
                                        // margin: EdgeInsets.all(5),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [

                                            //next
                                            isDailyChallange? Container():
                                            InkWell(
                                              onTap: (){
                                                // Navigator.of(context).pop();
                                                //
                                                // Navigator.of(context).pushReplacement(
                                                //   MaterialPageRoute(
                                                //     // builder: (context) => Screen4(level: "Easy")
                                                //     //   builder: (context) =>  Screen4(mode: "Easy", level: '${1+1}', user: user,)
                                                //     //   builder: (context) =>  Screen4(mode: mode, level: '${(user["level"]["${mode}"])+1}', user: user,)
                                                //       builder: (context) =>  Screen4(mode: mode, level: '${int.tryParse(level)!+1}', user: user,)
                                                //   ),
                                                // );

                                                setState(() {
                                                  showProgress = true;
                                                });

                                                /*setState(() {
                                                  showProgress = false;
                                                });
                                                Navigator.of(context).pop(1);*/

                                                /*(!user["sound"])? null :
                                                Sounds.buttonClick;*/

                                                if(adProvider.isRewardedLoaded){
                                                  adProvider.rewardedAd.show(
                                                      onUserEarnedReward: (view, reward) async {
                                                        print('reward.amount ${reward.amount}');
                                                        //10

                                                        print('reward.update ${user['id']} ${reward.amount as int} ${mode.toLowerCase()}');
                                                        // Login.updateReward(user['id'], reward.amount as int, mode.toLowerCase());
                                                        Sounds.rewardsCollect;
                                                        Login.updateReward(user['id'], 35, mode.toLowerCase());
                                                        Login.updateTotalPoints(user['id'], reward.amount as int);

                                                        // await methods.playSound(file: "Power-Points-Sound-Effect").then((value) {
                                                        //
                                                        //   Future.delayed(const Duration(seconds: 1),(){
                                                        //     Navigator.of(context).pop();
                                                        //
                                                        //     Navigator.of(context).pushReplacement(
                                                        //       MaterialPageRoute(
                                                        //           builder: (context) =>  Screen4(mode: mode, level: '${int.tryParse(level)!+1}', user: user,)
                                                        //       ),
                                                        //     );
                                                        //   });
                                                        //
                                                        // });

                                                        // Navigator.of(context).pop(true);

                                                        setState(() {
                                                          showProgress = false;
                                                        });
                                                        Navigator.of(context).pop(1);

                                                      },
                                                  );
                                                }
                                                else{
                                                  setState(() {
                                                    showProgress = false;
                                                  });
                                                  Navigator.of(context).pop(1);
                                                }

                                              },
                                              child: Image.asset("assets/images/Group 59.png", scale: 5 * scale,),
                                            ),
                                            //home
                                            InkWell(
                                              onTap: (){

                                                /*(!user["sound"])? null :
                                                Sounds.buttonClick;*/
                                                // Navigator.of(context).pop();
                                                // Navigator.of(context).pop(false);
                                                Navigator.of(context).pop(0);
                                                // return false;
                                                // Navigator.of(context).push(
                                                //   MaterialPageRoute(
                                                //       builder: (context) => Screen2()
                                                //   ),
                                                // );
                                              },
                                              child: Image.asset("assets/images/Group 58.png", scale: 5 * scale,),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),

                            ],
                          ),

                          //animation
                          /*Positioned(
                            // top: 50,
                            // left: 60,
                            top: (50*scale)/mockupHeight*height,
                            left: (60*scale)/mockupWidth*width,
                              child: Container(
                                // width: 100,
                                // height: 200,
                                width: (100*scale)/mockupWidth*width,
                                height: (200*scale)/mockupHeight*height,
                                child: Lottie.asset(
                                  // 'assets/animations/90547-trophy-animation.json',
                                  'assets/animations/9733-coin.json',
                                  // 'assets/animations/9568-coin-collect.json',
                                  // width: 200,
                                  // height: 200,
                                  // width: MediaQuery.of(context).size.width/2,
                                  // height: MediaQuery.of(context).size.width/2,
                                  fit: BoxFit.cover,
                                  // repeat: gameWinRepeat,
                                  // reverse: false,

                                  reverse: true,
                                  repeat: false,

                                  // animate: gameWinAnimate,
                                ),
                              ),
                          ),*/
                        ],
                      ),
                    ),
                  ),
                ),

                // Positioned(
                //   // top: -30,
                //   // right: -30,
                //   top: 0,
                //   // right: 10,
                //   right: 0,
                //
                //   // top:MediaQuery.of(context).size.width,
                //
                //   child: GestureDetector(
                //     onTap: (){
                //       Navigator.of(context).pop();
                //     },
                //     child: Container(
                //       // height: 60,
                //       // width: 60,
                //       height: 50,
                //       width: 50,
                //       decoration: BoxDecoration(
                //         // color: Color(0xff1E7455),
                //         color: Color(0xffC3333C),
                //         // color: Color(0xffffffff),
                //         // border: Border.all(width: 5, color: Color(0xffffffff)),
                //         border: Border.all(width: 3, color: Color(0xffFFFDF9)),
                //         borderRadius: BorderRadius.circular(180),
                //         //drop shadow effect
                //         // boxShadow: [
                //         //   BoxShadow(
                //         //     color: Colors.black.withOpacity(0.25),
                //         //     spreadRadius: 4,
                //         //     blurRadius: 4,
                //         //     offset: const Offset(0,4),
                //         //   ),
                //         // ],
                //       ),
                //       child: Image.asset("assets/images/close.png", scale: 3,),
                //     ),
                //   ),
                // ),

                //progress
                // Positioned(
                //   //child: Center(
                //   // child: Container(
                //     //alignment: Alignment.center,
                //     // child: showProgress?Container(
                //   child: showProgress?Center(
                //         child: const CircularProgressIndicator(
                //           color: Colors.white,
                //         )
                //     ): Container(),
                //   //),
                // ),

                showProgress?Center(
                    child: const CircularProgressIndicator(
                      color: Colors.white,
                    )
                ): Container(),


              ],
            );
        //    ,


          //);
        }),
  );
}

class Dialogs {

  static dialogAlert (BuildContext context, String message, String title){

    //{required DocumentSnapshot user}

    Size display = MediaQuery.of(context).size;
    double width = display.width;
    double height = display.height;

    const mockupWidth = 390;
    const mockupHeight = 844;

    final scale = mockupWidth / width;

    final bool isTablat = width>500 && height>800?true:false;

    showDialog(
        context: context,
        // barrierDismissible: false,
        // builder: (context) => dialogClose()
        builder: (context)
        //=> dialogClose(user: widget.user)
          {
            return Dialog(
              elevation: 0,
              // insetPadding: EdgeInsets.all(10),
              insetPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              backgroundColor: Colors.transparent,
              alignment: Alignment.center,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ), //this right here
              child: StatefulBuilder(
                  builder: (context, setState) {

                    print("width ${MediaQuery.of(context).size.width}");
                    print("height ${MediaQuery.of(context).size.height}");

                    return Container(

                      child: Stack(
                        children: [

                          Container(
                            // width: 343,
                            // height: 191,
                            /*width: (343*scale)/mockupWidth*width,
                            height: (191*scale)/mockupHeight*height,*/
                            width: isTablat?443:(343*scale)/mockupWidth*width,
                            height: isTablat?251:(191*scale)/mockupHeight*height,
                            margin: EdgeInsets.all(
                                MediaQuery.of(context).size.width*0.025
                            ),
                            decoration: BoxDecoration(
                              color: colors.white,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  // crossAxisAlignment: ,
                                  children: [

                                    Container(
                                      // width: 308,
                                      width: MediaQuery.of(context).size.width,
                                      // height: 231,
                                      alignment: Alignment.center,
                                      // padding: EdgeInsets.all(17),
                                      // margin: EdgeInsets.symmetric(vertical: 37),
                                      margin: const EdgeInsets.only(top: 37),
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                      ),
                                      child: Text(
                                        //"Are you sure you want to exit?",
                                        title,
                                        style: TextStyle(
                                          // color: Color(0xffffffff),
                                          color: colors.green,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w700,
                                          // fontSize: 20,
                                          /*fontSize: 16,*/
                                          fontSize: isTablat?24:16,
                                        ),
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),


                                    Container(
                                      // width: 308,
                                      width: MediaQuery.of(context).size.width,
                                      // height: 231,
                                      alignment: Alignment.center,
                                      // padding: EdgeInsets.all(17),
                                      // margin: EdgeInsets.symmetric(vertical: 37),
                                      margin: const EdgeInsets.only(top: 37, left: 10),
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                      ),
                                      child: Text(
                                        //"Are you sure you want to exit?",
                                        message,
                                        style: TextStyle(
                                          // color: Color(0xffffffff),
                                          color: colors.green,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w700,
                                          // fontSize: 20,
                                          /*fontSize: 14,*/
                                          fontSize: isTablat?22:14,
                                        ),
                                        // textAlign: TextAlign.justify,
                                      ),
                                    ),

                                          InkWell(
                                            onTap: () async {
                                              //Navigator.of(context).pop();
                                              // await methods.playSound(file: "soundscrate-graphics-game-blip-2")
                                              //     .then((value) {
                                              //   Navigator.of(context).pop();
                                              // });

                                              // (!user["sound"])? null :
                                              // await Sounds.buttonClick;
                                              Navigator.of(context).pop();

                                            },
                                            child: Image.asset("assets/images/Group 27.png",
                                              // scale: 5,
                                              scale: 6 * scale,
                                            ),
                                          ),


                                    // Container(
                                    //   margin: EdgeInsets.all(10),
                                    //   alignment: Alignment.center,
                                    //   child: Row(
                                    //     mainAxisAlignment: MainAxisAlignment.center,
                                    //     children: [
                                    //       InkWell(
                                    //         onTap: () async {
                                    //           // Navigator.of(context).pop();
                                    //           // Navigator.of(context).push(
                                    //           //   MaterialPageRoute(
                                    //           //       // builder: (context) => Screen2()
                                    //           //       builder: (context) => Screen2(user: user,)
                                    //           //   ),
                                    //           // );
                                    //
                                    //           await methods.playSound(file: "soundscrate-graphics-game-blip-2")
                                    //               .then((value) {
                                    //             Navigator.of(context).pop();
                                    //             // Navigator.push(context,
                                    //             Navigator.pushReplacement(context,
                                    //               NavigateWithOpaque(
                                    //                 child: AuthScreen(),
                                    //                 direction: AxisDirection.down,
                                    //               ),
                                    //             );
                                    //           });
                                    //
                                    //         },
                                    //         child: Image.asset("assets/images/Group 28.png", scale: 5,),
                                    //       ),
                                    //       InkWell(
                                    //         onTap: () async {
                                    //           //Navigator.of(context).pop();
                                    //           await methods.playSound(file: "soundscrate-graphics-game-blip-2")
                                    //               .then((value) {
                                    //             Navigator.of(context).pop();
                                    //           });
                                    //         },
                                    //         child: Image.asset("assets/images/Group 27.png", scale: 5,),
                                    //       ),
                                    //     ],
                                    //   ),
                                    // ),

                                    SizedBox(height: 10,),

                                  ],
                                ),
                              ),
                            ),
                          ),

                          // Positioned(
                          //   // top: -30,
                          //   // right: -30,
                          //   top: 0,
                          //   // right: 10,
                          //   right: 0,
                          //
                          //   // top:MediaQuery.of(context).size.width,
                          //
                          //   child: GestureDetector(
                          //     onTap: (){
                          //       Navigator.of(context).pop();
                          //     },
                          //     child: Container(
                          //       // height: 60,
                          //       // width: 60,
                          //       height: 50,
                          //       width: 50,
                          //       decoration: BoxDecoration(
                          //         // color: Color(0xff1E7455),
                          //         color: Color(0xffC3333C),
                          //         // color: Color(0xffffffff),
                          //         // border: Border.all(width: 5, color: Color(0xffffffff)),
                          //         border: Border.all(width: 3, color: Color(0xffFFFDF9)),
                          //         borderRadius: BorderRadius.circular(180),
                          //         //drop shadow effect
                          //         // boxShadow: [
                          //         //   BoxShadow(
                          //         //     color: Colors.black.withOpacity(0.25),
                          //         //     spreadRadius: 4,
                          //         //     blurRadius: 4,
                          //         //     offset: const Offset(0,4),
                          //         //   ),
                          //         // ],
                          //       ),
                          //       child: Image.asset("assets/images/close.png", scale: 3,),
                          //     ),
                          //   ),
                          // ),

                        ],
                      ),
                    );
                  }),
            );
        }
    );

  }

}


//********************************
/*
class _ControlsOverlay extends StatelessWidget {
  const _ControlsOverlay({Key? key, required this.controller})
      : super(key: key);

  static const List<Duration> _exampleCaptionOffsets = <Duration>[
    Duration(seconds: -10),
    Duration(seconds: -3),
    Duration(seconds: -1, milliseconds: -500),
    Duration(milliseconds: -250),
    Duration(milliseconds: 0),
    Duration(milliseconds: 250),
    Duration(seconds: 1, milliseconds: 500),
    Duration(seconds: 3),
    Duration(seconds: 10),
  ];
  static const List<double> _examplePlaybackRates = <double>[
    0.25,
    0.5,
    1.0,
    1.5,
    2.0,
    3.0,
    5.0,
    10.0,
  ];

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          reverseDuration: const Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? const SizedBox.shrink()
              : Container(
            color: Colors.black26,
            child: const Center(
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 100.0,
                semanticLabel: 'Play',
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
        Align(
          alignment: Alignment.topLeft,
          child: PopupMenuButton<Duration>(
            initialValue: controller.value.captionOffset,
            tooltip: 'Caption Offset',
            onSelected: (Duration delay) {
              controller.setCaptionOffset(delay);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<Duration>>[
                for (final Duration offsetDuration in _exampleCaptionOffsets)
                  PopupMenuItem<Duration>(
                    value: offsetDuration,
                    child: Text('${offsetDuration.inMilliseconds}ms'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // Using less vertical padding as the text is also longer
                // horizontally, so it feels like it would need more spacing
                // horizontally (matching the aspect ratio of the video).
                vertical: 12,
                horizontal: 16,
              ),
              child: Text('${controller.value.captionOffset.inMilliseconds}ms'),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: PopupMenuButton<double>(
            initialValue: controller.value.playbackSpeed,
            tooltip: 'Playback speed',
            onSelected: (double speed) {
              controller.setPlaybackSpeed(speed);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<double>>[
                for (final double speed in _examplePlaybackRates)
                  PopupMenuItem<double>(
                    value: speed,
                    child: Text('${speed}x'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // Using less vertical padding as the text is also longer
                // horizontally, so it feels like it would need more spacing
                // horizontally (matching the aspect ratio of the video).
                vertical: 12,
                horizontal: 16,
              ),
              child: Text('${controller.value.playbackSpeed}x'),
            ),
          ),
        ),
      ],
    );
  }
}
*/

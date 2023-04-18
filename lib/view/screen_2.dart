import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import 'package:f2f_puzzlegame/view/screen_3.dart';
// import 'package:f2f_puzzlegame/view/screen_4.dart';

import '../view/screen_3.dart';
import '../view/screen_4.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:pixel_perfect/pixel_perfect.dart';
import 'package:provider/provider.dart';

import '../model/constants.dart';
import '../model/page_route.dart';
import 'background_theme.dart';
import 'dialogs.dart';
// import 'package:flutter/material.dart';

// class Screen2 extends StatefulWidget {
//   const Screen2({Key? key,
//     required this.user
//   }) : super(key: key);
//
//   final DocumentSnapshot? user;
//
//   @override
//   State<Screen2> createState() => _Screen2State();
// }
// class _Screen2State extends State<Screen2> {
//
//   late AdProvider adProvider;
//
//   MAudio mAudio = MAudio();
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//     // adMob.createAds();
//     // AdProvider adProvider = Provider.of<AdProvider>(context, listen: false);
//     // adProvider = Provider.of<AdProvider>(context, listen: false);
//     // adProvider.initializeBanner();
//
//     adProvider = AdProvider();
//     adProvider.initializeBanner();
//     adProvider.initializeInterstitial();
//     adProvider.initializeRewarded();
//     Future.delayed(const Duration(seconds: 3),(){
//       setState(() {
//         adProvider;
//       });
//     });
//
//     if(widget.user==null){
//       getUser("rNBYvJMWkehwTVxEpFu1");
//     } else {
//       setState(() {
//         user = widget.user;
//       });
//       print('User ${user!["name"]}');
//     }
//
//     mAudio.initialize('sounds/SoundsCrate-Chiptune_Freefall.mp3')
//         .then(
//             //(value) => mAudio.playLoopMusic()
//         (value) {
//           if(mAudio!=null && user!=null){
//             // if(!isMusic){
//             if(!user!["music"]){
//               mAudio.pauseMusic();
//             }else{
//               mAudio.playLoopMusic();
//             }
//           }
//         }
//     );
//
//     if(user!=null){
//       //Login.getUserStream(user!['id']);
//       Database.pathData("users").doc(user!['id']).snapshots().listen((event) {
//         setState(() {
//           user = event;
//         });
//       });
//     }
//
//   }
//
//   // @override
//   // void dispose() {
//   //   // TODO: implement dispose
//   //   super.dispose();
//   //
//   //   mAudio.dispose();
//   //
//   // }
//
//   DocumentSnapshot? user;
//
//   getUser(String id) async {
//     DocumentSnapshot ds = await Database
//         .pathData("users").doc(id).get();
//     // QuerySnapshot qs = await Database
//     //     .pathData("users").where("id", isEqualTo: id).get();
//     setState(() {
//
//       // DocumentSnapshot ds = qs.docs.first;
//
//       // if(ds!=null) {
//         user = ds;
//       // }
//     });
//   }
//
//
//   // AdMob adMob = AdMob();
//
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     // adMob.disposeAds();
//
//     adProvider.dispose();
//     mAudio.dispose();
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     Size display = MediaQuery.of(context).size;
//
//     // if(user!=null){
//     //   print('User ${user!["name"]}');
//     // }
//
//     // return MultiProvider(
//     //   providers: [
//     //     ChangeNotifierProvider <AdProvider> (
//     //       create: (context) => AdProvider(),
//     //     ),
//     //   ],
//     //   child: ,
//     // );
//
//     return Scaffold(
//       body: Container(
//         width: display.width,
//         height: display.height,
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: ExactAssetImage(
//               "assets/images/background.png",
//             ),
//             // fit: BoxFit.fill,
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Stack(
//           children: [
//
//
//
//             /*
//             //clouds
//             Clouds(display: display),
//
//             //tree
//             Tree(display: display),
//
//             //branch
//             Branch(display),
//
//             //left root
//             LeftRoot(),
//
//             //grass
//             Grass(display: display),
//
//             //right root
//             RightRoot(),
//             */
//
//             backGround(display),
//
//
//             // //text
//             // Positioned(
//             //   top: 59,
//             //   // top: 57,
//             //   left: 9,
//             //   child: Container(
//             //     // height: 209.34,
//             //     // width: 372,
//             //     width: display.width*0.95,
//             //     alignment: Alignment.bottomCenter,
//             //     child: Image.asset(
//             //       "assets/images/Spooky_Text_Effect 2.png",
//             //       fit: BoxFit.fill,
//             //     ),
//             //   ),
//             // ),
//
//
//
//             // Positioned(
//             //     bottom: 60,
//             //     child:
//             // ),
//
// /*
//             adProvider.isBannerLoaded?
//             Container(
//               height: adProvider.bannerAd.size.height.toDouble(),
//               child: AdWidget(
//                 ad: adProvider.bannerAd,
//               ),
//             ):Container(height: 0,),
// */
//
//             // adProvider.isInterstitialLoaded?
//             // Container(
//             //   height: adProvider.interstitialAd..height.toDouble(),
//             //   child: AdWidget(
//             //     ad: adProvider.interstitialAd,
//             //   ),
//             // ):Container(height: 0,),
//
//
//
//
//
//             //menu
//             Positioned(
//               // top: display.height*(30/700),
//               top: display.height*(30/580),
//               left: display.width*(20/980),
//               child: InkWell(
//                 onTap: () async {
//                   // showDialog(
//                   //     context: context,
//                   //     // barrierDismissible: false,
//                   //     builder: (context) => dialogMenu()
//                   // );
//
//                   // showDialog(
//                   //   context: context,
//                   //   builder: (context) => dialogMenu(),
//                   // );
//
//                   // showGeneralDialog(
//                   //     context: context,
//                   //     barrierLabel: '',
//                   //     barrierDismissible: true,
//                   //     barrierColor: Colors.black.withOpacity(0.5),
//                   //     transitionDuration: Duration(milliseconds: 600),
//                   //     // transitionBuilder: (context, a1, a2, widget) {
//                   //     //   return Transform.translate(
//                   //     //       offset: Offset(0,-1),
//                   //     //       child: dialogMenu(),
//                   //     //   );
//                   //     // },
//                   //     pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
//                   //       //return dialogMenu();
//                   //       return SlideTransition(
//                   //         child: dialogMenu(),
//                   //         position: Tween<Offset>(
//                   //           //begin: getBeginOffset(direction),
//                   //           begin: Offset(0,-1),
//                   //           end: Offset.zero,
//                   //         ).animate(animation),
//                   //       );
//                   //     }
//                   // );
//
//                   // await methods.playSound(file: "soundscrate-graphics-game-blip-2")
//                   //     .then((value) {
//                   //   showTransitionDialog(
//                   //     context: context,
//                   //     child: dialogMenu(mAudio, user!),
//                   //   );
//                   // });
//
//                   print("mAudio $mAudio");
//                   print("user $user");
//
//                   Sounds.buttonClick;
//                   //await methods.playSound(file: "soundscrate-graphics-game-blip-2")
//                   //   .then((value) {
//                     dialogMenu(context,mAudio, user!);
//                   //});
//
//
//                   // showTransitionDialog(
//                   //   context: context,
//                   //   child: dialogMenu(null, user!),
//                   // );
//
//                 },
//                 child: Container(
//                   // height: 209.34,
//                   // width: 372,
//                   // width: display.width*0.87,
//                   // width: display.width*0.90,
//                   // width: display.width*0.93,
//                   // width: 73,
//                   width: display.width*(73/350),
//                   alignment: Alignment.bottomCenter,
//                   child: Image.asset(
//                     "assets/images/Group 11.png",
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ),
//             ),
//
//             //win
//             Positioned(
//               // top: display.height*(30/700),
//               top: display.height*(30/580),
//               left: display.width*(279/370),
//               child: InkWell(
//                 onTap: () async {
//                   // showDialog(
//                   //     context: context,
//                   //     // barrierDismissible: false,
//                   //     builder: (context) => dialogPoints()
//                   // );
//
//                   Sounds.buttonClick;
//                   // await methods.playSound(file: "soundscrate-graphics-game-blip-2");
//                   showTransitionDialog(
//                     context: context,
//                     child: dialogPoints(context, user!),
//                   );
//
//                   // showTransitionDialog(
//                   //   context: context,
//                   //   child: dialogPoints(user!),
//                   // );
//
//                 },
//                 child: Container(
//                   // height: 209.34,
//                   // width: 372,
//                   // width: display.width*0.87,
//                   // width: display.width*0.90,
//                   // width: display.width*0.93,
//                   // width: 73,
//                   width: display.width*(73/350),
//                   alignment: Alignment.bottomCenter,
//                   child: Image.asset(
//                     "assets/images/Group 22.png",
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ),
//             ),
//
//             //credits
//             Positioned(
//               top: display.height*(120/700),
//               left: display.width*(279/370),
//               child: InkWell(
//                 onTap: () async {
//                   // showDialog(
//                   //     context: context,
//                   //     // barrierDismissible: false,
//                   //     builder: (context) => dialogScoreBoard()
//                   // );
//
//                   List users = await Login.getUsersWithFilter(user!.id);
//                   // print('users ${users}');
//                   Sounds.buttonClick;
//                   // methods.playSound(file: "soundscrate-graphics-game-blip-2");
//                   showTransitionDialog(
//                     context: context,
//                     child: dialogScoreBoard(context, user!, users),
//                     // child: dialogScoreBoard(context, user!,),
//                   );
//
//                   // List users = await Login.getUsers(user!.id);
//                   // // print('users ${users}');
//                   //
//                   // showTransitionDialog(
//                   //   context: context,
//                   //   child: dialogScoreBoard(user!, users),
//                   // );
//
//                 },
//                 child: Container(
//                   // height: 209.34,
//                   // width: 372,
//                   // width: display.width*0.87,
//                   // width: display.width*0.90,
//                   // width: display.width*0.93,
//                   // width: 73,
//                   width: display.width*(73/350),
//                   alignment: Alignment.bottomCenter,
//                   child: Image.asset(
//                     "assets/images/Group 21.png",
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ),
//             ),
//
//             //info
//             Positioned(
//               top: display.height*(210/700),
//               left: display.width*(279/370),
//               child: InkWell(
//                 onTap: () async {
//                   // showDialog(
//                   //     context: context,
//                   //     // barrierDismissible: false,
//                   //     builder: (context) => dialogQuery()
//                   // );
//
//                   Sounds.buttonClick;
//                   // await methods.playSound(file: "soundscrate-graphics-game-blip-2");
//                   // methods.playSound(file: "Video Game Button Sound Effects");
//                   showTransitionDialog(
//                     context: context,
//                     child: dialogQuery(context, user!),
//                   );
//
//                   // showTransitionDialog(
//                   //   context: context,
//                   //   child: dialogQuery(),
//                   // );
//
//                 },
//                 child: Container(
//                   // height: 209.34,
//                   // width: 372,
//                   // width: display.width*0.87,
//                   // width: display.width*0.90,
//                   // width: display.width*0.93,
//                   // width: 73,
//                   width: display.width*(73/350),
//                   alignment: Alignment.bottomCenter,
//                   child: Image.asset(
//                     "assets/images/Group 23.png",
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ),
//             ),
//
//             //play
//             Positioned(
//               // top: 482,
//               top: display.height*(482/840),
//               left: display.width*(110.83/370),
//               child: Container(
//                 // height: 209.34,
//                 // width: 372,
//                 // width: display.width*0.87,
//                 // width: display.width*0.90,
//                 // width: display.width*0.93,
//                 // width: 73,
//                 // width: display.width*(73/350),
//                 // height: 80.49,
//                 width: 168.36,
//                 alignment: Alignment.bottomCenter,
//                 child: GestureDetector(
//                   onTap: () async {
//                     // Navigator.of(context).push(
//                     //   MaterialPageRoute(
//                     //       builder: (context) => Screen3()
//                     //   ),
//                     // );
//
//                     // if(adProvider.isInterstitialLoaded){
//                     //   adProvider.interstitialAd.show();
//                     // }
//
//
//                     // await mAudio.pauseMusic().then((value) async {
//                       Sounds.buttonClick;
//                       // await methods.playSound(file: "soundscrate-graphics-game-blip-2");
//                       Navigator.of(context).pushReplacement(
//                         NavigateWithOpaque(
//                           child: Screen3(user: user!, mAudio: mAudio,),
//                           // duration: 200,
//                           direction: AxisDirection.left,
//                         ),
//                       );
//                     // });
//
//
//                     // if(adProvider.isRewardedLoaded){
//                     //   adProvider.rewardedAd.show(
//                     //       onUserEarnedReward: (view, reward){
//                     //         print('reward.amount ${reward.amount}');
//                     //         //10
//                     //
//                     //         Navigator.of(context).pushReplacement(
//                     //           NavigateWithOpaque(
//                     //             child: Screen3(user: user!,),
//                     //             // duration: 200,
//                     //             direction: AxisDirection.left,
//                     //           ),
//                     //         );
//                     //
//                     //       }
//                     //   );
//                     // }
//
//                     // Navigator.of(context).pushReplacement(
//                     //   NavigateWithOpaque(
//                     //     child: Screen3(user: user!,),
//                     //     // duration: 200,
//                     //     direction: AxisDirection.left,
//                     //   ),
//                     // );
//
//                   },
//                   child: Image.asset(
//                     "assets/images/Group 13_1.png",
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ),
//             ),
//
//             //dash
//             Positioned(
//               // top: 639,
//               // left: 36,
//               top: display.height*(639/900),
//               // left: display.width*(36/900),
//               left: display.width*(36/980),
//               child: Container(
//                 // height: 209.34,
//                 // width: 372,
//                 // width: display.width*0.87,
//                 // width: display.width*0.90,
//                 width: display.width*0.93,
//                 alignment: Alignment.bottomCenter,
//                 child: Image.asset(
//                   "assets/images/Group 14.png",
//                   fit: BoxFit.fill,
//                 ),
//               ),
//             ),
//
//             //text
//             Positioned(
//               // top: 639,
//               // left: 36,
//               // top: display.height*(703/900),
//               top: display.height*(720/900),
//               // left: display.width*(36/900),
//               left: display.width*(36/980),
//               child: Container(
//                 // height: 209.34,
//                 // width: 372,
//                 // width: display.width*0.87,
//                 // width: display.width*0.90,
//                 width: display.width*0.93,
//                 alignment: Alignment.bottomCenter,
//                 // child: Image.asset(
//                 //   "assets/images/Group 14.png",
//                 //   fit: BoxFit.fill,
//                 // ),
//                 child: Text(
//                   "Daily Challange",
//                   style: GoogleFonts.roboto(
//                     color: Color(0xffffffff),
//                     fontSize: 20.0,
//                     // letterSpacing: -1.5,
//                     fontWeight: FontWeight.w800,
//                     // height: 23.44,
//                   ),
//                 ),
//               ),
//             ),
//
//
//             //challange
//             Positioned(
//               // top: 639,
//               // left: 36,
//               top: display.height*(605/890),
//               // left: display.width*(36/900),
//               // left: display.width*(275/980),
//               // left: display.width*(74/980),
//
//               // left: (display.width/2),
//
//               left: (display.width/2)-(74*1.5),
//               child: Container(
//                 // height: 209.34,
//                 // width: 372,
//                 // width: display.width*0.87,
//                 // width: display.width*0.90,
//                 // width: display.width*0.93,
//                 // alignment: Alignment.bottomCenter,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Container(
//                       // height: 42,
//                       // width: 42,
//                       height: 50,
//                       width: 50,
//                       // margin: EdgeInsets.all(10),
//                       alignment: Alignment.center,
//                       decoration: const BoxDecoration(
//                         image: DecorationImage(
//                           alignment: Alignment.center,
//                           image: ExactAssetImage(
//                             "assets/images/Ellipse 5.png",
//                             // scale: 10,
//                           ),
//                           // fit: BoxFit.fill,
//                           // fit: BoxFit.cover,
//                         ),
//                       ),
//                       // child: Image.asset(
//                       //   "assets/images/Vector 1.png",
//                       //   fit: BoxFit.fill,
//                       //   // height: 30,
//                       //   // width: 30,
//                       //   scale: 0.5,
//                       // ),
//                       child: Stack(
//                         children: [
//                           //isChallengeCompleted
//                           false?
//                           Positioned(
//                             top: 10,
//                             left: 18,
//                             child: Text(
//                               "1",
//                               style: GoogleFonts.roboto(
//                                 color: Color(0xffffffff),
//                                 fontSize: 20.0,
//                                 // letterSpacing: -1.5,
//                                 fontWeight: FontWeight.w800,
//                                 // height: 23.44,
//                               ),
//                             ),
//                           )
//                               : Positioned(
//
//                             // top: MediaQuery.of(context).size.width/2,
//                             top: 15,
//                             left: 15,
//                             child: Image.asset("assets/images/Vector.png",
//                               scale: 4,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       // height: 42,
//                       // width: 42,
//                       height: 50,
//                       width: 50,
//                       // margin: EdgeInsets.all(10),
//                       alignment: Alignment.center,
//                       decoration: const BoxDecoration(
//                         image: DecorationImage(
//                           alignment: Alignment.center,
//                           image: ExactAssetImage(
//                             "assets/images/Ellipse 5.png",
//                             // scale: 10,
//                           ),
//                           // fit: BoxFit.fill,
//                           // fit: BoxFit.cover,
//                         ),
//                       ),
//                       // child: Image.asset(
//                       //   "assets/images/Vector 1.png",
//                       //   fit: BoxFit.fill,
//                       //   // height: 30,
//                       //   // width: 30,
//                       //   scale: 0.5,
//                       // ),
//                       child: Stack(
//                         children: [
//                           false?
//                           Positioned(
//                             top: 10,
//                             left: 18,
//                             child: Text(
//                               "2",
//                               style: GoogleFonts.roboto(
//                                 color: Color(0xffffffff),
//                                 fontSize: 20.0,
//                                 // letterSpacing: -1.5,
//                                 fontWeight: FontWeight.w800,
//                                 // height: 23.44,
//                               ),
//                             ),
//                           )
//                               : Positioned(
//
//                             // top: MediaQuery.of(context).size.width/2,
//                             top: 15,
//                             left: 15,
//                             child: Image.asset("assets/images/Vector.png",
//                               scale: 4,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       // height: 42,
//                       // width: 42,
//                       height: 50,
//                       width: 50,
//                       // margin: EdgeInsets.all(10),
//                       alignment: Alignment.center,
//                       decoration: const BoxDecoration(
//                         image: DecorationImage(
//                           alignment: Alignment.center,
//                           image: ExactAssetImage(
//                             "assets/images/Ellipse 8.png",
//                             // scale: 10,
//                             // scale: 2
//                           ),
//                           // fit: BoxFit.fill,
//                           // fit: BoxFit.cover,
//                         ),
//                       ),
//                       // child: Image.asset(
//                       //   "assets/images/Vector 1.png",
//                       //   fit: BoxFit.fill,
//                       //   // height: 30,
//                       //   // width: 30,
//                       //   scale: 0.5,
//                       // ),
//                       child: Stack(
//                         children: [
//                           Positioned(
//                             top: 10,
//                             left: 18,
//                             child: Text(
//                               "3",
//                               style: GoogleFonts.roboto(
//                                 color: Color(0xff1E7757),
//                                 fontSize: 20.0,
//                                 // letterSpacing: -1.5,
//                                 fontWeight: FontWeight.w800,
//                                 // height: 23.44,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       // height: 42,
//                       // width: 42,
//                       height: 50,
//                       width: 50,
//                       // margin: EdgeInsets.all(10),
//                       alignment: Alignment.center,
//                       decoration: const BoxDecoration(
//                         image: DecorationImage(
//                           alignment: Alignment.center,
//                           image: ExactAssetImage(
//                             "assets/images/Ellipse 8.png",
//                             // scale: 10,
//                             // scale: 2
//                           ),
//                           // fit: BoxFit.fill,
//                           // fit: BoxFit.cover,
//                         ),
//                       ),
//                       // child: Image.asset(
//                       //   "assets/images/Vector 1.png",
//                       //   fit: BoxFit.fill,
//                       //   // height: 30,
//                       //   // width: 30,
//                       //   scale: 0.5,
//                       // ),
//                       child: Stack(
//                         children: [
//                           Positioned(
//                             top: 10,
//                             left: 18,
//                             child: Text(
//                               "4",
//                               style: GoogleFonts.roboto(
//                                 color: Color(0xff1E7757),
//                                 fontSize: 20.0,
//                                 // letterSpacing: -1.5,
//                                 fontWeight: FontWeight.w800,
//                                 // height: 23.44,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//
//
//                   ],
//                 ),
//               ),
//             ),
//
//
//           ],
//         ),
//       ),
//     );
//   }
//
// }

// class Screen22 extends StatefulWidget {
//   const Screen22({Key? key,
//     // required this.user
//   }) : super(key: key);
//
//   // final DocumentSnapshot user;
//
//   @override
//   State<Screen2> createState() => _Screen2State();
// }
// class _Screen22State extends State<Screen22> {
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//     //getUser("rNBYvJMWkehwTVxEpFu1");
//
//   }
//
//   DocumentSnapshot? user;
//
//   getUser(String id) async {
//     DocumentSnapshot ds = await Database
//         .pathData("users").doc(id).get();
//     // QuerySnapshot qs = await Database
//     //     .pathData("users").where("id", isEqualTo: id).get();
//     setState(() {
//
//       // DocumentSnapshot ds = qs.docs.first;
//
//       // if(ds!=null) {
//       user = ds;
//       // }
//     });
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     Size display = MediaQuery.of(context).size;
//
//     if(user!=null){
//       print('User ${user!["name"]}');
//     }
//
//     return Scaffold(
//       body: Container(
//         width: display.width,
//         height: display.height,
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: ExactAssetImage(
//               "assets/images/background.png",
//             ),
//             // fit: BoxFit.fill,
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Stack(
//           children: [
//
//
//
//             /*
//             //clouds
//             Clouds(display: display),
//
//             //tree
//             Tree(display: display),
//
//             //branch
//             Branch(display),
//
//             //left root
//             LeftRoot(),
//
//             //grass
//             Grass(display: display),
//
//             //right root
//             RightRoot(),
//             */
//
//             backGround(display),
//
//
//             // //text
//             // Positioned(
//             //   top: 59,
//             //   // top: 57,
//             //   left: 9,
//             //   child: Container(
//             //     // height: 209.34,
//             //     // width: 372,
//             //     width: display.width*0.95,
//             //     alignment: Alignment.bottomCenter,
//             //     child: Image.asset(
//             //       "assets/images/Spooky_Text_Effect 2.png",
//             //       fit: BoxFit.fill,
//             //     ),
//             //   ),
//             // ),
//
//
//             //menu
//             Positioned(
//               // top: display.height*(30/700),
//               top: display.height*(30/580),
//               left: display.width*(20/980),
//               child: InkWell(
//                 onTap: (){
//                   // showDialog(
//                   //     context: context,
//                   //     // barrierDismissible: false,
//                   //     builder: (context) => dialogMenu()
//                   // );
//
//                   // showDialog(
//                   //   context: context,
//                   //   builder: (context) => dialogMenu(),
//                   // );
//
//                   // showGeneralDialog(
//                   //     context: context,
//                   //     barrierLabel: '',
//                   //     barrierDismissible: true,
//                   //     barrierColor: Colors.black.withOpacity(0.5),
//                   //     transitionDuration: Duration(milliseconds: 600),
//                   //     // transitionBuilder: (context, a1, a2, widget) {
//                   //     //   return Transform.translate(
//                   //     //       offset: Offset(0,-1),
//                   //     //       child: dialogMenu(),
//                   //     //   );
//                   //     // },
//                   //     pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
//                   //       //return dialogMenu();
//                   //       return SlideTransition(
//                   //         child: dialogMenu(),
//                   //         position: Tween<Offset>(
//                   //           //begin: getBeginOffset(direction),
//                   //           begin: Offset(0,-1),
//                   //           end: Offset.zero,
//                   //         ).animate(animation),
//                   //       );
//                   //     }
//                   // );
//
//                   dialogMenu(context,null, user!);
//
//                   // showTransitionDialog(
//                   //   context: context,
//                   //   child: dialogMenu(null, user!),
//                   // );
//
//                 },
//                 child: Container(
//                   // height: 209.34,
//                   // width: 372,
//                   // width: display.width*0.87,
//                   // width: display.width*0.90,
//                   // width: display.width*0.93,
//                   // width: 73,
//                   width: display.width*(73/350),
//                   alignment: Alignment.bottomCenter,
//                   child: Image.asset(
//                     "assets/images/Group 11.png",
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ),
//             ),
//
//             //win
//             Positioned(
//               // top: display.height*(30/700),
//               top: display.height*(30/580),
//               left: display.width*(279/370),
//               child: InkWell(
//                 onTap: (){
//                   // showDialog(
//                   //     context: context,
//                   //     // barrierDismissible: false,
//                   //     builder: (context) => dialogPoints()
//                   // );
//
//                   showTransitionDialog(
//                     context: context,
//                     child: dialogPoints(context, user!),
//                   );
//
//                 },
//                 child: Container(
//                   // height: 209.34,
//                   // width: 372,
//                   // width: display.width*0.87,
//                   // width: display.width*0.90,
//                   // width: display.width*0.93,
//                   // width: 73,
//                   width: display.width*(73/350),
//                   alignment: Alignment.bottomCenter,
//                   child: Image.asset(
//                     "assets/images/Group 22.png",
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ),
//             ),
//
//             //credits
//             Positioned(
//               top: display.height*(120/700),
//               left: display.width*(279/370),
//               child: InkWell(
//                 onTap: () async {
//                   // showDialog(
//                   //     context: context,
//                   //     // barrierDismissible: false,
//                   //     builder: (context) => dialogScoreBoard()
//                   // );
//
//                   List users = await Login.getUsers(user!.id);
//
//                   showTransitionDialog(
//                     context: context,
//                     child: dialogScoreBoard(context, user!, users),
//                     // child: dialogScoreBoard(context, user!,),
//                   );
//
//                 },
//                 child: Container(
//                   // height: 209.34,
//                   // width: 372,
//                   // width: display.width*0.87,
//                   // width: display.width*0.90,
//                   // width: display.width*0.93,
//                   // width: 73,
//                   width: display.width*(73/350),
//                   alignment: Alignment.bottomCenter,
//                   child: Image.asset(
//                     "assets/images/Group 21.png",
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ),
//             ),
//
//             //info
//             Positioned(
//               top: display.height*(210/700),
//               left: display.width*(279/370),
//               child: InkWell(
//                 onTap: (){
//                   // showDialog(
//                   //     context: context,
//                   //     // barrierDismissible: false,
//                   //     builder: (context) => dialogQuery()
//                   // );
//
//                   showTransitionDialog(
//                     context: context,
//                     child: dialogQuery(context, user!),
//                   );
//
//                 },
//                 child: Container(
//                   // height: 209.34,
//                   // width: 372,
//                   // width: display.width*0.87,
//                   // width: display.width*0.90,
//                   // width: display.width*0.93,
//                   // width: 73,
//                   width: display.width*(73/350),
//                   alignment: Alignment.bottomCenter,
//                   child: Image.asset(
//                     "assets/images/Group 23.png",
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ),
//             ),
//
//             //play
//             Positioned(
//               // top: 482,
//               top: display.height*(482/840),
//               left: display.width*(110.83/370),
//               child: Container(
//                 // height: 209.34,
//                 // width: 372,
//                 // width: display.width*0.87,
//                 // width: display.width*0.90,
//                 // width: display.width*0.93,
//                 // width: 73,
//                 // width: display.width*(73/350),
//                 // height: 80.49,
//                 width: 168.36,
//                 alignment: Alignment.bottomCenter,
//                 child: GestureDetector(
//                   onTap: (){
//                     // Navigator.of(context).push(
//                     //   MaterialPageRoute(
//                     //       builder: (context) => Screen3()
//                     //   ),
//                     // );
//
//                     Navigator.of(context).pushReplacement(
//                       NavigateWithOpaque(
//                         child: Screen3(user: user!,),
//                         // duration: 200,
//                         direction: AxisDirection.left,
//                       ),
//                     );
//
//                   },
//                   child: Image.asset(
//                     "assets/images/Group 13_1.png",
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ),
//             ),
//
//             //dash
//             Positioned(
//               // top: 639,
//               // left: 36,
//               top: display.height*(639/900),
//               // left: display.width*(36/900),
//               left: display.width*(36/980),
//               child: Container(
//                 // height: 209.34,
//                 // width: 372,
//                 // width: display.width*0.87,
//                 // width: display.width*0.90,
//                 width: display.width*0.93,
//                 alignment: Alignment.bottomCenter,
//                 child: Image.asset(
//                   "assets/images/Group 14.png",
//                   fit: BoxFit.fill,
//                 ),
//               ),
//             ),
//
//             //text
//             Positioned(
//               // top: 639,
//               // left: 36,
//               // top: display.height*(703/900),
//               top: display.height*(720/900),
//               // left: display.width*(36/900),
//               left: display.width*(36/980),
//               child: Container(
//                 // height: 209.34,
//                 // width: 372,
//                 // width: display.width*0.87,
//                 // width: display.width*0.90,
//                 width: display.width*0.93,
//                 alignment: Alignment.bottomCenter,
//                 // child: Image.asset(
//                 //   "assets/images/Group 14.png",
//                 //   fit: BoxFit.fill,
//                 // ),
//                 child: Text(
//                   "Daily Challange",
//                   style: GoogleFonts.roboto(
//                     color: Color(0xffffffff),
//                     fontSize: 20.0,
//                     // letterSpacing: -1.5,
//                     fontWeight: FontWeight.w800,
//                     // height: 23.44,
//                   ),
//                 ),
//               ),
//             ),
//
//
//             //challange
//             Positioned(
//               // top: 639,
//               // left: 36,
//               top: display.height*(605/890),
//               // left: display.width*(36/900),
//               // left: display.width*(275/980),
//               // left: display.width*(74/980),
//               left: (display.width/2)-(74*1.5),
//               child: Container(
//                 // height: 209.34,
//                 // width: 372,
//                 // width: display.width*0.87,
//                 // width: display.width*0.90,
//                 // width: display.width*0.93,
//                 // alignment: Alignment.bottomCenter,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Container(
//                       // height: 42,
//                       // width: 42,
//                       height: 50,
//                       width: 50,
//                       // margin: EdgeInsets.all(10),
//                       alignment: Alignment.center,
//                       decoration: const BoxDecoration(
//                         image: DecorationImage(
//                           alignment: Alignment.center,
//                           image: ExactAssetImage(
//                             "assets/images/Ellipse 5.png",
//                             // scale: 10,
//                           ),
//                           // fit: BoxFit.fill,
//                           // fit: BoxFit.cover,
//                         ),
//                       ),
//                       // child: Image.asset(
//                       //   "assets/images/Vector 1.png",
//                       //   fit: BoxFit.fill,
//                       //   // height: 30,
//                       //   // width: 30,
//                       //   scale: 0.5,
//                       // ),
//                       child: Stack(
//                         children: [
//                           //isChallengeCompleted
//                           false?
//                           Positioned(
//                             top: 10,
//                             left: 18,
//                             child: Text(
//                               "1",
//                               style: GoogleFonts.roboto(
//                                 color: Color(0xffffffff),
//                                 fontSize: 20.0,
//                                 // letterSpacing: -1.5,
//                                 fontWeight: FontWeight.w800,
//                                 // height: 23.44,
//                               ),
//                             ),
//                           )
//                               : Positioned(
//
//                             // top: MediaQuery.of(context).size.width/2,
//                             top: 15,
//                             left: 15,
//                             child: Image.asset("assets/images/Vector.png",
//                               scale: 4,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       // height: 42,
//                       // width: 42,
//                       height: 50,
//                       width: 50,
//                       // margin: EdgeInsets.all(10),
//                       alignment: Alignment.center,
//                       decoration: const BoxDecoration(
//                         image: DecorationImage(
//                           alignment: Alignment.center,
//                           image: ExactAssetImage(
//                             "assets/images/Ellipse 5.png",
//                             // scale: 10,
//                           ),
//                           // fit: BoxFit.fill,
//                           // fit: BoxFit.cover,
//                         ),
//                       ),
//                       // child: Image.asset(
//                       //   "assets/images/Vector 1.png",
//                       //   fit: BoxFit.fill,
//                       //   // height: 30,
//                       //   // width: 30,
//                       //   scale: 0.5,
//                       // ),
//                       child: Stack(
//                         children: [
//                           false?
//                           Positioned(
//                             top: 10,
//                             left: 18,
//                             child: Text(
//                               "2",
//                               style: GoogleFonts.roboto(
//                                 color: Color(0xffffffff),
//                                 fontSize: 20.0,
//                                 // letterSpacing: -1.5,
//                                 fontWeight: FontWeight.w800,
//                                 // height: 23.44,
//                               ),
//                             ),
//                           )
//                               : Positioned(
//
//                             // top: MediaQuery.of(context).size.width/2,
//                             top: 15,
//                             left: 15,
//                             child: Image.asset("assets/images/Vector.png",
//                               scale: 4,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       // height: 42,
//                       // width: 42,
//                       height: 50,
//                       width: 50,
//                       // margin: EdgeInsets.all(10),
//                       alignment: Alignment.center,
//                       decoration: const BoxDecoration(
//                         image: DecorationImage(
//                           alignment: Alignment.center,
//                           image: ExactAssetImage(
//                             "assets/images/Ellipse 8.png",
//                             // scale: 10,
//                             // scale: 2
//                           ),
//                           // fit: BoxFit.fill,
//                           // fit: BoxFit.cover,
//                         ),
//                       ),
//                       // child: Image.asset(
//                       //   "assets/images/Vector 1.png",
//                       //   fit: BoxFit.fill,
//                       //   // height: 30,
//                       //   // width: 30,
//                       //   scale: 0.5,
//                       // ),
//                       child: Stack(
//                         children: [
//                           Positioned(
//                             top: 10,
//                             left: 18,
//                             child: Text(
//                               "3",
//                               style: GoogleFonts.roboto(
//                                 color: Color(0xff1E7757),
//                                 fontSize: 20.0,
//                                 // letterSpacing: -1.5,
//                                 fontWeight: FontWeight.w800,
//                                 // height: 23.44,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       // height: 42,
//                       // width: 42,
//                       height: 50,
//                       width: 50,
//                       // margin: EdgeInsets.all(10),
//                       alignment: Alignment.center,
//                       decoration: const BoxDecoration(
//                         image: DecorationImage(
//                           alignment: Alignment.center,
//                           image: ExactAssetImage(
//                             "assets/images/Ellipse 8.png",
//                             // scale: 10,
//                             // scale: 2
//                           ),
//                           // fit: BoxFit.fill,
//                           // fit: BoxFit.cover,
//                         ),
//                       ),
//                       // child: Image.asset(
//                       //   "assets/images/Vector 1.png",
//                       //   fit: BoxFit.fill,
//                       //   // height: 30,
//                       //   // width: 30,
//                       //   scale: 0.5,
//                       // ),
//                       child: Stack(
//                         children: [
//                           Positioned(
//                             top: 10,
//                             left: 18,
//                             child: Text(
//                               "4",
//                               style: GoogleFonts.roboto(
//                                 color: Color(0xff1E7757),
//                                 fontSize: 20.0,
//                                 // letterSpacing: -1.5,
//                                 fontWeight: FontWeight.w800,
//                                 // height: 23.44,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//
//
//                   ],
//                 ),
//               ),
//             ),
//
//
//           ],
//         ),
//       ),
//     );
//   }
//
// }

 /*Screen222 (BuildContext context, Size display, DocumentSnapshot user, AdProvider adProvider, MAudio mAudio){//, Function call //Widget

  const mockupWidth = 390;
  const mockupHeight = 844;

  double width = display.width;
  double height = display.height;

  final scale = mockupWidth / width;
  final divide = mockupWidth * width;

  double initScale = 4;

  final tmpHeight = 917.6470759830676 - height;
  // print('tmpHeight $tmpHeight');
  // print('tmpHeight ${tmpHeight/mockupHeight*height}');
  // print('tmpHeight ${tmpHeight*scale}');

  late bool showProgress = false;

  return
    //Column(
    //children: [

      // PixelPerfect(
      //   scale: scale,
        // initOpacity: ,
        // child:
        StatefulBuilder(
          builder: (context, setState){

            // late bool showProgress = false;

            return Container(
              width: width,
              height: height,
              child:
              Stack(
                children: [

                  //menu
                  Positioned(
                    // top: display.height*(30/700),
                    // top: display.height*(30/580),
                    // left: display.width*(20/980),
                    // top: 25 * scale,
                    // left: 10 * scale,
                    // top: 25 / mockupHeight * height,
                    // left: 10 / mockupWidth * width,
                    top: (25*scale) / mockupHeight * height,
                    left: (10*scale) / mockupWidth * width,
                    // left: 30 / divide,
                    child: InkWell(
                      onTap: () async {
                        // showDialog(
                        //     context: context,
                        //     // barrierDismissible: false,
                        //     builder: (context) => dialogMenu()
                        // );

                        // showDialog(
                        //   context: context,
                        //   builder: (context) => dialogMenu(),
                        // );

                        // showGeneralDialog(
                        //     context: context,
                        //     barrierLabel: '',
                        //     barrierDismissible: true,
                        //     barrierColor: Colors.black.withOpacity(0.5),
                        //     transitionDuration: Duration(milliseconds: 600),
                        //     // transitionBuilder: (context, a1, a2, widget) {
                        //     //   return Transform.translate(
                        //     //       offset: Offset(0,-1),
                        //     //       child: dialogMenu(),
                        //     //   );
                        //     // },
                        //     pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                        //       //return dialogMenu();
                        //       return SlideTransition(
                        //         child: dialogMenu(),
                        //         position: Tween<Offset>(
                        //           //begin: getBeginOffset(direction),
                        //           begin: Offset(0,-1),
                        //           end: Offset.zero,
                        //         ).animate(animation),
                        //       );
                        //     }
                        // );

                        // await mAudio.pauseMusic().then((value) {

                        //await methods.playSound(file: "soundscrate-graphics-game-blip-2")
                        //      .then((value) {
                        // showTransitionDialog(
                        //   context: context,
                        //   child: dialogMenu(mAudio, user),
                        // );

                        (!user["sound"])? null :
                        Sounds.buttonClick;

                        dialogMenu(context,mAudio, user);

                        //  });

                        // });

                        // showTransitionDialog(
                        //   context: context,
                        //   child: dialogMenu(),
                        // );

                      },
                      child: Container(
                        // height: 209.34,
                        // width: 372,
                        // width: display.width*0.87,
                        // width: display.width*0.90,
                        // width: display.width*0.93,
                        // width: 73,
                        // width: display.width*(73/350),
                        //width: 73 / divide,
                        // width: 73 * scale,
                        // alignment: Alignment.bottomCenter,
                        child: Image.asset(
                          "assets/images/Group 11.png",
                          fit: BoxFit.fill,
                          // scale: 4 * scale,
                          scale: initScale * scale,
                        ),
                      ),
                    ),
                  ),

                  //points
                  Positioned(
                    // top: display.height*(30/700),
                    // top: display.height*(30/580)+80,
                    // // left: display.width*(20/980),
                    // left: display.width*(20/980)+10,
                    // top: (25+73+13+5) / mockupHeight * height,
                    // left: 26 / mockupWidth * width,
                    top: ((25+73+13+5)*scale) / mockupHeight * height,
                    left: (26*scale) / mockupWidth * width,
                    child: InkWell(
                      onTap: () async {
                      },
                      child: Container(
                        padding: EdgeInsets.all(3),
                        // padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Color(0xffFFEDBE),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              // width: display.width*(73/350),
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              alignment: Alignment.center,
                              // child: Image.asset(
                              //   "assets/images/Group 2608537.png",
                              //   fit: BoxFit.fill,
                              //   scale: 4,
                              // ),
                              child: Text(
                                // "100",
                                "${user["history"]["total_points"]??0}",
                                style: TextStyle(
                                  // fontWeight: FontWeight.w500,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffD49A34),
                                  fontFamily: 'Roboto',
                                  fontSize: 17.17 / mockupWidth * width,
                                ),
                              ),
                            ),
                            // SizedBox(width: 5,),
                            Container(
                              // width: display.width*(73/350),
                              // margin: EdgeInsets.symmetric(horizontal: 3),
                              // margin: EdgeInsets.symmetric(horizontal: 1.15),//6.15
                              alignment: Alignment.center,
                              child: Image.asset(
                                "assets/images/Group 2608537.png",
                                fit: BoxFit.fill,
                                // scale: 4 * scale,
                                scale: initScale * scale,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  //win
                  Positioned(
                    // top: display.height*(30/700),
                    // top: display.height*(30/580),
                    // left: display.width*(279/370),
                    // top: 25 * scale,
                    // right: 5 * scale,
                    //   top: 25 / mockupHeight * height,
                    // right: 5 / mockupWidth * width,
                    top: (25*scale) / mockupHeight * height,
                    right: (5*scale) / mockupWidth * width,
                    child: InkWell(
                      onTap: () async {
                        // showDialog(
                        //     context: context,
                        //     // barrierDismissible: false,
                        //     builder: (context) => dialogPoints()
                        // );

                        // await mAudio.pauseMusic().then((value) {
                        // await methods.playSound(file: "soundscrate-graphics-game-blip-2");
                        (!user["sound"])? null :
                        Sounds.buttonClick;
                        showTransitionDialog(
                          context: context,
                          child: dialogPoints(context, user!),
                        );
                        // });

                        // showTransitionDialog(
                        //   context: context,
                        //   child: dialogPoints(user!),
                        // );

                      },
                      child: Container(
                        // height: 209.34,
                        // width: 372,
                        // width: display.width*0.87,
                        // width: display.width*0.90,
                        // width: display.width*0.93,
                        // width: 73,
                        // width: display.width*(73/350),
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(
                          "assets/images/Group 22.png",
                          fit: BoxFit.fill,
                          // scale: 4 * scale,
                          scale: initScale * scale,
                          // scale: 4 / mockupWidth * width,
                        ),
                      ),
                    ),
                  ),

                  //credits
                  Positioned(
                    // top: display.height*(120/700),
                    // left: display.width*(279/370),
                    // top: 133 * scale,
                    // right: 5 * scale,
                    top: (133 * scale)/mockupHeight*height,
                    right: (5 * scale)/mockupWidth*width,
                    child: InkWell(
                      onTap: () async {
                        // showDialog(
                        //     context: context,
                        //     // barrierDismissible: false,
                        //     builder: (context) => dialogScoreBoard()
                        // );

                        // await mAudio.pauseMusic().then((value) {

                        (!user["sound"])? null :
                        Sounds.buttonClick;

                        // setState((){showProgress=true;});

                        // print('showProgress $showProgress');

                        List users = await Login.getUsersWithFilter(user!.id);
                        // print('users ${users}');
                        //methods.playSound(file: "soundscrate-graphics-game-blip-2");

                        // Future.delayed(const Duration(seconds: 5),(){

                          // setState((){showProgress=false;});
                          // print('showProgress $showProgress');

                          // Sounds.buttonClick;
                          showTransitionDialog(
                            context: context,
                            child: dialogScoreBoard(context, user!, users),
                            // child: dialogScoreBoard(context, user!,),
                          );

                        // });

                        // });

                        // // List users = await Login.getUsers(user!.id);
                        // List users = await Login.getUsersWithFilter(user!.id);
                        // // print('users ${users}');
                        //
                        // showTransitionDialog(
                        //   context: context,
                        //   child: dialogScoreBoard(user!, users),
                        // );

                      },
                      child: Container(
                        // height: 209.34,
                        // width: 372,
                        // width: display.width*0.87,
                        // width: display.width*0.90,
                        // width: display.width*0.93,
                        // width: 73,
                        // width: display.width*(73/350),
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(
                          "assets/images/Group 21.png",
                          fit: BoxFit.fill,
                          // scale: 4 * scale,
                          scale: initScale * scale,
                        ),
                      ),
                    ),
                  ),

                  *//*
                //info
                Positioned(
                  // top: display.height*(210/700),
                  // left: display.width*(279/370),
                  // top: 239 * scale,
                  // right: 5 * scale,
                  top: (239 * scale)/mockupHeight*height,
                  right: (5 * scale)/mockupWidth*width,
                  child: InkWell(
                    onTap: () async {
                      // showDialog(
                      //     context: context,
                      //     // barrierDismissible: false,
                      //     builder: (context) => dialogQuery()
                      // );

                      // await mAudio.pauseMusic().then((value) {
                      // await methods.playSound(file: "soundscrate-graphics-game-blip-2");
                      // methods.playSound(file: "Video Game Button Sound Effects");
                      (!user["sound"])? null :
                      Sounds.buttonClick;
                      showTransitionDialog(
                        context: context,
                        child: dialogQuery(context, user!),
                      );
                      // });

                      // showTransitionDialog(
                      //   context: context,
                      //   child: dialogQuery(),
                      // );

                    },
                    child: Container(
                      // height: 209.34,
                      // width: 372,
                      // width: display.width*0.87,
                      // width: display.width*0.90,
                      // width: display.width*0.93,
                      // width: 73,
                      // width: display.width*(73/350),
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        "assets/images/Group 23.png",
                        fit: BoxFit.fill,
                        // scale: 4 * scale,
                        scale: initScale * scale,
                      ),
                    ),
                  ),
                ),
                *//*

                  // Positioned(
                  //   top: 100,
                  //   child: adProvider.isBannerLoaded?
                  //   Container(
                  //     height: adProvider.bannerAd.size.height.toDouble(),
                  //     child: AdWidget(
                  //       ad: adProvider.bannerAd,
                  //     ),
                  //   ):Container(height: 0,),
                  // ),

                  //play
                  Positioned(
                    // top: 482,
                    // top: display.height*(482/840),
                    // left: display.width*(110.83/370),
                    // top: 558 * scale,
                    // right: (((width/2) - (168.36/2))-15) * scale,
                    // top: 558 / mockupHeight * height,
                    // top: 482 / mockupHeight * height,
                    // right: (((width/2) - (168.36/2))-15) / mockupWidth * width,
                    // top: (482*scale) / mockupHeight * height,
                    // right: ((((width/2) - (168.36/2))-15)*scale) / mockupWidth * width,

                    // top: (482*scale) / mockupHeight * height,
                    // left: (110.83*scale)/mockupWidth*width,
                    top: ((height<=720?420:482)*scale) / mockupHeight * height,
                    left: ((width<=360?98:110.83)*scale)/mockupWidth*width,
                    child: Container(
                      // height: 209.34,
                      // width: 372,
                      // width: display.width*0.87,
                      // width: display.width*0.90,
                      // width: display.width*0.93,
                      // width: 73,
                      // width: display.width*(73/350),
                      // height: 80.49,
                      // width: 168.36,
                      alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                        onTap: () async {
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //       builder: (context) => Screen3()
                          //   ),
                          // );

                          // if(adProvider.isInterstitialLoaded){
                          //   adProvider.interstitialAd.show();
                          // }

                          // if(adProvider.isRewardedLoaded){
                          //   adProvider.rewardedAd.show(
                          //       onUserEarnedReward: (view, reward){
                          //         print('reward.amount ${reward.amount}');
                          //         //10
                          //
                          //         Navigator.of(context).pushReplacement(
                          //           NavigateWithOpaque(
                          //             child: Screen3(user: user!,),
                          //             // duration: 200,
                          //             direction: AxisDirection.left,
                          //           ),
                          //         );
                          //
                          //       }
                          //   );
                          // }

                          // call();

                          //await mAudio.pauseMusic().then((value) async {
                            // await methods.playSound(file: "soundscrate-graphics-game-blip-2");

                            (!user["sound"])? null :
                            Sounds.buttonClick;
                            // Navigator.of(context).pushReplacement(
                            Navigator.of(context).push(
                              NavigateWithOpaque(
                                child: Screen3(user: user!, mAudio: mAudio,),
                                // duration: 200,
                                direction: AxisDirection.left,
                              ),
                            );
                          //});

                          // const file = "soundscrate-graphics-game-blip-2";
                          // methods.playSound(file: file);

                          // Navigator.of(context).pushReplacement(
                          //   NavigateWithOpaque(
                          //     child: Screen3(user: user!,),
                          //     // duration: 200,
                          //     direction: AxisDirection.left,
                          //   ),
                          // );

                          // Navigator.of(context).pushReplacement(
                          //   NavigateWithOpaque(
                          //     child: Screen3(user: user!,),
                          //     // duration: 200,
                          //     direction: AxisDirection.left,
                          //   ),
                          // );

                        },
                        child: Image.asset(
                          "assets/images/Group 13_1.png",
                          fit: BoxFit.fill,
                          // scale: 4 * scale,
                          scale: initScale * scale,
                        ),
                      ),
                    ),
                  ),

                  //dash
                  Positioned(
                    // top: 639,
                    // left: 36,
                    // top: display.height*(639/900),
                    // left: display.width*(36/900),
                    // left: display.width*(36/980),
                    // left: display.width*(36/700),

                    // top: 745 * scale,
                    // right: (((width/2) - (318/2))-29) * scale,
                    // top: 639 / mockupHeight * height,
                    // right: (((width/2) - (318/2))-15) / mockupWidth * width,

                    // right: ((((width/2) - (318/2))-15)*scale) / mockupWidth * width,
                    // left: (36*scale) / mockupWidth * width,

                    // top: (639*scale) / mockupHeight * height,
                    // left: (26*scale) / mockupWidth * width,

                    top: ((height<=720?570:639)*scale) / mockupHeight * height,
                    left: ((width<=360?20:26)*scale)/mockupWidth*width,

                    child: Container(
                      // height: 209.34,
                      // width: 372,
                      // width: display.width*0.87,
                      // width: display.width*0.90,
                      // height: 20,
                      // width: display.width*0.93,
                      // alignment: Alignment.bottomCenter,
                      alignment: Alignment.center,
                      // decoration: BoxDecoration(
                      //   image: DecorationImage(
                      //     alignment: Alignment.center,
                      //     image: ExactAssetImage(
                      //       // "assets/images/Group 14.png",
                      //       "assets/images/Group 15.png",
                      //       // scale: 4,
                      //     ),
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      child: Stack(
                        children: [
                          Image.asset(
                            // "assets/images/Group 14.png",
                            "assets/images/Group 15.png",
                            fit: BoxFit.fill,
                            // scale: 4 * scale,
                            scale: initScale * scale,
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.width/12.5,
                            // left: MediaQuery.of(context).size.width/12.5,
                            left: MediaQuery.of(context).size.width/9.5,
                            // child: Image.asset(
                            //   "assets/images/Vector 11.png",
                            //   fit: BoxFit.fill,
                            //   height: 10,
                            // ),
                            child: Container(
                              //width: 100,
                              // width: MediaQuery.of(context).size.width/1.45,
                              // width: ((MediaQuery.of(context).size.width/1.45)/4)*1,
                              width: ((MediaQuery.of(context).size.width/1.45)/2)*(user["daily_challange"] as int),
                              // width: ((MediaQuery.of(context).size.width/1.45)/4)*(user["daily_challange"] as int),
                              height: 10 / mockupHeight * height,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: Color(0xff74C171),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // child: Container(),

                      //FAFFFA
                      //74C171
                    ),
                  ),

                  //text
                  Positioned(
                    // top: 639,
                    // left: 36,
                    // top: display.height*(703/900),
                    // top: display.height*(720/900),
                    // // left: display.width*(36/900),
                    // left: display.width*(36/980),
                    // top: 828 * scale,
                    // top: (703-1) / mockupHeight * height,
                    // right: (((width/2) - ((width*0.93)/2))+1) * scale,
                    // top: (703-1 + 10) / mockupHeight * height,
                    // right: (((width/2) - ((width*0.93)/2))+1) /mockupWidth*width,

                    // top: ((703-1 + 10)*scale) / mockupHeight * height,
                    // right: ((((width/2) - ((width*0.93)/2))+1)*scale) /mockupWidth*width,

                    top: ((height<=720?(633-1 + 10):(703-1 + 10))*scale) / mockupHeight * height,
                    left: ((width<=360?(((width/2) - ((width*0.93)/2))+1):(((width/2) - ((width*0.93)/2))+1))*scale)/mockupWidth*width,

                    child: Container(
                      // height: 209.34,
                      // width: 372,
                      // width: display.width*0.87,
                      // width: display.width*0.90,
                      // width: display.width*0.93,
                      width: width*0.93,
                      alignment: Alignment.bottomCenter,
                      // child: Image.asset(
                      //   "assets/images/Group 14.png",
                      //   fit: BoxFit.fill,
                      // ),
                      child: Text(
                        "Daily Challange",
                        style: GoogleFonts.roboto(
                          color: Color(0xffffffff),
                          fontSize: 20.0 / mockupWidth * width,
                          // letterSpacing: -1.5,
                          fontWeight: FontWeight.w800,
                          // height: 23.44,
                        ),
                      ),
                    ),
                  ),


                  //challange
                  Positioned(
                    // top: 639,
                    // left: 36,
                    // top: display.height*(605/890),
                    // // left: display.width*(36/900),
                    // // left: display.width*(275/980),
                    // // left: display.width*(74/980),
                    // left: (display.width/2)-(74*1.5),

                    // top: (605-1) / mockupHeight * height,
                    // left: 36 / mockupWidth * width,


                    // top: ((605-1)*scale) / mockupHeight * height, //4
                    // left: (36*scale) / mockupWidth * width, // 4

                    // right: (((width/2) - ((width*0.93)/2))+1) * scale,


                    // top: ((605-1)*scale) / mockupHeight * height,
                    // left: (70*scale) / mockupWidth * width, // 3

                    top: ((height<=720?(538-1):(605-1))*scale) / mockupHeight * height,
                    // left: ((width<=360?65:70)*scale)/mockupWidth*width,
                    left: ((width<=360?95:100)*scale)/mockupWidth*width,


                    // child: SingleChildScrollView(
                    child: Container(
                      // height: 209.34,
                      // width: 372,
                      // width: display.width*0.87,
                      // width: display.width*0.90,
                      // width: display.width*0.93,
                      // alignment: Alignment.bottomCenter,

                      width: (318+2) / mockupWidth * width, //4
                      height: 121 / mockupHeight * height,
                      child: SingleChildScrollView(
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // children: [
                          //   Container(
                          //     // height: 42,
                          //     // width: 42,
                          //     height: 50,
                          //     width: 50,
                          //     // margin: EdgeInsets.all(10),
                          //     alignment: Alignment.center,
                          //     decoration: const BoxDecoration(
                          //       image: DecorationImage(
                          //         alignment: Alignment.center,
                          //         image: ExactAssetImage(
                          //           "assets/images/Ellipse 5.png",
                          //           // scale: 10,
                          //         ),
                          //         // fit: BoxFit.fill,
                          //         // fit: BoxFit.cover,
                          //       ),
                          //     ),
                          //     // child: Image.asset(
                          //     //   "assets/images/Vector 1.png",
                          //     //   fit: BoxFit.fill,
                          //     //   // height: 30,
                          //     //   // width: 30,
                          //     //   scale: 0.5,
                          //     // ),
                          //     child: Stack(
                          //       children: [
                          //         //isChallengeCompleted
                          //         false?
                          //         Positioned(
                          //           top: 10,
                          //           left: 18,
                          //           child: Text(
                          //             "1",
                          //             style: GoogleFonts.roboto(
                          //               color: Color(0xffffffff),
                          //               fontSize: 20.0,
                          //               // letterSpacing: -1.5,
                          //               fontWeight: FontWeight.w800,
                          //               // height: 23.44,
                          //             ),
                          //           ),
                          //         )
                          //             : Positioned(
                          //
                          //           // top: MediaQuery.of(context).size.width/2,
                          //           top: 15,
                          //           left: 15,
                          //           child: Image.asset("assets/images/Vector.png",
                          //             scale: 4,
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          //   Container(
                          //     // height: 42,
                          //     // width: 42,
                          //     height: 50,
                          //     width: 50,
                          //     // margin: EdgeInsets.all(10),
                          //     alignment: Alignment.center,
                          //     decoration: const BoxDecoration(
                          //       image: DecorationImage(
                          //         alignment: Alignment.center,
                          //         image: ExactAssetImage(
                          //           "assets/images/Ellipse 5.png",
                          //           // scale: 10,
                          //         ),
                          //         // fit: BoxFit.fill,
                          //         // fit: BoxFit.cover,
                          //       ),
                          //     ),
                          //     // child: Image.asset(
                          //     //   "assets/images/Vector 1.png",
                          //     //   fit: BoxFit.fill,
                          //     //   // height: 30,
                          //     //   // width: 30,
                          //     //   scale: 0.5,
                          //     // ),
                          //     child: Stack(
                          //       children: [
                          //         false?
                          //         Positioned(
                          //           top: 10,
                          //           left: 18,
                          //           child: Text(
                          //             "2",
                          //             style: GoogleFonts.roboto(
                          //               color: Color(0xffffffff),
                          //               fontSize: 20.0,
                          //               // letterSpacing: -1.5,
                          //               fontWeight: FontWeight.w800,
                          //               // height: 23.44,
                          //             ),
                          //           ),
                          //         )
                          //             : Positioned(
                          //
                          //           // top: MediaQuery.of(context).size.width/2,
                          //           top: 15,
                          //           left: 15,
                          //           child: Image.asset("assets/images/Vector.png",
                          //             scale: 4,
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          //   Container(
                          //     // height: 42,
                          //     // width: 42,
                          //     height: 50,
                          //     width: 50,
                          //     // margin: EdgeInsets.all(10),
                          //     alignment: Alignment.center,
                          //     decoration: const BoxDecoration(
                          //       image: DecorationImage(
                          //         alignment: Alignment.center,
                          //         image: ExactAssetImage(
                          //           "assets/images/Ellipse 8.png",
                          //           // scale: 10,
                          //           // scale: 2
                          //         ),
                          //         // fit: BoxFit.fill,
                          //         // fit: BoxFit.cover,
                          //       ),
                          //     ),
                          //     // child: Image.asset(
                          //     //   "assets/images/Vector 1.png",
                          //     //   fit: BoxFit.fill,
                          //     //   // height: 30,
                          //     //   // width: 30,
                          //     //   scale: 0.5,
                          //     // ),
                          //     child: Stack(
                          //       children: [
                          //         Positioned(
                          //           top: 10,
                          //           left: 18,
                          //           child: Text(
                          //             "3",
                          //             style: GoogleFonts.roboto(
                          //               color: Color(0xff1E7757),
                          //               fontSize: 20.0,
                          //               // letterSpacing: -1.5,
                          //               fontWeight: FontWeight.w800,
                          //               // height: 23.44,
                          //             ),
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          //   Container(
                          //     // height: 42,
                          //     // width: 42,
                          //     height: 50,
                          //     width: 50,
                          //     // margin: EdgeInsets.all(10),
                          //     alignment: Alignment.center,
                          //     decoration: const BoxDecoration(
                          //       image: DecorationImage(
                          //         alignment: Alignment.center,
                          //         image: ExactAssetImage(
                          //           "assets/images/Ellipse 8.png",
                          //           // scale: 10,
                          //           // scale: 2
                          //         ),
                          //         // fit: BoxFit.fill,
                          //         // fit: BoxFit.cover,
                          //       ),
                          //     ),
                          //     // child: Image.asset(
                          //     //   "assets/images/Vector 1.png",
                          //     //   fit: BoxFit.fill,
                          //     //   // height: 30,
                          //     //   // width: 30,
                          //     //   scale: 0.5,
                          //     // ),
                          //     child: Stack(
                          //       children: [
                          //         Positioned(
                          //           top: 10,
                          //           left: 18,
                          //           child: Text(
                          //             "4",
                          //             style: GoogleFonts.roboto(
                          //               color: Color(0xff1E7757),
                          //               fontSize: 20.0,
                          //               // letterSpacing: -1.5,
                          //               fontWeight: FontWeight.w800,
                          //               // height: 23.44,
                          //             ),
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ],

                          children: //List.generate(4, (index) {
                          // List.generate(3, (index) {
                          List.generate(2, (index) {

                            return InkWell(
                              onTap: () async {

                                // await mAudio.pauseMusic().then((value) async {

                                  (!user["sound"])? null :
                                  await Sounds.buttonClick;
                                  if((user["daily_challange"] as int) < 3){
                                    //random puzzle
                                    Random random = Random(3);

                                    // const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
                                    const _chars = '1234567890';
                                    late String res = List.generate(3, (index) => _chars[random.nextInt(_chars.length)]).join();

                                    int lastPuzzle = 0;
                                    // String mode = widget.mode.toLowerCase();
                                    late String mode = index==0?"Easy":"Medium";
                                    switch(mode.toLowerCase()){
                                      case 'easy':
                                        lastPuzzle = 146;
                                        break;
                                      case 'medium':
                                        lastPuzzle = 400;
                                        break;
                                      case 'hard':
                                        lastPuzzle = 36;
                                        break;
                                      case 'impossible':
                                        lastPuzzle = 98;
                                        break;
                                    }

                                    // if(int.parse(res)>366){
                                    // if(int.parse(res)>142){
                                    // if(int.parse(res)>=126){
                                    if(int.parse(res)>=lastPuzzle){
                                      res = List.generate(2, (index) => _chars[random.nextInt(_chars.length)]).join();
                                    }

                                    final String level = res;//""
                                    // const String mode = "Hard";//Easy, Medium, Hard
                                    // const String mode = "Medium";
                                    // late String mode = index==0?"Easy":"Medium";
                                    print('index $index');
                                    print('result $level $mode');

                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                          // builder: (context)=> SecondPage(payload: payload ?? "",),
                                          builder: (context)=> Screen4(level: level, mode: mode, user: user, isDailyChallenge: true, mAudio: mAudio,),
                                        )
                                    );
                                  }

                                // });

                              },
                              child: Container(
                                // height: 50,
                                // width: 50,
                                // width: 42 / mockupWidth * width,
                                // height: 42 / mockupHeight * height,
                                width: 42 / mockupWidth * width,
                                height: 42 / mockupWidth * width,
                                // margin: EdgeInsets.only(bottom: 79 / mockupHeight * height, left: 38 / mockupWidth * width),
                                // margin: EdgeInsets.only(bottom: 79 / mockupHeight * height, left: 25 / mockupWidth * width),
                                margin: EdgeInsets.only(bottom: 79 / mockupHeight * height, left: (index==0?38:25) / mockupWidth * width),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  // image: DecorationImage(
                                  //   alignment: Alignment.center,
                                  //   image: ExactAssetImage(
                                  //     // index<(user["daily_challange"] as int)
                                  //     index<(user["daily_challange"] as int)
                                  //     // (index<2)
                                  //     // true
                                  //         ?"assets/images/Ellipse 5.png":
                                  //     "assets/images/Ellipse 8.png",
                                  //     //scale: 4 * scale,
                                  //     // scale: 0.5,
                                  //   ),
                                  // ),
                                  color: index<(user["daily_challange"] as int)?Color(0xff1E7757):Color(0xffffffff),
                                  borderRadius: BorderRadius.all(Radius.circular(60)),
                                ),
                                // child: Stack(
                                //   children: [
                                //     Positioned(
                                //       // top: 10,
                                //       // left: 18,
                                //       // left: 18,
                                //       // top: 15,
                                //       // left: 15,
                                //       // top: index<(user["daily_challange"] as int)?15:10,
                                //       // right: index<(user["daily_challange"] as int)?18:20,
                                //       child:
                                //       // true?
                                //       index<(user["daily_challange"] as int)?
                                //       Image.asset("assets/images/Vector.png",
                                //         // scale: 4 * scale,
                                //         scale: scale,
                                //       )
                                //           :
                                //       Text(
                                //         "${index+1}",
                                //         style: GoogleFonts.roboto(
                                //           color: Color(0xff1E7757),
                                //           fontSize: 20.0 / mockupWidth * width,
                                //           fontWeight: FontWeight.w800,
                                //         ),
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                child: index<(user["daily_challange"] as int)?
                                Image.asset("assets/images/Vector.png",
                                  // scale: 4 * scale,
                                  scale: initScale * scale,
                                  // scale: scale,
                                )
                                    :
                                Text(
                                  "${index+1}",
                                  style: GoogleFonts.roboto(
                                    color: Color(0xff1E7757),
                                    fontSize: 20.0 / mockupWidth * width,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                    // ),
                  ),

            // showProgress?
                  Container(
                    // width: width,
                    // height: height,
                    alignment: Alignment.center,
                    child: showProgress?
                    // child: true?

                    // child:

                    Container(
                      // width: 50,
                      // height: 50,
                      // alignment: Alignment.center,
                      //   child: const CircularProgressIndicator(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        )
                    )
                    : Container(),
                  ),
                // : Container(),

                ],
              ),
            );
          },
        );
        //,
      // );
  //,

      // adProvider.isBannerLoaded?
      // Container(
      //   height: adProvider.bannerAd.size.height.toDouble(),
      //   child: AdWidget(
      //     ad: adProvider.bannerAd,
      //   ),
      // ):Container(height: 0,),


    //],
  //);
}*/

Screen222 (BuildContext context, Size display, DocumentSnapshot user, AdProvider adProvider){//, Function call //Widget //, MAudio mAudio

  const mockupWidth = 390;
  const mockupHeight = 844;

  double width = display.width;
  double height = display.height;

  final scale = mockupWidth / width;
  final divide = mockupWidth * width;

  double initScale = 4;

  final tmpHeight = 917.6470759830676 - height;
  // print('tmpHeight $tmpHeight');
  // print('tmpHeight ${tmpHeight/mockupHeight*height}');
  // print('tmpHeight ${tmpHeight*scale}');

  late bool showProgress = false;

  final bool isTablat = width>500 && height>800?true:false;

  return
    //Column(
    //children: [

    // PixelPerfect(
    //   scale: scale,
    // initOpacity: ,
    // child:
    StatefulBuilder(
      builder: (context, setState){

        // late bool showProgress = false;

        return Container(
          width: width,
          height: height,
          child:
          Stack(
            children: [

              //menu
              Positioned(
                // top: display.height*(30/700),
                // top: display.height*(30/580),
                // left: display.width*(20/980),
                // top: 25 * scale,
                // left: 10 * scale,
                // top: 25 / mockupHeight * height,
                // left: 10 / mockupWidth * width,
                /*top: (25*scale) / mockupHeight * height,*/
                left: (10*scale) / mockupWidth * width,
                top: (isTablat?25:25*scale) / mockupHeight * height,
                // left: 30 / divide,
                child: InkWell(
                  onTap: () async {
                    // showDialog(
                    //     context: context,
                    //     // barrierDismissible: false,
                    //     builder: (context) => dialogMenu()
                    // );

                    // showDialog(
                    //   context: context,
                    //   builder: (context) => dialogMenu(),
                    // );

                    // showGeneralDialog(
                    //     context: context,
                    //     barrierLabel: '',
                    //     barrierDismissible: true,
                    //     barrierColor: Colors.black.withOpacity(0.5),
                    //     transitionDuration: Duration(milliseconds: 600),
                    //     // transitionBuilder: (context, a1, a2, widget) {
                    //     //   return Transform.translate(
                    //     //       offset: Offset(0,-1),
                    //     //       child: dialogMenu(),
                    //     //   );
                    //     // },
                    //     pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                    //       //return dialogMenu();
                    //       return SlideTransition(
                    //         child: dialogMenu(),
                    //         position: Tween<Offset>(
                    //           //begin: getBeginOffset(direction),
                    //           begin: Offset(0,-1),
                    //           end: Offset.zero,
                    //         ).animate(animation),
                    //       );
                    //     }
                    // );

                    // await mAudio.pauseMusic().then((value) {

                    //await methods.playSound(file: "soundscrate-graphics-game-blip-2")
                    //      .then((value) {
                    // showTransitionDialog(
                    //   context: context,
                    //   child: dialogMenu(mAudio, user),
                    // );

                    /*(!user["sound"])? null :
                    Sounds.buttonClick;*/

                    // dialogMenu(context,mAudio, user);
                    dialogMenu(context, user);

                    //  });

                    // });

                    // showTransitionDialog(
                    //   context: context,
                    //   child: dialogMenu(),
                    // );

                  },
                  child: Container(
                    // height: 209.34,
                    // width: 372,
                    // width: display.width*0.87,
                    // width: display.width*0.90,
                    // width: display.width*0.93,
                    // width: 73,
                    // width: display.width*(73/350),
                    //width: 73 / divide,
                    // width: 73 * scale,
                    // alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      "assets/images/Group 11.png",
                      fit: BoxFit.fill,
                      // scale: 4 * scale,
                      scale: initScale * scale,
                    ),
                  ),
                ),
              ),

              //points
              Positioned(
                // top: display.height*(30/700),
                // top: display.height*(30/580)+80,
                // // left: display.width*(20/980),
                // left: display.width*(20/980)+10,
                // top: (25+73+13+5) / mockupHeight * height,
                // left: 26 / mockupWidth * width,
                /*top: ((25+73+13+5)*scale) / mockupHeight * height,*/
                left: (26*scale) / mockupWidth * width,
                top: (isTablat?(25+73+13+5+25):(25+73+13+5)*scale) / mockupHeight * height,
                child: InkWell(
                  onTap: () async {
                  },
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    // padding: EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Color(0xffFFEDBE),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          // width: display.width*(73/350),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          alignment: Alignment.center,
                          // child: Image.asset(
                          //   "assets/images/Group 2608537.png",
                          //   fit: BoxFit.fill,
                          //   scale: 4,
                          // ),
                          child: Text(
                            // "100",
                            "${user["history"]["total_points"]??0}",
                            style: TextStyle(
                              // fontWeight: FontWeight.w500,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffD49A34),
                              fontFamily: 'Roboto',
                              fontSize: 17.17 / mockupWidth * width,
                            ),
                          ),
                        ),
                        // SizedBox(width: 5,),
                        Container(
                          // width: display.width*(73/350),
                          // margin: EdgeInsets.symmetric(horizontal: 3),
                          // margin: EdgeInsets.symmetric(horizontal: 1.15),//6.15
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/images/Group 2608537.png",
                            fit: BoxFit.fill,
                            // scale: 4 * scale,
                            scale: initScale * scale,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              //win
              Positioned(
                // top: display.height*(30/700),
                // top: display.height*(30/580),
                // left: display.width*(279/370),
                // top: 25 * scale,
                // right: 5 * scale,
                //   top: 25 / mockupHeight * height,
                // right: 5 / mockupWidth * width,
                /*top: (25*scale) / mockupHeight * height,*/
                right: (5*scale) / mockupWidth * width,
                top: (isTablat?25:25*scale) / mockupHeight * height,
                child: InkWell(
                  onTap: () async {
                    // showDialog(
                    //     context: context,
                    //     // barrierDismissible: false,
                    //     builder: (context) => dialogPoints()
                    // );

                    // await mAudio.pauseMusic().then((value) {
                    // await methods.playSound(file: "soundscrate-graphics-game-blip-2");
                    /*(!user["sound"])? null :
                    Sounds.buttonClick;*/
                    showTransitionDialog(
                      context: context,
                      // child: dialogPoints(context, user!),
                      child: dialogPoints(context, user),
                    );
                    // });

                    // showTransitionDialog(
                    //   context: context,
                    //   child: dialogPoints(user!),
                    // );

                  },
                  child: Container(
                    // height: 209.34,
                    // width: 372,
                    // width: display.width*0.87,
                    // width: display.width*0.90,
                    // width: display.width*0.93,
                    // width: 73,
                    // width: display.width*(73/350),
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      "assets/images/Group 22.png",
                      fit: BoxFit.fill,
                      // scale: 4 * scale,
                      scale: initScale * scale,
                      // scale: 4 / mockupWidth * width,
                    ),
                  ),
                ),
              ),

              //credits
              Positioned(
                // top: display.height*(120/700),
                // left: display.width*(279/370),
                // top: 133 * scale,
                // right: 5 * scale,
                /*top: (133 * scale)/mockupHeight*height,*/
                right: (5 * scale)/mockupWidth*width,
                top: (isTablat?133:133 * scale)/mockupHeight*height,
                child: InkWell(
                  onTap: () async {
                    // showDialog(
                    //     context: context,
                    //     // barrierDismissible: false,
                    //     builder: (context) => dialogScoreBoard()
                    // );

                    // await mAudio.pauseMusic().then((value) {

                    /*(!user["sound"])? null :
                    Sounds.buttonClick;*/

                    // setState((){showProgress=true;});

                    // print('showProgress $showProgress');

                    // List users = await Login.getUsersWithFilter(user!.id);
                    List users = await Login.getUsersWithFilter(user.id);
                    // print('users ${users}');
                    //methods.playSound(file: "soundscrate-graphics-game-blip-2");

                    // Future.delayed(const Duration(seconds: 5),(){

                    // setState((){showProgress=false;});
                    // print('showProgress $showProgress');

                    // Sounds.buttonClick;
                    showTransitionDialog(
                      context: context,
                      // child: dialogScoreBoard(context, user!, users),
                      child: dialogScoreBoard(context, user, users),
                      // child: dialogScoreBoard(context, user!,),
                    );

                    // });

                    // });

                    // // List users = await Login.getUsers(user!.id);
                    // List users = await Login.getUsersWithFilter(user!.id);
                    // // print('users ${users}');
                    //
                    // showTransitionDialog(
                    //   context: context,
                    //   child: dialogScoreBoard(user!, users),
                    // );

                  },
                  child: Container(
                    // height: 209.34,
                    // width: 372,
                    // width: display.width*0.87,
                    // width: display.width*0.90,
                    // width: display.width*0.93,
                    // width: 73,
                    // width: display.width*(73/350),
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      "assets/images/Group 21.png",
                      fit: BoxFit.fill,
                      // scale: 4 * scale,
                      scale: initScale * scale,
                    ),
                  ),
                ),
              ),

              /*
                //info
                Positioned(
                  // top: display.height*(210/700),
                  // left: display.width*(279/370),
                  // top: 239 * scale,
                  // right: 5 * scale,
                  top: (239 * scale)/mockupHeight*height,
                  right: (5 * scale)/mockupWidth*width,
                  child: InkWell(
                    onTap: () async {
                      // showDialog(
                      //     context: context,
                      //     // barrierDismissible: false,
                      //     builder: (context) => dialogQuery()
                      // );

                      // await mAudio.pauseMusic().then((value) {
                      // await methods.playSound(file: "soundscrate-graphics-game-blip-2");
                      // methods.playSound(file: "Video Game Button Sound Effects");
                      (!user["sound"])? null :
                      Sounds.buttonClick;
                      showTransitionDialog(
                        context: context,
                        child: dialogQuery(context, user!),
                      );
                      // });

                      // showTransitionDialog(
                      //   context: context,
                      //   child: dialogQuery(),
                      // );

                    },
                    child: Container(
                      // height: 209.34,
                      // width: 372,
                      // width: display.width*0.87,
                      // width: display.width*0.90,
                      // width: display.width*0.93,
                      // width: 73,
                      // width: display.width*(73/350),
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        "assets/images/Group 23.png",
                        fit: BoxFit.fill,
                        // scale: 4 * scale,
                        scale: initScale * scale,
                      ),
                    ),
                  ),
                ),
                */

              // Positioned(
              //   top: 100,
              //   child: adProvider.isBannerLoaded?
              //   Container(
              //     height: adProvider.bannerAd.size.height.toDouble(),
              //     child: AdWidget(
              //       ad: adProvider.bannerAd,
              //     ),
              //   ):Container(height: 0,),
              // ),

              //play
              Positioned(
                // top: 482,
                // top: display.height*(482/840),
                // left: display.width*(110.83/370),
                // top: 558 * scale,
                // right: (((width/2) - (168.36/2))-15) * scale,
                // top: 558 / mockupHeight * height,
                // top: 482 / mockupHeight * height,
                // right: (((width/2) - (168.36/2))-15) / mockupWidth * width,
                // top: (482*scale) / mockupHeight * height,
                // right: ((((width/2) - (168.36/2))-15)*scale) / mockupWidth * width,

                // top: (482*scale) / mockupHeight * height,
                // left: (110.83*scale)/mockupWidth*width,
                /*top: ((height<=720?420:482)*scale) / mockupHeight * height,
                left: ((width<=360?98:110.83)*scale)/mockupWidth*width,*/
                top: (isTablat?420:(height<=720?420:482)*scale) / mockupHeight * height,
                left: (isTablat?98:(width<=360?98:110.83)*scale)/mockupWidth*width,
                child: Container(
                  // height: 209.34,
                  // width: 372,
                  // width: display.width*0.87,
                  // width: display.width*0.90,
                  // width: display.width*0.93,
                  // width: 73,
                  // width: display.width*(73/350),
                  // height: 80.49,
                  // width: 168.36,
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () async {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //       builder: (context) => Screen3()
                      //   ),
                      // );

                      // if(adProvider.isInterstitialLoaded){
                      //   adProvider.interstitialAd.show();
                      // }

                      // if(adProvider.isRewardedLoaded){
                      //   adProvider.rewardedAd.show(
                      //       onUserEarnedReward: (view, reward){
                      //         print('reward.amount ${reward.amount}');
                      //         //10
                      //
                      //         Navigator.of(context).pushReplacement(
                      //           NavigateWithOpaque(
                      //             child: Screen3(user: user!,),
                      //             // duration: 200,
                      //             direction: AxisDirection.left,
                      //           ),
                      //         );
                      //
                      //       }
                      //   );
                      // }

                      // call();

                      //await mAudio.pauseMusic().then((value) async {
                      // await methods.playSound(file: "soundscrate-graphics-game-blip-2");

                      /*(!user["sound"])? null :
                      Sounds.buttonClick;*/

                      // //crashlytics check
                      // // throw const FormatException("error");
                      // FirebaseCrashlytics.instance.crash();
                      // //SystemNavigator.pop();
                      // // exit(0);
                      // // throw(Exception('Hello Crashlytics'));
                      // // return;

                      // Navigator.of(context).pushReplacement(
                      Navigator.of(context).push(
                        NavigateWithOpaque(
                          // child: Screen3(user: user!, mAudio: mAudio,),
                          // child: Screen3(user: user!,),
                          child: Screen3(user: user,),
                          // duration: 200,
                          direction: AxisDirection.left,
                        ),
                      );
                      //});

                      // const file = "soundscrate-graphics-game-blip-2";
                      // methods.playSound(file: file);

                      // Navigator.of(context).pushReplacement(
                      //   NavigateWithOpaque(
                      //     child: Screen3(user: user!,),
                      //     // duration: 200,
                      //     direction: AxisDirection.left,
                      //   ),
                      // );

                      // Navigator.of(context).pushReplacement(
                      //   NavigateWithOpaque(
                      //     child: Screen3(user: user!,),
                      //     // duration: 200,
                      //     direction: AxisDirection.left,
                      //   ),
                      // );

                    },
                    child: Image.asset(
                      "assets/images/Group 13_1.png",
                      fit: BoxFit.fill,
                      // scale: 4 * scale,
                      scale: initScale * scale,
                    ),
                  ),
                ),
              ),

              //dash
              Positioned(
                // top: 639,
                // left: 36,
                // top: display.height*(639/900),
                // left: display.width*(36/900),
                // left: display.width*(36/980),
                // left: display.width*(36/700),

                // top: 745 * scale,
                // right: (((width/2) - (318/2))-29) * scale,
                // top: 639 / mockupHeight * height,
                // right: (((width/2) - (318/2))-15) / mockupWidth * width,

                // right: ((((width/2) - (318/2))-15)*scale) / mockupWidth * width,
                // left: (36*scale) / mockupWidth * width,

                // top: (639*scale) / mockupHeight * height,
                // left: (26*scale) / mockupWidth * width,

                /*top: ((height<=720?570:639)*scale) / mockupHeight * height,
                left: ((width<=360?20:26)*scale)/mockupWidth*width,*/
                top: (isTablat?570:(height<=720?570:639)*scale) / mockupHeight * height,
                left: (isTablat?20:(width<=360?20:26)*scale)/mockupWidth*width,

                child: Container(
                  // height: 209.34,
                  // width: 372,
                  // width: display.width*0.87,
                  // width: display.width*0.90,
                  // height: 20,
                  // width: display.width*0.93,
                  // alignment: Alignment.bottomCenter,
                  alignment: Alignment.center,
                  // decoration: BoxDecoration(
                  //   image: DecorationImage(
                  //     alignment: Alignment.center,
                  //     image: ExactAssetImage(
                  //       // "assets/images/Group 14.png",
                  //       "assets/images/Group 15.png",
                  //       // scale: 4,
                  //     ),
                  //     fit: BoxFit.fill,
                  //   ),
                  // ),
                  child: Stack(
                    children: [
                      Image.asset(
                        // "assets/images/Group 14.png",
                        "assets/images/Group 15.png",
                        fit: BoxFit.fill,
                        // scale: 4 * scale,
                        scale: initScale * scale,
                      ),
                      Positioned(
                        /*top: MediaQuery.of(context).size.width/12.5,
                        // left: MediaQuery.of(context).size.width/12.5,
                        left: MediaQuery.of(context).size.width/9.5,*/
                        top: MediaQuery.of(context).size.width/12.5,
                        left: MediaQuery.of(context).size.width/9.5,
                        // child: Image.asset(
                        //   "assets/images/Vector 11.png",
                        //   fit: BoxFit.fill,
                        //   height: 10,
                        // ),
                        child: Container(
                          //width: 100,
                          // width: MediaQuery.of(context).size.width/1.45,
                          // width: ((MediaQuery.of(context).size.width/1.45)/4)*1,
                          width: ((MediaQuery.of(context).size.width/1.45)/2)*(user["daily_challange"] as int),
                          // width: ((MediaQuery.of(context).size.width/1.45)/4)*(user["daily_challange"] as int),
                          height: 10 / mockupHeight * height,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xff74C171),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // child: Container(),

                  //FAFFFA
                  //74C171
                ),
              ),

              //text
              Positioned(
                // top: 639,
                // left: 36,
                // top: display.height*(703/900),
                // top: display.height*(720/900),
                // // left: display.width*(36/900),
                // left: display.width*(36/980),
                // top: 828 * scale,
                // top: (703-1) / mockupHeight * height,
                // right: (((width/2) - ((width*0.93)/2))+1) * scale,
                // top: (703-1 + 10) / mockupHeight * height,
                // right: (((width/2) - ((width*0.93)/2))+1) /mockupWidth*width,

                // top: ((703-1 + 10)*scale) / mockupHeight * height,
                // right: ((((width/2) - ((width*0.93)/2))+1)*scale) /mockupWidth*width,

                /*top: ((height<=720?(633-1 + 10):(703-1 + 10))*scale) / mockupHeight * height,
                left: ((width<=360?(((width/2) - ((width*0.93)/2))+1):(((width/2) - ((width*0.93)/2))+1))*scale)/mockupWidth*width,*/
                top: (isTablat?(633-1 + 10+20):(height<=720?(633-1 + 10):(703-1 + 10))*scale) / mockupHeight * height,
                left: (isTablat?(((width/2) - ((width*0.93)/2))+1):(width<=360?(((width/2) - ((width*0.93)/2))+1):(((width/2) - ((width*0.93)/2))+1))*scale)/mockupWidth*width,

                child: Container(
                  // height: 209.34,
                  // width: 372,
                  // width: display.width*0.87,
                  // width: display.width*0.90,
                  // width: display.width*0.93,
                  width: width*0.93,
                  alignment: Alignment.bottomCenter,
                  // child: Image.asset(
                  //   "assets/images/Group 14.png",
                  //   fit: BoxFit.fill,
                  // ),
                  child: Text(
                    "Daily Challange",
                    style: GoogleFonts.roboto(
                      color: Color(0xffffffff),
                      fontSize: 20.0 / mockupWidth * width,
                      // letterSpacing: -1.5,
                      fontWeight: FontWeight.w800,
                      // height: 23.44,
                    ),
                  ),
                ),
              ),


              //challange
              Positioned(
                // top: 639,
                // left: 36,
                // top: display.height*(605/890),
                // // left: display.width*(36/900),
                // // left: display.width*(275/980),
                // // left: display.width*(74/980),
                // left: (display.width/2)-(74*1.5),

                // top: (605-1) / mockupHeight * height,
                // left: 36 / mockupWidth * width,


                // top: ((605-1)*scale) / mockupHeight * height, //4
                // left: (36*scale) / mockupWidth * width, // 4

                // right: (((width/2) - ((width*0.93)/2))+1) * scale,


                // top: ((605-1)*scale) / mockupHeight * height,
                // left: (70*scale) / mockupWidth * width, // 3

                /*top: ((height<=720?(538-1):(605-1))*scale) / mockupHeight * height,
                // left: ((width<=360?65:70)*scale)/mockupWidth*width,
                left: ((width<=360?95:100)*scale)/mockupWidth*width,*/
                top: (isTablat?(538-1+10):(height<=720?(538-1):(605-1))*scale) / mockupHeight * height,
                left: (isTablat?95:(width<=360?95:100)*scale)/mockupWidth*width,


                // child: SingleChildScrollView(
                child: Container(
                  // height: 209.34,
                  // width: 372,
                  // width: display.width*0.87,
                  // width: display.width*0.90,
                  // width: display.width*0.93,
                  // alignment: Alignment.bottomCenter,

                  width: (318+2) / mockupWidth * width, //4
                  height: 121 / mockupHeight * height,
                  child: SingleChildScrollView(
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // children: [
                      //   Container(
                      //     // height: 42,
                      //     // width: 42,
                      //     height: 50,
                      //     width: 50,
                      //     // margin: EdgeInsets.all(10),
                      //     alignment: Alignment.center,
                      //     decoration: const BoxDecoration(
                      //       image: DecorationImage(
                      //         alignment: Alignment.center,
                      //         image: ExactAssetImage(
                      //           "assets/images/Ellipse 5.png",
                      //           // scale: 10,
                      //         ),
                      //         // fit: BoxFit.fill,
                      //         // fit: BoxFit.cover,
                      //       ),
                      //     ),
                      //     // child: Image.asset(
                      //     //   "assets/images/Vector 1.png",
                      //     //   fit: BoxFit.fill,
                      //     //   // height: 30,
                      //     //   // width: 30,
                      //     //   scale: 0.5,
                      //     // ),
                      //     child: Stack(
                      //       children: [
                      //         //isChallengeCompleted
                      //         false?
                      //         Positioned(
                      //           top: 10,
                      //           left: 18,
                      //           child: Text(
                      //             "1",
                      //             style: GoogleFonts.roboto(
                      //               color: Color(0xffffffff),
                      //               fontSize: 20.0,
                      //               // letterSpacing: -1.5,
                      //               fontWeight: FontWeight.w800,
                      //               // height: 23.44,
                      //             ),
                      //           ),
                      //         )
                      //             : Positioned(
                      //
                      //           // top: MediaQuery.of(context).size.width/2,
                      //           top: 15,
                      //           left: 15,
                      //           child: Image.asset("assets/images/Vector.png",
                      //             scale: 4,
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      //   Container(
                      //     // height: 42,
                      //     // width: 42,
                      //     height: 50,
                      //     width: 50,
                      //     // margin: EdgeInsets.all(10),
                      //     alignment: Alignment.center,
                      //     decoration: const BoxDecoration(
                      //       image: DecorationImage(
                      //         alignment: Alignment.center,
                      //         image: ExactAssetImage(
                      //           "assets/images/Ellipse 5.png",
                      //           // scale: 10,
                      //         ),
                      //         // fit: BoxFit.fill,
                      //         // fit: BoxFit.cover,
                      //       ),
                      //     ),
                      //     // child: Image.asset(
                      //     //   "assets/images/Vector 1.png",
                      //     //   fit: BoxFit.fill,
                      //     //   // height: 30,
                      //     //   // width: 30,
                      //     //   scale: 0.5,
                      //     // ),
                      //     child: Stack(
                      //       children: [
                      //         false?
                      //         Positioned(
                      //           top: 10,
                      //           left: 18,
                      //           child: Text(
                      //             "2",
                      //             style: GoogleFonts.roboto(
                      //               color: Color(0xffffffff),
                      //               fontSize: 20.0,
                      //               // letterSpacing: -1.5,
                      //               fontWeight: FontWeight.w800,
                      //               // height: 23.44,
                      //             ),
                      //           ),
                      //         )
                      //             : Positioned(
                      //
                      //           // top: MediaQuery.of(context).size.width/2,
                      //           top: 15,
                      //           left: 15,
                      //           child: Image.asset("assets/images/Vector.png",
                      //             scale: 4,
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      //   Container(
                      //     // height: 42,
                      //     // width: 42,
                      //     height: 50,
                      //     width: 50,
                      //     // margin: EdgeInsets.all(10),
                      //     alignment: Alignment.center,
                      //     decoration: const BoxDecoration(
                      //       image: DecorationImage(
                      //         alignment: Alignment.center,
                      //         image: ExactAssetImage(
                      //           "assets/images/Ellipse 8.png",
                      //           // scale: 10,
                      //           // scale: 2
                      //         ),
                      //         // fit: BoxFit.fill,
                      //         // fit: BoxFit.cover,
                      //       ),
                      //     ),
                      //     // child: Image.asset(
                      //     //   "assets/images/Vector 1.png",
                      //     //   fit: BoxFit.fill,
                      //     //   // height: 30,
                      //     //   // width: 30,
                      //     //   scale: 0.5,
                      //     // ),
                      //     child: Stack(
                      //       children: [
                      //         Positioned(
                      //           top: 10,
                      //           left: 18,
                      //           child: Text(
                      //             "3",
                      //             style: GoogleFonts.roboto(
                      //               color: Color(0xff1E7757),
                      //               fontSize: 20.0,
                      //               // letterSpacing: -1.5,
                      //               fontWeight: FontWeight.w800,
                      //               // height: 23.44,
                      //             ),
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      //   Container(
                      //     // height: 42,
                      //     // width: 42,
                      //     height: 50,
                      //     width: 50,
                      //     // margin: EdgeInsets.all(10),
                      //     alignment: Alignment.center,
                      //     decoration: const BoxDecoration(
                      //       image: DecorationImage(
                      //         alignment: Alignment.center,
                      //         image: ExactAssetImage(
                      //           "assets/images/Ellipse 8.png",
                      //           // scale: 10,
                      //           // scale: 2
                      //         ),
                      //         // fit: BoxFit.fill,
                      //         // fit: BoxFit.cover,
                      //       ),
                      //     ),
                      //     // child: Image.asset(
                      //     //   "assets/images/Vector 1.png",
                      //     //   fit: BoxFit.fill,
                      //     //   // height: 30,
                      //     //   // width: 30,
                      //     //   scale: 0.5,
                      //     // ),
                      //     child: Stack(
                      //       children: [
                      //         Positioned(
                      //           top: 10,
                      //           left: 18,
                      //           child: Text(
                      //             "4",
                      //             style: GoogleFonts.roboto(
                      //               color: Color(0xff1E7757),
                      //               fontSize: 20.0,
                      //               // letterSpacing: -1.5,
                      //               fontWeight: FontWeight.w800,
                      //               // height: 23.44,
                      //             ),
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ],

                      /*children: //List.generate(4, (index) {
                      // List.generate(3, (index) {
                      List.generate(2, (index) {

                        return InkWell(
                          onTap: () async {

                            // await mAudio.pauseMusic().then((value) async {

                            *//*(!user["sound"])? null :
                            await Sounds.buttonClick;*//*
                            if((user["daily_challange"] as int) < 3){
                              //random puzzle
                              Random random = Random(3);

                              // const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
                              const _chars = '1234567890';
                              // late String res = List.generate(3, (index) => _chars[random.nextInt(_chars.length)]).join();
                              final v_ = random.nextInt(_chars.length);
                              late String res = List.generate(3, (index) => _chars[v_]).join();

                              print("res ?? $res");

                              int lastPuzzle = 0;
                              // String mode = widget.mode.toLowerCase();
                              late String mode = index==0?"Easy":"Medium";
                              switch(mode.toLowerCase()){
                                case 'easy':
                                  lastPuzzle = 146;
                                  break;
                                case 'medium':
                                  lastPuzzle = 400;
                                  break;
                                case 'hard':
                                  lastPuzzle = 36;
                                  break;
                                case 'impossible':
                                  lastPuzzle = 98;
                                  break;
                              }

                              // if(int.parse(res)>366){
                              // if(int.parse(res)>142){
                              // if(int.parse(res)>=126){
                              if(int.parse(res)>=lastPuzzle){
                                // res = List.generate(2, (index) => _chars[random.nextInt(_chars.length)]).join();
                                final v_ = random.nextInt(_chars.length);
                                res = List.generate(3, (index) => _chars[v_]).join();
                              }

                              print("res ?? $res");

                              final String level = res;//""
                              // const String mode = "Hard";//Easy, Medium, Hard
                              // const String mode = "Medium";
                              // late String mode = index==0?"Easy":"Medium";
                              print('index $index');
                              print('result $level $mode');

                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    // builder: (context)=> SecondPage(payload: payload ?? "",),
                                    // builder: (context)=> Screen4(level: level, mode: mode, user: user, isDailyChallenge: true, mAudio: mAudio,),
                                    builder: (context)=> Screen4(level: level, mode: mode, user: user, isDailyChallenge: true,),
                                  )
                              );
                            }

                            // });

                          },
                          child: Container(
                            // height: 50,
                            // width: 50,
                            // width: 42 / mockupWidth * width,
                            // height: 42 / mockupHeight * height,
                            width: 42 / mockupWidth * width,
                            height: 42 / mockupWidth * width,
                            // margin: EdgeInsets.only(bottom: 79 / mockupHeight * height, left: 38 / mockupWidth * width),
                            // margin: EdgeInsets.only(bottom: 79 / mockupHeight * height, left: 25 / mockupWidth * width),
                            margin: EdgeInsets.only(bottom: 79 / mockupHeight * height, left: (index==0?38:25) / mockupWidth * width),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              // image: DecorationImage(
                              //   alignment: Alignment.center,
                              //   image: ExactAssetImage(
                              //     // index<(user["daily_challange"] as int)
                              //     index<(user["daily_challange"] as int)
                              //     // (index<2)
                              //     // true
                              //         ?"assets/images/Ellipse 5.png":
                              //     "assets/images/Ellipse 8.png",
                              //     //scale: 4 * scale,
                              //     // scale: 0.5,
                              //   ),
                              // ),
                              color: index<(user["daily_challange"] as int)?Color(0xff1E7757):Color(0xffffffff),
                              borderRadius: BorderRadius.all(Radius.circular(60)),
                            ),
                            // child: Stack(
                            //   children: [
                            //     Positioned(
                            //       // top: 10,
                            //       // left: 18,
                            //       // left: 18,
                            //       // top: 15,
                            //       // left: 15,
                            //       // top: index<(user["daily_challange"] as int)?15:10,
                            //       // right: index<(user["daily_challange"] as int)?18:20,
                            //       child:
                            //       // true?
                            //       index<(user["daily_challange"] as int)?
                            //       Image.asset("assets/images/Vector.png",
                            //         // scale: 4 * scale,
                            //         scale: scale,
                            //       )
                            //           :
                            //       Text(
                            //         "${index+1}",
                            //         style: GoogleFonts.roboto(
                            //           color: Color(0xff1E7757),
                            //           fontSize: 20.0 / mockupWidth * width,
                            //           fontWeight: FontWeight.w800,
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            child: index<(user["daily_challange"] as int)?
                            Image.asset("assets/images/Vector.png",
                              // scale: 4 * scale,
                              scale: initScale * scale,
                              // scale: scale,
                            )
                                :
                            Text(
                              "${index+1}",
                              style: GoogleFonts.roboto(
                                color: Color(0xff1E7757),
                                fontSize: 20.0 / mockupWidth * width,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        );
                      }),*/

                      children: [
                        InkWell(
                          onTap: () async {

                            // await mAudio.pauseMusic().then((value) async {

                            /*(!user["sound"])? null :
                            await Sounds.buttonClick;*/
                            if((user["daily_challange"] as int) < 3){
                              /*//random puzzle
                              // Random random = Random(3);
                              //
                              // // const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
                              // const _chars = '1234567890';
                              // // late String res = List.generate(3, (index) => _chars[random.nextInt(_chars.length)]).join();
                              // final v_ = random.nextInt(_chars.length);
                              // late String res = List.generate(3, (index) => _chars[v_]).join();*/



                              int lastPuzzle = 0;
                              // String mode = widget.mode.toLowerCase();
                              // late String mode = index==0?"Easy":"Medium";
                              // late String mode = 0==0?"Easy":"Medium";
                              late String mode = true?"Easy":"Medium";
                              switch(mode.toLowerCase()){
                                case 'easy':
                                  lastPuzzle = 146;
                                  break;
                                case 'medium':
                                  lastPuzzle = 400;
                                  break;
                                // case 'hard':
                                //   lastPuzzle = 36;
                                //   break;
                                // case 'impossible':
                                //   lastPuzzle = 98;
                                //   break;
                              }

                              /*if(int.parse(res)>=lastPuzzle){
                                // res = List.generate(2, (index) => _chars[random.nextInt(_chars.length)]).join();
                                final v_ = random.nextInt(_chars.length);
                                res = List.generate(3, (index) => _chars[v_]).join();
                              }

                              print("res ?? $res");*/

                              Random random = Random();
                              final v_ = random.nextInt(lastPuzzle);
                              // late String res = "$v_";
                              late String res = v_==0?"1":"$v_";
                              print("res ?? $res");

                              final String level = res;//""
                              // const String mode = "Hard";//Easy, Medium, Hard
                              // const String mode = "Medium";
                              // late String mode = index==0?"Easy":"Medium";
                              print('index ${0}');
                              print('result $level $mode');

                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    // builder: (context)=> SecondPage(payload: payload ?? "",),
                                    // builder: (context)=> Screen4(level: level, mode: mode, user: user, isDailyChallenge: true, mAudio: mAudio,),
                                    builder: (context)=> Screen4(level: level, mode: mode, user: user, isDailyChallenge: true,),
                                  )
                              );
                            }

                            // });

                          },
                          child: Container(
                            width: 42 / mockupWidth * width,
                            height: 42 / mockupWidth * width,
                            margin: EdgeInsets.only(bottom: 79 / mockupHeight * height, left: (0==0?38:25) / mockupWidth * width),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: 0<(user["daily_challange"] as int)?Color(0xff1E7757):Color(0xffffffff),
                              borderRadius: BorderRadius.all(Radius.circular(60)),
                            ),
                            child: 0<(user["daily_challange"] as int)?
                            Image.asset("assets/images/Vector.png",
                              // scale: 4 * scale,
                              scale: initScale * scale,
                              // scale: scale,
                            )
                                :
                            Text(
                              "${0+1}",
                              style: GoogleFonts.roboto(
                                color: Color(0xff1E7757),
                                fontSize: 20.0 / mockupWidth * width,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {

                            // await mAudio.pauseMusic().then((value) async {

                            /*(!user["sound"])? null :
                            await Sounds.buttonClick;*/
                            if((user["daily_challange"] as int) < 3){
                              /*//random puzzle
                              Random random = Random(3);

                              // const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
                              const _chars = '1234567890';
                              // late String res = List.generate(3, (index) => _chars[random.nextInt(_chars.length)]).join();
                              final v_ = random.nextInt(_chars.length);
                              late String res = List.generate(3, (index) => _chars[v_]).join();

                              print("res ?? $res");*/

                              int lastPuzzle = 0;
                              // String mode = widget.mode.toLowerCase();
                              // late String mode = index==0?"Easy":"Medium";
                              //late String mode = 1==0?"Easy":"Medium";
                              late String mode = false?"Easy":"Medium";
                              switch(mode.toLowerCase()){
                                case 'easy':
                                  lastPuzzle = 146;
                                  break;
                                case 'medium':
                                  lastPuzzle = 400;
                                  break;
                                // case 'hard':
                                //   lastPuzzle = 36;
                                //   break;
                                // case 'impossible':
                                //   lastPuzzle = 98;
                                //   break;
                              }

                              /*if(int.parse(res)>=lastPuzzle){
                                // res = List.generate(2, (index) => _chars[random.nextInt(_chars.length)]).join();
                                final v_ = random.nextInt(_chars.length);
                                res = List.generate(3, (index) => _chars[v_]).join();
                              }*/

                              Random random = Random();
                              final v_ = random.nextInt(lastPuzzle);
                              late String res = "$v_";

                              print("res ?? $res");

                              final String level = res;//""
                              // const String mode = "Hard";//Easy, Medium, Hard
                              // const String mode = "Medium";
                              // late String mode = index==0?"Easy":"Medium";
                              print('index ${1}');
                              print('result $level $mode');

                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                     // builder: (context)=> SecondPage(payload: payload ?? "",),
                                    // builder: (context)=> Screen4(level: level, mode: mode, user: user, isDailyChallenge: true, mAudio: mAudio,),
                                    builder: (context)=> Screen4(level: level, mode: mode, user: user, isDailyChallenge: true,),
                                  )
                              );
                            }

                            // });

                          },
                          child: Container(
                            width: 42 / mockupWidth * width,
                            height: 42 / mockupWidth * width,
                            margin: EdgeInsets.only(bottom: 79 / mockupHeight * height, left: (1==0?38:25) / mockupWidth * width),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: 1<(user["daily_challange"] as int)?Color(0xff1E7757):Color(0xffffffff),
                              borderRadius: BorderRadius.all(Radius.circular(60)),
                            ),
                            child: 1<(user["daily_challange"] as int)?
                            Image.asset("assets/images/Vector.png",
                              // scale: 4 * scale,
                              scale: initScale * scale,
                              // scale: scale,
                            )
                                :
                            Text(
                              "${1+1}",
                              style: GoogleFonts.roboto(
                                color: Color(0xff1E7757),
                                fontSize: 20.0 / mockupWidth * width,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      ],

                    ),
                  ),
                ),
                // ),
              ),

              // showProgress?
              Container(
                // width: width,
                // height: height,
                alignment: Alignment.center,
                child: showProgress?
                // child: true?

                // child:

                Container(
                  // width: 50,
                  // height: 50,
                  // alignment: Alignment.center,
                  //   child: const CircularProgressIndicator(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    )
                )
                    : Container(),
              ),
              // : Container(),

            ],
          ),
        );
      },
    );
  //,
  // );
  //,

  // adProvider.isBannerLoaded?
  // Container(
  //   height: adProvider.bannerAd.size.height.toDouble(),
  //   child: AdWidget(
  //     ad: adProvider.bannerAd,
  //   ),
  // ):Container(height: 0,),


  //],
  //);
}
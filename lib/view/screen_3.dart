import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import 'package:f2f_puzzlegame/view/screen_2.dart';
// import 'package:f2f_puzzlegame/view/screen_4.dart';
import '../view/screen_4.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:pixel_perfect/pixel_perfect.dart';

// import '../model/constants.dart';
// import '../model/constants.dart';
import '../model/page_route.dart';
import 'auth_screen.dart';
import 'background_theme.dart';

class Screen3 extends StatefulWidget {
  const Screen3({Key? key,
    required this.user,
    // required this.mAudio,
    this.isClosed = false,
  }) : super(key: key);

  final DocumentSnapshot user;
  // final MAudio mAudio;
  final bool isClosed;

  @override
  State<Screen3> createState() => _Screen3State();
}

// class _Screen3State extends State<Screen3> {
class _Screen3State extends State<Screen3> with WidgetsBindingObserver{

  // late AdProvider adProvider;
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //
  //   adProvider = AdProvider();
  //   adProvider.initializeBanner();
  //   adProvider.initializeInterstitial();
  //   adProvider.initializeRewarded();
  //   Future.delayed(Duration(seconds: 3),(){
  //     setState(() {
  //       adProvider;
  //     });
  //   });
  //
  // }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement LifeCycle Change
    super.didChangeAppLifecycleState(state);

    if(state == AppLifecycleState.inactive
        || state == AppLifecycleState.detached) return;

    final isBackground = state == AppLifecycleState.paused;

    if(isBackground){
      print('App in Background!');

      /*print('isPlaying $isPlaying');

      // if(isPlaying){
      widget.mAudio.pauseMusic();
      //   setState(() {
      //     isPlaying = false;
      //   });
      //   print('isPlaying $isPlaying');
      // }

      // if(mAudio!=null && user!=null){
      //   // if(!isMusic){
      //   if(!user!["music"]){
      //     mAudio.pauseMusic();
      //   }else{
      //     mAudio.pauseMusic();
      //     // mAudio.playLoopMusic();
      //   }
      // }*/
    } else {

      print('App in Foreground!');

      /*print('isPlaying $isPlaying');

      // if(!isPlaying){
      if(isPlaying){
        widget.mAudio.playLoopMusic();
        // setState(() {
        //   isPlaying = true;
        // });
        // print('isPlaying $isPlaying');
      }


      // if(mAudio!=null && user!=null){
      //   // if(!isMusic){
      //   if(!user!["music"]){
      //     mAudio.pauseMusic();
      //   }else{
      //     mAudio.pauseMusic();
      //     mAudio.playLoopMusic();
      //   }
      // }*/
    }

    // // These are the callbacks
    // switch (state) {
    //   case AppLifecycleState.resumed:
    //   // widget is resumed
    //     break;
    //   case AppLifecycleState.inactive:
    //   // widget is inactive
    //     break;
    //   case AppLifecycleState.paused:
    //   // widget is paused
    //     break;
    //   case AppLifecycleState.detached:
    //   // widget is detached
    //     break;
    // }
  }


  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   // TODO: implement LifeCycle Change
  //   super.didChangeAppLifecycleState(state);
  //
  //   // These are the callbacks
  //   switch (state) {
  //     case AppLifecycleState.resumed:
  //     // widget is resumed
  //       break;
  //     case AppLifecycleState.inactive:
  //     // widget is inactive
  //       break;
  //     case AppLifecycleState.paused:
  //     // widget is paused
  //       break;
  //     case AppLifecycleState.detached:
  //     // widget is detached
  //       break;
  //   }
  // }

  // late bool isPlaying = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    print('initial state.....');

    /*if(widget.mAudio!=null && widget.user!=null){
      if(!widget.user["music"]){
        if(isPlaying){
          widget.mAudio.pauseMusic();
          isPlaying = false;
        }
      }else{
        if(!isPlaying){
          widget.mAudio.playLoopMusic();
          isPlaying = true;
        }
      }
    }*/


    // //crashlytics check
    // // throw const FormatException("error");
    // FirebaseCrashlytics.instance.crash();
    // //SystemNavigator.pop();
    // // exit(0);
    // // throw(Exception('Hello Crashlytics'));
    // // return;

  }

  // @override
  // void didChangeDependencies() {
  //   // TODO: implement didChangeDependencies
  //   super.didChangeDependencies();
  //   print('dependencies changed.....');
  // }
  //
  // @override
  // void deactivate() {
  //   // TODO: implement deactivate
  //   print('deactivated.....');
  //   super.deactivate();
  // }
  //
  // @override
  // void setState(VoidCallback fn) {
  //   // TODO: implement setState
  //   print('setting state.....');
  //   super.setState(fn);
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    print('screen3');
    print('disposed.....');
    super.dispose();

    /*try {
      // loadingAudio.dispose();
      widget.mAudio.dispose();
    }catch(e){
      print('audio dispose err');
    }*/

    WidgetsBinding.instance!.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {

    Size display = MediaQuery.of(context).size;
    double width = display.width;
    double height = display.height;

    const mockupWidth = 390;
    const mockupHeight = 844;

    final scale = mockupWidth / width;
    // final divide = mockupWidth * width;

    final bool isTablat = width>500 && height>800?true:false;

    return
      // PixelPerfect(
      // scale: 4 * scale,
      // assetPath: "assets/images/13 Pro - 7.png",
      // child:
      WillPopScope(
        onWillPop: () async {

          // Navigator.of(context).pushReplacement(
          //   NavigateWithOpaque(
          //     // child: Screen2(),
          //     child: Screen2(user: widget.user,),
          //     // duration: 200,
          //     direction: AxisDirection.left,
          //   ),
          // );

          // await widget.mAudio.pauseMusic();
          // try{
          //   if(widget.mAudio!=null) await widget.mAudio.pauseMusic();
          // }catch(e){}

          /*(!widget.user["sound"])? null :
          Sounds.buttonClick;*/
          Navigator.of(context).pop();

          // widget.user["login_mode"]=="Guest"?
          // // Navigator.of(context).pushReplacement(
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //       builder: (context) => Screen2(user: widget.user,)
          //   ),
          // ):

          Navigator.push(context,
          // Navigator.pushReplacement(context,
            NavigateWithOpaque(
              //child: AuthScreen(start: false, isGuestMode: widget.user["login_mode"]=="Guest"?true:false),
              // child: AuthScreen(start: false, isGuestMode: widget.user["login_mode"]=="Guest"?true:false, mAudio: widget.mAudio,),//err
              // child: AuthScreen(start: false, isGuestMode: widget.user["login_mode"]=="Guest"?true:false, mAudio: null,),
              // child: AuthScreen(start: false, isGuestMode: widget.user["login_mode"]=="Guest"?true:false, isPlaying: widget.user["music"],),
              child: AuthScreen(start: false, isGuestMode: widget.user["login_mode"]=="Guest"?true:false,),
              direction: AxisDirection.down,
            ),
          );

          // Navigator.push(context,
          // // Navigator.pushReplacement(context,
          //   NavigateWithOpaque(
          //     //child: AuthScreen(start: false, isGuestMode: widget.user["login_mode"]=="Guest"?true:false),
          //     // child: AuthScreen(start: false, isGuestMode: widget.user["login_mode"]=="Guest"?true:false, mAudio: widget.mAudio,),//err
          //     child: AuthScreen(start: false, isGuestMode: widget.user["login_mode"]=="Guest"?true:false, mAudio: null,),
          //     direction: AxisDirection.down,
          //   ),
          // );

          // Navigator.pop(context);

          // return true;
          return false;
        },
        child: Scaffold(
          body: Container(
            width: display.width,
            height: display.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage(
                  "assets/images/background.png",
                ),
                // fit: BoxFit.fill,
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [

                /*
                //clouds
                Clouds(display: display),

                //tree
                Tree(display: display),

                //branch
                Branch(display),

                //left root
                LeftRoot(),

                //grass
                Grass(display: display),

                //right root
                RightRoot(),
                */

                backGround(display),


                Positioned(
                  // top: display.height*(45/700),
                  // left: 0,
                  // top: 45 / mockupHeight * height,
                  /*top: (45*scale) / mockupHeight * height,*/
                  top: (isTablat?45:45*scale) / mockupHeight * height,
                  // left: 0,
                  child: Container(
                    // height: 209.34,
                    // width: 372,
                    // width: display.width*0.87,
                    // width: display.width*0.90,

                    width: display.width,
                    // height: 60 / mockupHeight * height,
                    /*height: (60*scale) / mockupHeight * height,*/
                    height: (isTablat?60:60*scale) / mockupHeight * height,

                    // width: MediaQuery.of(context).size.width,
                    color: Color(0xffffffff),
                    // height: 70,

                    // width: 73,
                    // width: display.width*(73/350),
                    alignment: Alignment.bottomCenter,
                    // child: Image.asset(
                    //   "assets/images/Rectangle 15.png",
                    //   fit: BoxFit.fitWidth,
                    // ),
                  ),
                ),
                /**/
                Positioned(
                  // top: display.height*(45/700),
                  // top:  45 / mockupHeight * height,
                  /*top:  (45*scale) / mockupHeight * height,*/
                  top:  (isTablat?45:45*scale) / mockupHeight * height,
                  child: Container(
                    // height: 209.34,
                    // width: 372,
                    // width: display.width*0.87,
                    // width: display.width*0.90,

                    width: display.width,
                    // height: 60 / mockupHeight * height,
                    /*height: (60*scale) / mockupHeight * height,*/
                    height: (isTablat?60:60*scale) / mockupHeight * height,

                    // width: MediaQuery.of(context).size.width,
                    // color: Color(0xffffffff),
                    // height: 70,

                    // height: 60 / mockupWidth * width,
                    color: Colors.transparent,
                    // width: 73,
                    // width: display.width*(73/350),
                    alignment: Alignment.center,
                    // child: Image.asset(
                    //   "assets/images/Rectangle 15.png",
                    //   fit: BoxFit.fitWidth,
                    // ),
                    child: Center(
                      child: Text(
                        "Select Level",
                        style: GoogleFonts.roboto(
                          color: Color(0xff459F67),
                          // fontSize: 20.0,
                          fontSize: 20.0 / mockupWidth * width,
                          // letterSpacing: -1.5,
                          fontWeight: FontWeight.w700,
                          // height: 23.44,
                        ),
                      ),
                    ),
                  ),
                ),

                //back
                Positioned(
                  // top: display.height*(30/700),
                  // top: display.height*(30/580),
                  // left: display.width*(20/980),
                  // top: 45 / mockupHeight * height,
                  // top: 45 / mockupWidth * width,
                  // top:  38 / mockupHeight * height,
                  // left: 29 / mockupWidth * width,
                  top:  (38*scale) / mockupHeight * height,
                  left: (29*scale) / mockupWidth * width,
                  /*top:  (isTablat?38:38*scale) / mockupHeight * height,
                  left: (isTablat?29:29*scale) / mockupWidth * width,*/
                  child: Container(
                    // height: 209.34,
                    // width: 372,
                    // width: display.width*0.87,
                    // width: display.width*0.90,
                    // width: display.width*0.93,
                    // width: 73,
                    // width: display.width*(73/350),
                    // alignment: Alignment.bottomCenter,
                    // child: GestureDetector( //navigation problem
                    child: InkWell(
                      onTap: () async {

                        // Navigator.of(context).pop();
                        // Navigator.push(context,
                        //
                        //   NavigateWithOpaque(
                        //     child: AuthScreen(),
                        //     direction: AxisDirection.down,
                        //   ),
                        // );

                        // try{
                        //   if(widget.mAudio!=null) await widget.mAudio.pauseMusic();
                        // }catch(e){}
                        // await mAudio.pauseMusic().then((value) {
                        //   await methods.playSound(file: "soundscrate-graphics-game-blip-2");

                        /*(!widget.user["sound"])? null :
                        Sounds.buttonClick;*/

                        Navigator.of(context).pop();

                          // widget.user["login_mode"]=="Guest"?
                          // // Navigator.of(context).pushReplacement(
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //       builder: (context) => Screen2(user: widget.user,)
                          //   ),
                          // ):

                          widget.isClosed?
                          // Navigator.push(context,//guest
                          Navigator.pushReplacement(context, //login
                            NavigateWithOpaque(
                              // child: AuthScreen(start: false,),
                              // child: AuthScreen(start: false, isGuestMode: widget.user["login_mode"]=="Guest"?true:false),
                              // child: AuthScreen(start: false, isGuestMode: widget.user["login_mode"]=="Guest"?true:false, mAudio: widget.mAudio,),
                              // child: AuthScreen(start: false, isGuestMode: widget.user["login_mode"]=="Guest"?true:false, mAudio: null,),
                              // child: AuthScreen(start: false, isGuestMode: widget.user["login_mode"]=="Guest"?true:false, isPlaying: widget.user["music"],),
                              child: AuthScreen(start: false, isGuestMode: widget.user["login_mode"]=="Guest"?true:false,),
                              direction: AxisDirection.down,
                            ),
                          )
                          :
                          Navigator.push(context,
                            NavigateWithOpaque(
                              // child: AuthScreen(start: false,),
                              //child: AuthScreen(start: false, isGuestMode: widget.user["login_mode"]=="Guest"?true:false),
                              //child: AuthScreen(start: false, isGuestMode: widget.user["login_mode"]=="Guest"?true:false, mAudio: widget.mAudio,),
                              // child: AuthScreen(start: false, isGuestMode: widget.user["login_mode"]=="Guest"?true:false, mAudio: null,),
                              // child: AuthScreen(start: false, isGuestMode: widget.user["login_mode"]=="Guest"?true:false, isPlaying: widget.user["music"],),
                              child: AuthScreen(start: false, isGuestMode: widget.user["login_mode"]=="Guest"?true:false,),
                              direction: AxisDirection.down,
                            ),
                          );
                        // });

                      },
                      child: Image.asset(
                        "assets/images/back.png",
                        fit: BoxFit.fill,
                        scale: 4 * scale,
                      ),
                    ),
                  ),
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //easy
                    // Positioned(
                    //   // top: 482,
                    //   top: display.height*(197/840),
                    //   left: display.width*(110.83/370),
                    //   // left: (display.width/2)-(197/2),
                    //   child: Container(
                    //     // height: 209.34,
                    //     // width: 372,
                    //     // width: display.width*0.87,
                    //     // width: display.width*0.90,
                    //     // width: display.width*0.93,
                    //     // width: 73,
                    //     // width: display.width*(73/350),
                    //     // height: 80.49,
                    //     // width: 168.36,
                    //     alignment: Alignment.bottomCenter,
                    //     child: GestureDetector(
                    //       onTap: (){
                    //         Navigator.of(context).push(
                    //           MaterialPageRoute(
                    //               builder: (context) => Screen4(level: "Easy")
                    //           ),
                    //         );
                    //       },
                    //       child: Image.asset(
                    //         "assets/images/Group 29.png",
                    //         fit: BoxFit.fill,
                    //         scale: 5,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Container(
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
                          //       // builder: (context) => Screen4(level: "Easy")
                          //       // builder: (context) => Screen4(mode: "Easy", level: '${1}', user: widget.user,)
                          //       builder: (context) => Screen4(mode: "Easy", level: '${widget.user["level"]["easy"]}', user: widget.user,)
                          //   ),
                          // );

                          //await methods.playSound(file: "soundscrate-graphics-game-blip-2")
                          //    .then((value) {
                          // Navigator.of(context).push(
                          //   Navigator.of(context).pushReplacement(
                          //     MaterialPageRoute(
                          //         builder: (context) => Screen4(mode: "Easy", level: '${widget.user["level"]["easy"]}', user: widget.user,)
                          //     ),
                          //   );
                          //});

                          /*(!widget.user["sound"])? null :
                            Sounds.buttonClick;*/


                          /*// Navigator.of(context).pushReplacement(
                          Navigator.of(context).push(
                              NavigateWithOpaque(
                                // child: Screen4(mode: "Easy", level: '${widget.user["level"]["easy"]}', user: widget.user, mAudio: widget.mAudio,),
                                child: Screen4(mode: "Easy", level: '${widget.user["level"]["easy"]}', user: widget.user,),
                                // child: Screen4(mode: "Easy", level: '${widget.user["level"]["easy"]}',),
                                // duration: 200,
                                direction: AxisDirection.left,
                              ),
                            );*/


                          int lastPuzzle = 0;
                          late String mode = "Easy";
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

                          Random random = Random();
                          final v_ = random.nextInt(lastPuzzle);
                          // late String res = "$v_";
                          late String res = v_==0?"1":"$v_";

                          // res = "1"; //added
                          // res = "8";
                          /// 1,6,8,9,12,17,33,38,47,59,63,68,71,77,90,92,93,102,106,109,110,114,120,124,125,141
                          // res = "141";

                          print("res ?? $res");

                          // Database.setPuzzleTo(widget.user["id"]);

                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                          // Navigator.of(context).pushReplacement(
                            NavigateWithOpaque(
                              // child: Screen4(mode: "Easy", level: '${widget.user["level"]["easy"]}', user: widget.user,),
                              child: Screen4(mode: mode, level: res, user: widget.user,),
                              // child: Screen4(mode: mode, level: '${widget.user["level"][mode.toLowerCase()]}', user: widget.user,),
                              direction: AxisDirection.left,
                            ),
                          );


                          // if(adProvider.isRewardedLoaded){
                          //   adProvider.rewardedAd.show(
                          //       onUserEarnedReward: (view, reward){
                          //         print('reward.amount ${reward.amount}');
                          //         //10
                          //
                          //         // Navigator.of(context).pushReplacement(
                          //         //   NavigateWithOpaque(
                          //         //     child: Screen3(user: user!,),
                          //         //     // duration: 200,
                          //         //     direction: AxisDirection.left,
                          //         //   ),
                          //         // );
                          //
                          //         Navigator.of(context).push(
                          //           MaterialPageRoute(
                          //             // builder: (context) => Screen4(level: "Easy")
                          //             // builder: (context) => Screen4(mode: "Easy", level: '${1}', user: widget.user,)
                          //               builder: (context) => Screen4(mode: "Easy", level: '${widget.user["level"]["easy"]}', user: widget.user,)
                          //           ),
                          //         );
                          //
                          //       }
                          //   );
                          // }


                        },
                        child: Image.asset(
                          "assets/images/Group 29.png",
                          fit: BoxFit.fill,
                          // scale: 5,
                          scale: 4 * scale,
                        ),
                      ),
                    ),
                    /*SizedBox(height: 39 / mockupHeight * height,),*/
                    SizedBox(height: isTablat?39:39 / mockupHeight * height,),

                    //medium
                    // Positioned(
                    //   // top: 482,
                    //   top: display.height*(304/840),
                    //   left: display.width*(110.83/370),
                    //   // left: (display.width/2)-(197/2),
                    //   child: Container(
                    //     // height: 209.34,
                    //     // width: 372,
                    //     // width: display.width*0.87,
                    //     // width: display.width*0.90,
                    //     // width: display.width*0.93,
                    //     // width: 73,
                    //     // width: display.width*(73/350),
                    //     // height: 80.49,
                    //     // width: 168.36,
                    //     alignment: Alignment.bottomCenter,
                    //     child: GestureDetector(
                    //       onTap: (){
                    //         Navigator.of(context).push(
                    //           MaterialPageRoute(
                    //               builder: (context) => Screen4(level: "Medium")
                    //           ),
                    //         );
                    //       },
                    //       child: Image.asset(
                    //         "assets/images/Group 30.png",
                    //         fit: BoxFit.fill,
                    //         scale: 5,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Container(
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
                        onTap: ()async{
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //       // builder: (context) => Screen4(level: "Medium")
                          //       // builder: (context) => Screen4(mode: "Medium", level: '${1}', user: widget.user,)
                          //       builder: (context) => Screen4(mode: "Medium", level: '${widget.user["level"]["medium"]}', user: widget.user,)
                          //   ),
                          // );

                          // await methods.playSound(file: "soundscrate-graphics-game-blip-2")
                          //     .then((value) {
                          //   // Navigator.of(context).push(
                          //   Navigator.of(context).pushReplacement(
                          //     MaterialPageRoute(
                          //         builder: (context) => Screen4(mode: "Medium", level: '${widget.user["level"]["medium"]}', user: widget.user,)
                          //     ),
                          //   );
                          // });


                          /*(!widget.user["sound"])? null :
                          Sounds.buttonClick;*/

                          /*// Navigator.of(context).pushReplacement(
                          Navigator.of(context).push(
                            NavigateWithOpaque(
                              // child: Screen4(mode: "Medium", level: '${widget.user["level"]["medium"]}', user: widget.user, mAudio: widget.mAudio,),
                              child: Screen4(mode: "Medium", level: '${widget.user["level"]["medium"]}', user: widget.user,),
                              // duration: 200,
                              direction: AxisDirection.left,
                            ),
                          );*/

                          int lastPuzzle = 0;
                          late String mode = "Medium";
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

                          Random random = Random();
                          final v_ = random.nextInt(lastPuzzle);
                          // late String res = "$v_";
                          late String res = v_==0?"1":"$v_";

                          // res = "1"; //added
                          /// 2,5,6,7,10,13,16,20,26,34,52,59,65,67,68,72,74,86,88,91,93,95,101,105,110,115,119,123,125,134,135,137,138,140,147,149,152,154,163,164,167,169,174,175,179,182,187,189,192,194,200,202,205,207,209,219,223,229,238,243,244,246,252,264,271,276,277,278,279,280,285,290,294,295,297,300,301,305,307,308,314,324,328,339,341,347,348,349,350,352,356,357,358,380,388,389,392,393
                          // res = "68";

                          print("res ?? $res");

                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                          // Navigator.of(context).pushReplacement(
                            NavigateWithOpaque(
                              child: Screen4(mode: mode, level: res, user: widget.user,),
                              // child: Screen4(mode: mode, level: '${widget.user["level"][mode.toLowerCase()]}', user: widget.user,),
                              direction: AxisDirection.left,
                            ),
                          );


                          // if(adProvider.isRewardedLoaded){
                          //   adProvider.rewardedAd.show(
                          //       onUserEarnedReward: (view, reward){
                          //         print('reward.amount ${reward.amount}');
                          //         //10
                          //
                          //         // Navigator.of(context).pushReplacement(
                          //         //   NavigateWithOpaque(
                          //         //     child: Screen3(user: user!,),
                          //         //     // duration: 200,
                          //         //     direction: AxisDirection.left,
                          //         //   ),
                          //         // );
                          //
                          //         Navigator.of(context).push(
                          //           MaterialPageRoute(
                          //             // builder: (context) => Screen4(level: "Medium")
                          //             // builder: (context) => Screen4(mode: "Medium", level: '${1}', user: widget.user,)
                          //               builder: (context) => Screen4(mode: "Medium", level: '${widget.user["level"]["medium"]}', user: widget.user,)
                          //           ),
                          //         );
                          //
                          //       }
                          //   );
                          // }

                        },
                        child: Image.asset(
                          "assets/images/Group 30.png",
                          fit: BoxFit.fill,
                          // scale: 5,
                          scale: 4 * scale,
                        ),
                      ),
                    ),

                    // SizedBox(height: 30,),
                    /*SizedBox(height: 39 / mockupHeight * height,),*/
                    SizedBox(height: isTablat?39:39 / mockupHeight * height,),

                    //hard
                    // Positioned(
                    //   // top: 482,
                    //   top: display.height*(411/840),
                    //   left: display.width*(110.83/370),
                    //   child: Container(
                    //     // height: 209.34,
                    //     // width: 372,
                    //     // width: display.width*0.87,
                    //     // width: display.width*0.90,
                    //     // width: display.width*0.93,
                    //     // width: 73,
                    //     // width: display.width*(73/350),
                    //     // height: 80.49,
                    //     // width: 168.36,
                    //     alignment: Alignment.bottomCenter,
                    //     child: GestureDetector(
                    //       onTap: (){
                    //         Navigator.of(context).push(
                    //           MaterialPageRoute(
                    //               builder: (context) => Screen4(level: "Hard")
                    //           ),
                    //         );
                    //       },
                    //       child: Image.asset(
                    //         "assets/images/Group 31.png",
                    //         fit: BoxFit.fill,
                    //         scale: 5,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Container(
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
                        onTap: ()async{
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //       // builder: (context) => Screen4(level: "Hard")
                          //       // builder: (context) => Screen4(mode: "Hard", level: '${1}', user: widget.user,)
                          //       builder: (context) => Screen4(mode: "Hard", level: '${widget.user["level"]["hard"]}', user: widget.user,)
                          //   ),
                          // );

                          // await methods.playSound(file: "soundscrate-graphics-game-blip-2")
                          //     .then((value) {
                          //   // Navigator.of(context).push(
                          //   Navigator.of(context).pushReplacement(
                          //     MaterialPageRoute(
                          //         builder: (context) => Screen4(mode: "Hard", level: '${widget.user["level"]["hard"]}', user: widget.user,)
                          //     ),
                          //   );
                          // });

                          /*(!widget.user["sound"])? null :
                          Sounds.buttonClick;*/

                          /*// Navigator.of(context).pushReplacement(
                          Navigator.of(context).push(
                            NavigateWithOpaque(
                              // child: Screen4(mode: "Hard", level: '${widget.user["level"]["hard"]}', user: widget.user, mAudio: widget.mAudio,),
                              child: Screen4(mode: "Hard", level: '${widget.user["level"]["hard"]}', user: widget.user),
                              // duration: 200,
                              direction: AxisDirection.left,
                            ),
                          );*/

                          int lastPuzzle = 0;
                          late String mode = "Hard";
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

                          Random random = Random();
                          final v_ = random.nextInt(lastPuzzle);
                          // late String res = "$v_";
                          late String res = v_==0?"1":"$v_";

                          // res = "1"; //added
                          /// 3,4,16,19,22,28,32,33,35,36
                          // res = "36";

                          print("res ?? $res");

                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                          // Navigator.of(context).pushReplacement(
                            NavigateWithOpaque(
                              child: Screen4(mode: mode, level: res, user: widget.user,),
                              // child: Screen4(mode: mode, level: '${widget.user["level"][mode.toLowerCase()]}', user: widget.user,),
                              direction: AxisDirection.left,
                            ),
                          );

                        },
                        child: Image.asset(
                          "assets/images/Group 31.png",
                          fit: BoxFit.fill,
                          // scale: 5,
                          scale: 4 * scale,
                        ),
                      ),
                    ),
                    // SizedBox(height: 30,),
                    /*SizedBox(height: 39 / mockupHeight * height,),*/
                    SizedBox(height: isTablat?39:39 / mockupHeight * height,),

                    //impossible
                    // Positioned(
                    //   // top: 482,
                    //   top: display.height*(518/840),
                    //   left: display.width*(110.83/370),
                    //   child: Container(
                    //     // height: 209.34,
                    //     // width: 372,
                    //     // width: display.width*0.87,
                    //     // width: display.width*0.90,
                    //     // width: display.width*0.93,
                    //     // width: 73,
                    //     // width: display.width*(73/350),
                    //     // height: 80.49,
                    //     // width: 168.36,
                    //     alignment: Alignment.bottomCenter,
                    //     child: GestureDetector(
                    //       onTap: (){
                    //         Navigator.of(context).push(
                    //           MaterialPageRoute(
                    //               builder: (context) => Screen4(level: "Impossible")
                    //           ),
                    //         );
                    //       },
                    //       child: Image.asset(
                    //         "assets/images/Group 32.png",
                    //         fit: BoxFit.fill,
                    //         scale: 5,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Container(
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
                        onTap: ()async{
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //       // builder: (context) => Screen4(level: "Impossible")
                          //       // builder: (context) => Screen4(mode: "Impossible", level: '${1}', user: widget.user,)
                          //       builder: (context) => Screen4(mode: "Impossible", level: '${widget.user["level"]["impossible"]}', user: widget.user,)
                          //   ),
                          // );
                          // await methods.playSound(file: "soundscrate-graphics-game-blip-2")
                          //     .then((value) {
                          //   // Navigator.of(context).push(
                          //   Navigator.of(context).pushReplacement(
                          //     MaterialPageRoute(
                          //         builder: (context) => Screen4(mode: "Impossible", level: '${widget.user["level"]["impossible"]}', user: widget.user,)
                          //     ),
                          //   );
                          // });

                          /*(!widget.user["sound"])? null :
                          Sounds.buttonClick;*/

                          /*// Navigator.of(context).pushReplacement(
                          Navigator.of(context).push(
                            NavigateWithOpaque(
                              // child: Screen4(mode: "Impossible", level: '${widget.user["level"]["impossible"]}', user: widget.user, mAudio: widget.mAudio,),
                              child: Screen4(mode: "Impossible", level: '${widget.user["level"]["impossible"]}', user: widget.user,),
                              // duration: 200,
                              direction: AxisDirection.left,
                            ),
                          );*/

                          int lastPuzzle = 0;
                          // int lastPuzzle = 1;
                          late String mode = "Impossible";
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

                          Random random = Random();
                          final v_ = random.nextInt(lastPuzzle);
                          // late String res = "$v_";
                          late String res = v_==0?"1":"$v_";

                          // res = '92';
                          // res = "1"; //added
                          /// 1,2,6,8,28,53,69,74,86,87,99,100
                          // res = "86";

                          print("res ?? $res");

                          // Navigator.of(context).push(
                          //   NavigateWithOpaque(
                          //     child: Screen4(mode: mode, level: res, user: widget.user,),
                          //     direction: AxisDirection.left,
                          //   ),
                          // );

                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                          // Navigator.of(context).pushReplacement(
                            NavigateWithOpaque(
                              child: Screen4(mode: mode, level: res, user: widget.user,),
                              // child: Screen4(mode: mode, level: '${widget.user["level"][mode.toLowerCase()]}', user: widget.user,),
                              direction: AxisDirection.left,
                            ),
                          );

                        },
                        child: Image.asset(
                          "assets/images/Group 32.png",
                          fit: BoxFit.fill,
                          // scale: 5,
                          scale: 4 * scale,
                        ),
                      ),
                    ),
                    /*SizedBox(height: 39 / mockupHeight * height,),*/
                    SizedBox(height: isTablat?39:39 / mockupHeight * height,),

                    /*SizedBox(height: 25 / mockupHeight * height,),*/
                    SizedBox(height: isTablat?25:25 / mockupHeight * height,),
                  ],
                ),

              ],
            ),
          ),
        ),
      );
    //   ,
    // );
  }

}

/*
Positioned LeftRoot() {
  return Positioned(
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
  );
}

Positioned Branch(Size display) {
  return Positioned(
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
  );
}

class RightRoot extends StatelessWidget {
  const RightRoot({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
    );
  }
}

class Grass extends StatelessWidget {
  const Grass({
    Key? key,
    required this.display,
  }) : super(key: key);

  final Size display;

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
    );
  }
}

class Tree extends StatelessWidget {
  const Tree({
    Key? key,
    required this.display,
  }) : super(key: key);

  final Size display;

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
    );
  }
}

class Clouds extends StatelessWidget {
  const Clouds({
    Key? key,
    required this.display,
  }) : super(key: key);

  final Size display;

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
    );
  }
}
*/
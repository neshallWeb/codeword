import 'dart:async';
import 'dart:developer';
import 'dart:io';

// import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import 'package:f2f_puzzlegame/view/background_theme.dart';
// import 'package:f2f_puzzlegame/view/dialogs.dart';
// import 'package:f2f_puzzlegame/view/login_screen.dart';
// import 'package:f2f_puzzlegame/view/screen_2.dart';
// import 'package:f2f_puzzlegame/view/signup_screen.dart';
import '../view/dialogs.dart';
import '../view/login_screen.dart';
import '../view/screen_2.dart';
import '../view/signup_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
// import 'package:pixel_perfect/pixel_perfect.dart';

import '../model/constants.dart';
import '../model/page_route.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key
    , this.start = false
    , this.isGuestMode = false
    // , this.mAudio
    // , this.isPlaying
  }) : super(key: key);

  final bool start;
  final bool isGuestMode;
  // final MAudio? mAudio;
  // final bool? isPlaying;

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

// class _AuthScreenState extends State<AuthScreen> {
class _AuthScreenState extends State<AuthScreen> with WidgetsBindingObserver{

  late AdProvider adProvider;

  // // MAudio loadingAudio = MAudio();
  // MAudio mAudio = MAudio();
  // late bool isPlaying = false;

  Map<String, dynamic>? device;

  late DocumentSnapshot? user=null;



  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement LifeCycle Change
    super.didChangeAppLifecycleState(state);

    if(state == AppLifecycleState.inactive
        || state == AppLifecycleState.detached) return;

    final isBackground = state == AppLifecycleState.paused;

    if(isBackground){
      print('App in Background!');

     /* print('isPlaying $isPlaying');

      // if(isPlaying){
        mAudio.pauseMusic();
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
        mAudio.playLoopMusic();
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


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance!.addObserver(this);
    print('initial state.....');

    if(widget.start){

      // adProvider = AdProvider();

      runService();

    }else{
      // adProvider =
    }

    adProvider = AdProvider();
    adProvider.initializeBanner();
    adProvider.initializeInterstitial();
    adProvider.initializeRewarded();
    Future.delayed(const Duration(seconds: 3),(){
      setState(() {
        adProvider;
      });
    });

    App().getDeviceInfo().then(
            (value) {
          setState(() {
            device = value;
          });
        }
    );

    // loadingAudio.initialize('sounds/Loading-Sound-Effect-HD-Royalty-Free.mp3');
    // mAudio.initialize('sounds/SoundsCrate-Chiptune_Freefall.mp3').then((value) {
    // loadingAudio.initialize('sounds/${Sound.BackGround}');
    // mAudio.initialize('sounds/${Sound.BackGround}').then((value) {
    //   // mAudio.playLoopMusic();
    // });

/*
    if(widget.start){
      mAudio.initialize('sounds/${Sound.BackGround}').then((value) {
        // mAudio.playLoopMusic();
      });
    }else{
      print('widget.mAudio ${widget.mAudio!=null} ');
      if(widget.mAudio!=null){
        mAudio = widget.mAudio!;
        // mAudio.playLoopMusic();
      }else{
        mAudio.initialize('sounds/${Sound.BackGround}').then((value) {
          // mAudio.playLoopMusic();
        });
        if(!isPlaying){
          // mAudio.playLoopMusic();
          widget.isPlaying!=null && widget.isPlaying!?
          mAudio.playLoopMusic():null;
        }
      }
    }
    setState(() {
      mAudio;
    });
*/

    // NotificationService.runService();

    if(widget.isGuestMode){
      setState(() {
        isGuest = true;
      });
    }

    App.userdata.addListener(() {
      // setState(() {
        user = App.userdata.value;
      // });
    });

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
      // if(await service.isRunning()){
      //   print("ending old service...");
      //   service.invoke("stop");
      //   print("initializing service...");
      //   await initializeService();
      // }else{
      //   print("initializing service...");
      //   await initializeService();
      // }
      if(!(await service.isRunning())){
        print("initializing service...");
        await initializeService();
      }

      service = FlutterBackgroundService();
      bool serviceRunning = await service.isRunning();
      print('serviceRunning auth $serviceRunning');
      if(service!=null && !serviceRunning){
        setForeground(service);
        setBackground(service);

        // Map<String, dynamic> data = {
        //   'user': user,
        // };
        // updateWith(service, data);

      }


    }catch(e){
      print("err while service initializing\n\n${e}");
    }
  }


  @override
  void dispose() {
    // TODO: implement dispose
    print('AuthScreen');
    print('disposed.....');
    super.dispose();

    App.userdata.removeListener(() { });

/*
    // loadingAudio.dispose();
    mAudio.dispose();
*/

    WidgetsBinding.instance!.removeObserver(this);

  }

  final mockupWidth = 390;
  final mockupHeight = 844;

  bool isGuest = false;

  @override
  Widget build(BuildContext context) {

    Size display = MediaQuery.of(context).size;
    double width = display.width;
    double height = display.height;

    final scale = mockupWidth / width;
    // final divide = mockupWidth * width;

    final bool isTablat = width>500 && height>800?true:false;

    // print("\n\n$width $height $scale");

    return
      // PixelPerfect(
      // // scale: 1,
      // // scale: scale,
      //   scale: 0.6505,
      // assetPath: "assets/images/13 Pro - 5.png",
      // child:
      WillPopScope(
        onWillPop: () async {

          showDialog(
              context: context,
              // builder: (context) => dialogAppClose(context, user: user)
              builder: (context) => dialogAppClose(context)
          );

          return false;
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapShot) {

              if(snapShot.hasData){
                // print('user ${snapShot.data!.uid}');
              }


              if(snapShot.hasData){
                // return Screen22();

                // final usr = snapShot.data;
                // DocumentSnapshot user = await Login.getUser(usr!.uid);

                // return Screen222(context, display, , adProvider);

                return FutureBuilder(
                  // future: !snapShot.hasData? null : Login.getUser(snapShot.data!.uid),
                    future: !snapShot.hasData? Login.getUser('gu_${device==null?null:device!["serial"]!}') : Login.getUser(snapShot.data!.uid),
                  builder: (context, AsyncSnapshot<DocumentSnapshot> snap) {
                    if(snap.hasData) {

                       // if(audioCatch.fixedPlayer!=null){
                       //   audioCatch.fixedPlayer!.dispose();
                       // }else{
                       //   // audioCatch = AudioCache();
                       // }

                       // methods.playSound(file: 'SoundsCrate-Chiptune_Freefall')
                       //     .then((value) {
                       //   // setState(() {
                       //   //   if(value!=null){
                       //   //     audioCatch = value;
                       //   //   }
                       //   // });
                       // });

                      // late DocumentSnapshot user = snap.data!;
                      // setState(() {
                        user = snap.data!;
                      // });

                      // print('user $user');
                      // print('user is null ${user.exists}');

                      App.userdata.value = user;
                      App.userdata.notifyListeners();

                      if(user!=null){
                        //Login.getUserStream(user!['id']);

                        // Database.pathData("users").doc(user!['id']).snapshots().listen((event) {
                        Database.pathData("users").doc(user!['id']).snapshots().listen((event) {
                          if(!mounted) return;
                          setState(() {
                            user = event;
                          });
                        });
                      }

                      /*// loadingAudio.pauseMusic();
                      //setPlayerState();
                      //mAudio.playMusic();

                      // mAudio.playLoopMusic();
                      if(mAudio!=null && user!=null){
                        // if(!isMusic){
                        if(!user["music"]){
                          if(isPlaying){
                            mAudio.pauseMusic();
                            // setState(() {
                            isPlaying = false;
                            // });
                          }
                        }else{
                          if(!isPlaying){
                            if(widget.start){
                              mAudio.playLoopMusic();
                            }
                            // mAudio.playLoopMusic();
                            // setState(() {
                            isPlaying = true;
                            // });
                          }
                        }
                      }*/

                    // return Screen222(context, display, user, adProvider, mAudio);//, setPlayerState()
                      return Screen222(context, display, user!, adProvider);//, setPlayerState()
                      // return Screen222(context, display, snap.data!, adProvider, mAudio);//, setPlayerState()
                    } else {
                      // loadingAudio.pauseMusic();
                      return const Center(child: CircularProgressIndicator(color: Colors.white,),);
                    }
                  }
                );
              }

              if(!snapShot.hasData && isGuest){
                return FutureBuilder(
                    future: Login.getUser('gu_${device==null?null:device!["serial"]!}'),
                    builder: (context, AsyncSnapshot<DocumentSnapshot> snap) {
                      if(snap.hasData) {

                        // if(!mounted) return;
                        // late DocumentSnapshot user = snap.data!;
                        // setState(() {
                          user = snap.data!;
                        // });

                        // print('user $user');
                        // print('user is null ${user.exists}');

                        App.userdata.value = user;
                        App.userdata.notifyListeners();

                        if(user!=null){
                          //Login.getUserStream(user!['id']);

                          // Database.pathData("users").doc(user!['id']).snapshots().listen((event) {
                          Database.pathData("users").doc(user!['id']).snapshots().listen((event) {
                          // Database.pathData("users").doc(user!['id']).get().then((event) {
                            // if(mounted)
                            if(!mounted) return;
                            setState(() {
                              user = event;
                            });
                          });
                        }

                   /*     // loadingAudio.pauseMusic();
                        //setPlayerState();
                        //mAudio.playMusic();

                        // mAudio.playLoopMusic();
                        if(mAudio!=null && user!=null){
                          // if(!isMusic){
                          // if(!user["music"]){
                          //   mAudio.pauseMusic();
                          // }else{
                          //   mAudio.playLoopMusic();
                          // }
                          if(!user["music"]){
                            if(isPlaying){
                              mAudio.pauseMusic();
                              // setState(() {
                              isPlaying = false;
                              // });
                            }
                          }else{
                            if(!isPlaying){
                              if(widget.start){
                                mAudio.playLoopMusic();
                              }
                              // mAudio.playLoopMusic();
                              // setState(() {
                              isPlaying = true;
                              // });
                            }
                          }
                        }
*/
                        // return Screen222(context, display, user, adProvider, mAudio);//, setPlayerState()
                        return Screen222(context, display, user!, adProvider);//, setPlayerState()
                        // return Screen222(context, display, snap.data!, adProvider, mAudio);//, setPlayerState()
                      } else {
                        // loadingAudio.pauseMusic();
                        return const Center(child: CircularProgressIndicator(color: Colors.white,),);
                      }
                    }
                );
              }

              if(snapShot.connectionState == ConnectionState.waiting){
                return const CircularProgressIndicator();
              }

              return Container(
                height: display.height,
                width: display.width,
                // decoration: const BoxDecoration(
                //   image: DecorationImage(
                //     image: ExactAssetImage(
                //       "assets/images/background.png",
                //     ),
                //     // fit: BoxFit.fill,
                //     fit: BoxFit.cover,
                //   ),
                // ),
                child: Stack(
                  children: [

                    // backGround(display),

                    //back
                    // Positioned(
                    //     child: Container(
                    //       // color: Color(0xff151515).withOpacity(0.7),
                    //       decoration: BoxDecoration(
                    //         gradient: LinearGradient(
                    //           begin: Alignment.topCenter,
                    //           end: Alignment.bottomCenter,
                    //           colors: [
                    //             Colors.white.withOpacity(0.7),
                    //             Colors.white.withOpacity(1),
                    //           ]
                    //         ),
                    //       ),
                    //     )
                    // ),



                    //back
                    Positioned(
                        child: Container(
                          // color: Color(0xff151515).withOpacity(0.7),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.white.withOpacity(0.7),
                                  Colors.white.withOpacity(1),
                                ]
                            ),
                          ),
                        )
                    ),

                    //text
                    // snapShot.hasData?
                    // Positioned(
                    //
                    //   // top: 57,
                    //   //left: 9,
                    //   top: 90,
                    //   left: -44,
                    //   child: Container(
                    //     // height: 209.34,
                    //     // width: 372,
                    //     // width: display.width*0.95,
                    //     width: 478,
                    //     alignment: Alignment.bottomCenter,
                    //     child: Image.asset(
                    //       "assets/images/Spooky_Text_Effect 2.png",
                    //       fit: BoxFit.fill,
                    //     ),
                    //   ),
                    // )
                        // :Container(),

                    Positioned(

                      // top: 57,
                      //left: 9,
                      // top: 90,
                      // left: -44,
                      /*top: (59*scale) / mockupHeight * height,
                      left: (9*scale) / mockupWidth * width,*/
                      top: (isTablat?82:59*scale) / mockupHeight * height,
                      left: (isTablat?5:9*scale) / mockupWidth * width,
                      child: Container(
                        // height: 209.34,
                        // width: 372,
                        /*height: (209.34*scale) / mockupHeight * height,
                        width: (372*scale) / mockupWidth * width,*/
                        height: (isTablat?229.34:209.34*scale) / mockupHeight * height,
                        width: (isTablat?392:372*scale) / mockupWidth * width,
                        // width: display.width*0.95,
                        // width: 478,
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(
                          "assets/images/Spooky_Text_Effect 2.png",
                          fit: BoxFit.fill,
                          scale: 4 * scale,
                        ),
                      ),
                    ),


                    Positioned(
                      // top: 90,
                      // left: -44,
                      /*top: (400*scale)/mockupHeight*height,*/
                      left: (((display.width/2)-115)*scale)/mockupWidth*width,
                      top: (isTablat?400:400*scale)/mockupHeight*height,
                      child: Column(
                        children: [
                          //guest
                          InkWell(
                            onTap: (){
                              //Navigator.pushReplacement(context,

                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //     // builder: (context) => Screen2()
                              //       builder: (context) => Screen2(user: null,)
                              //     //   builder: (context) => Screen22()
                              //   ),
                              // );

                              // //crashlytics check
                              // // throw const FormatException("error");
                              // FirebaseCrashlytics.instance.crash();
                              // //SystemNavigator.pop();
                              // exit(0);
                              // throw(Exception('Hello Crashlytics'));
                              // // return;


                              final credential = {
                                'serial': device==null?null:device!["serial"]!,
                              };
                              Login.signUpWithGuest(credential).then((value) {
                                // Navigator.pop(context);
                                if(value!=null){

                                  setState(() {
                                    isGuest = true;
                                  });

                                  if(!widget.start){
                                    // Navigator.pop(context);
                                  }

                                  // Navigator.pop(context);

                                  // Navigator.of(context).pushReplacement(
                                  //   MaterialPageRoute(
                                  //     // builder: (context) => Screen2()
                                  //       builder: (context) => Screen2(user: value,)
                                  //     //   builder: (context) => Screen22()
                                  //   ),
                                  // );

                                }
                              });

                            },
                            child: Container(
                              width: (230*scale)/mockupWidth*width,
                              /*height: (50*scale)/mockupHeight*height,*/
                              height: (isTablat?50:50*scale)/mockupHeight*height,
                              alignment: Alignment.center,
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              decoration: const BoxDecoration(
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.all(Radius.circular(100)),
                                boxShadow: [
                                  BoxShadow(
                                    spreadRadius: 4,
                                    blurRadius: 14,
                                    offset: Offset(0,4),
                                    color: Color.fromRGBO(0, 0, 0, 0.15),
                                  ),
                                ],
                              ),
                              child: const Text("Play as a guest",
                                style: TextStyle(
                                  // color: Color(0xffffffff),
                                  color: Color(0xff989898),
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          //signup
                          InkWell(
                            onTap: (){
                              //Navigator.pushReplacement(context,
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //       builder: (context) => SignScreen()
                              //   ),
                              // );

                              Navigator.of(context).pushReplacement(
                                NavigateWithOpaque(
                                  child: SignScreen(),
                                  // duration: 200,
                                  direction: AxisDirection.left,
                                ),
                              );
                            },
                            child: Container(
                              width: (230*scale)/mockupWidth*width,
                              /*height: (50*scale)/mockupHeight*height,*/
                              height: (isTablat?50:50*scale)/mockupHeight*height,
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.all(Radius.circular(100)),
                                boxShadow: [
                                  BoxShadow(
                                    spreadRadius: 4,
                                    blurRadius: 14,
                                    offset: Offset(0,4),
                                    color: Color.fromRGBO(0, 0, 0, 0.15),
                                  ),
                                ],
                              ),
                              child: const Text("Sign up",
                                style: TextStyle(
                                  // color: Color(0xffffffff),
                                  color: Color(0xff1E7757),
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          //login
                          InkWell(
                            onTap: (){
                              // Navigator.of(context).push(
                              // Navigator.of(context).pushReplacement(
                              //   // MaterialPageRoute(
                              //   //     builder: (context) => LoginScreen()
                              //   // ),
                              //
                              //   // NavigateTo(
                              //   //   child: LoginScreen(),
                              //   //   duration: 200,
                              //   //   direction: AxisDirection.down,
                              //   // ),
                              //
                              //     NavigateLeft(
                              //   // NavigateWithOpaque(
                              //     // duration: 200,
                              //     // direction: AxisDirection.left,
                              //     child: LoginScreen(),
                              //   ),
                              //
                              //   // NavigateOpaque(
                              //   //   builder: (context) => LoginScreen()
                              //   // ),
                              // );

                              // !widget.start?
                              // Navigator.pop(context):null;

                              // Navigator.of(context).pushReplacement( //auth state change problem
                              // // Navigator.of(context).push(
                              //   NavigateWithOpaque(
                              //     child: LoginScreen(),
                              //     // duration: 200,
                              //     direction: AxisDirection.left,
                              //   ),
                              // );

                              if(!widget.start){
                                Navigator.pop(context);

                                // Navigator.of(context).pushReplacement( //auth state change problem
                                  Navigator.of(context).push(
                                  NavigateWithOpaque(
                                    child: LoginScreen(),
                                    // duration: 200,
                                    direction: AxisDirection.left,
                                  ),
                                );
                              }else{
                                Navigator.of(context).pushReplacement( //auth state change problem
                                  // Navigator.of(context).push(
                                  NavigateWithOpaque(
                                    child: LoginScreen(),
                                    // duration: 200,
                                    direction: AxisDirection.left,
                                  ),
                                );
                              }

                            },
                            child: Container(
                              width: (230*scale)/mockupWidth*width,
                              /*height: (50*scale)/mockupHeight*height,*/
                              height: (isTablat?50:50*scale)/mockupHeight*height,
                              margin: EdgeInsets.symmetric(vertical: 10),
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: Color(0xff1E7757),
                                borderRadius: BorderRadius.all(Radius.circular(100)),
                                boxShadow: [
                                  BoxShadow(
                                    spreadRadius: 4,
                                    blurRadius: 14,
                                    offset: Offset(0,4),
                                    color: Color.fromRGBO(0, 0, 0, 0.15),
                                  ),
                                ],
                              ),
                              child: const Text("Login",
                                style: TextStyle(
                                  color: Color(0xffffffff),
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Container(
                      //   width: display.width,
                      //   height: display.height,
                      //   // margin: EdgeInsets.all(20),
                      //   alignment: Alignment.center,
                      //   child: Container(
                      //     width: 250,
                      //     height: 250,
                      //     child:
                      //     ),
                      //   ),

                    ),

                  ],
                ),
              );

            },
          ),

        ),
      );
    // ,
    // );
  }
}

//******************************************************
Future<void> initializeService() async {

//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
// // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
//   const AndroidInitializationSettings initializationSettingsAndroid =
//   AndroidInitializationSettings('app_icon');
//   final IOSInitializationSettings initializationSettingsIOS =
//   IOSInitializationSettings(
//       onDidReceiveLocalNotification: onDidReceiveLocalNotification);
//   final MacOSInitializationSettings initializationSettingsMacOS =
//   MacOSInitializationSettings();
//   final InitializationSettings initializationSettings = InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsIOS,
//       macOS: initializationSettingsMacOS);
//   await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//       onSelectNotification: selectNotification);
//   //------------------

  //DocumentSnapshot user
  final service = FlutterBackgroundService();
  await service.configure(
    androidConfiguration: AndroidConfiguration(
      // onStart: (instance) async => onStart(instance, user),
      onStart: onStart,
      autoStart: true,
      // isForegroundMode: true,
      isForegroundMode: false,
      // foregroundServiceNotificationContent: "",
      // foregroundServiceNotificationTitle: ""
    ),
    iosConfiguration: IosConfiguration(
      autoStart: true,
      // onForeground: (instance) async => onStart(instance, user),
      onForeground: onStart,
      onBackground: onIosBackground,
    ),
  );
  service.startService();
}
bool onIosBackground(ServiceInstance service) {
  WidgetsFlutterBinding.ensureInitialized();
  print('FLUTTER BACKGROUND FETCH');

  return true;
}
void onStart(ServiceInstance service) async {

  try{

    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp().then((value){
      print('firebase background app ${value.name} initialized');
    });

    //on background
    service.on('background').listen((event) {
      if(service is AndroidServiceInstance) {
        service.setAsBackgroundService();
      }
    });

    //on foreground
    service.on('foreground').listen((event) {
      if(service is AndroidServiceInstance) {
        service.setAsForegroundService();
      }
    });


    //on stop
    service.on('stop').listen((event) {
      service.stopSelf();
    });


    DocumentSnapshot? user;
    Map<String, dynamic>? device;

    await App().getDeviceInfo().then(
            (value) {
          device = value;
        }
    );

    final credential = {
      'serial': device==null?null:device!["serial"]!,
    };
    print('user serial key ${credential["serial"]}');


    //on update
    service.on('update').listen((event) async {
      // print('on service update.... \n${event!}');
      if(event==null){
        return;
      }

      if(service is AndroidServiceInstance) {

        // if(event["user"=="guest"]){
        //   user = await Login.getUser('gu_${credential["serial"]}');
        //   if(user!=null){print("guest uid ${user!.id}");}
        // }else{
        //   FirebaseAuth.instance.authStateChanges().first.then((value) async {
        //     if(value!=null){
        //       user = await Login.getUser(value.uid);
        //       print("user uid ${value.uid}");
        //       print("user mail ${user!['email'] ?? ''}");
        //     }
        //   });
        // }

        if(event["user"]!=null){
          if(user == null || user!.id != event["user"]){
            print('updating...');
            // user = event["user"];
            user = await Login.getUser(event["user"]);
            if(user!=null){
              print("user uid ${user!.id}");
              print("user mail ${user!['email'] ?? ''}");
            }
          }
        }

        /*
        if(event['ds']!=null){
          user = event['ds'] as DocumentSnapshot;

          print('changed user ${user!.id}');

          Map<String, dynamic>? uKey;
          print('listening visitors');

          store.collection(_app_id).doc(_id)
              .collection("visitors")
              .orderBy("ts", descending: true)
              .snapshots().listen((event) {

            print('background fire change detected');

            for (var change in event.docChanges) {
              DocumentSnapshot ds = change.doc;

              print('change detected ${ds.id}');

              String msg = "";
              String title = "";
              String payload = "";
              String key = (ds["appointment-id"] as String).replaceAll(
                  "siam-bis-", "");
              int id = int.parse(key.substring(key.length - 2, key.length - 1));
              print('notify id ${key}');
              print('notify id ${id}');
              if (ds['status'] == "Created") {
                //payload = "Arrived";
                payload = "${ds.id}";
                title = "New appointment arrived";
                // msg = "${ds['name']}\n${ds['contact']}\n\n${ds['purpose']}";
                msg = "<h1> ${ds['name']} </h1> </br> "
                    " <h2> ${ds['contact']} </h2> </br>"
                    "<p></p>"
                    " </br> <h2> ${ds['purpose']} </h2> <picture src='${Uri.directory(
                    "assets/images/ic_approved")}'/>";
                // " </br> <h2> ${ds['purpose']} </h2> <picture> assets/images/ic_created </picture>";
                // Featured.showToast(msg: msg);
              }
              else if (ds['status'] == "Approved") {
                title = "Appointment request has been approved";
                //payload = "Approved";
                payload = "${ds.id}";
                // msg = "${ds['name']}\n${ds['contact']}\n\n${ds['purpose']}";
                msg = "<h1> ${ds['name']} </h1> </br> "
                    " <h2> ${ds['contact']} </h2> </br>"
                    "<p></p>"
                    " </br> <h2 style='color:amber'> ${ds['purpose']} </h2> <picture src='${Uri
                    .directory("assets/images/ic_approved")}'/>";
                // " </br> <h2> ${ds['purpose']} </h2> <picture> assets/images/ic_approved </picture>";
                // Featured.showToast(msg: msg);
              }
              else if (ds['status'] == "Rejected") {
                title = "Appointment request has been rejected";
                // payload = "Rejected";
                payload = "${ds.id}";
                // msg = "${ds['name']}\n${ds['contact']}\n\n${ds['purpose']}";
                msg = "<h1> ${ds['name']} </h1> </br> "
                    " <h2> ${ds['contact']} </h2> </br>"
                    "<p></p>"
                    " </br> <h2 style='color:red'> ${ds['purpose']} </h2> <picture src='${Uri
                    .directory("assets/images/ic_approved")}'/>";
                // " </br> <h2> ${ds['purpose']} </h2> <picture> assets/images/ic_approved </picture>";
                // Featured.showToast(msg: msg);
              }
              else if (ds['status'] == "Visited") {
                title = "Appointment visited successfully";
                // payload = "Visited";
                payload = "${ds.id}";
                // msg = "${ds['name']}\n${ds['contact']}\n\n${ds['purpose']}";
                msg = "<h1> ${ds['name']} </h1> </br> "
                    " <h2> ${ds['contact']} </h2> </br>"
                    "<p></p>"
                    " </br> <h2 style='color:green'> ${ds['purpose']} </h2> <picture src='${Uri
                    .directory("assets/images/ic_approved")}'/>";
                // " </br> <h2> ${ds['purpose']} </h2> <picture> assets/images/ic_approved </picture>";
                // Featured.showToast(msg: msg);
              }

              if (user != null) {
                if (user!["role"] == "admin" || user!["role"] == "reception") {
                  if (ds['meeting-with'] == user!["position"]) {
                    try {
                      print("notify id ${id}");
                      NotificationApi.showNotification_11(
                        id: id,
                        title: title,
                        body: msg,
                        payload: payload,
                      );
                    } catch (e) {
                      print('notify error');
                      print(e.toString());
                      print('------------');
                    }
                  }
                }
              }
            }
          });


        }
*/
      }
    });




    if(service is AndroidServiceInstance) {

      /*
        //send sms
        Fire().listenOTPStream().snapshots().listen((event) async {

          print('listening OTP...');

          for (var element in event.docChanges) {
            DocumentSnapshot ds = element.doc;
            print('otp doc changed ${ds.id}');
            if((ds['mode']??'mobile') == 'web'){
              if((ds['ts'] as Timestamp).toDate().isAfter(
                  DateTime.now().subtract(const Duration(minutes: 1))
              )){

                try{

                  // Featured.sendSMS(
                  Featured.sendSMSBackground(
                      number: ds['mobile'],
                      otp: ds['otp'],
                      isOtp: true)
                      .then((value){
                    print('otp send to ${ds['otp']}');
                  });

                  // bool isOtp = true;
                  // String message = "";
                  //
                  // final Telephony telephony = Telephony.instance;
                  //
                  // final SmsSendStatusListener listener = (SendStatus status) {
                  //
                  //   print('send status ${status}');
                  //
                  //   switch (status) {
                  //     case SendStatus.DELIVERED:
                  //       throw ("Se entregó el mensaje");
                  //
                  //     case SendStatus.SENT:
                  //       throw ("Se envió el mensaje");
                  //   }
                  // };
                  //
                  // bool permissionsGranted = await telephony.requestPhoneAndSmsPermissions as bool;
                  // if(permissionsGranted){
                  //   print('sending sms...');
                  //   await telephony.sendSms(
                  //     to: ds['mobile'],
                  //     message: isOtp?"Your verification OTP for BIS school visit is ${ds['otp']}. please do not share with others." : message,
                  //     statusListener: listener,
                  //   ).then((value) => null);
                  // }else {
                  //   print('sms sending err permission -> not granted');
                  // }

                  // print('sending sms...');

                  // BackgroundSms.sendMessage(
                  //   // phoneNumber: "09xxxxxxxxx",
                  //   // message: "Message",
                  //   // phoneNumber: ds['mobile'],
                  //   phoneNumber: '0${ds['mobile']}',
                  //   message: isOtp?"Your verification OTP for BIS school visit is ${ds['otp']}. please do not share with others." : message,
                  //   // simSlot: 1,
                  // ).then((result) {
                  //
                  //   if (result == SmsStatus.sent) {
                  //     print("sms sending success");
                  //   } else {
                  //     print("sms sending failed");
                  //   }
                  //
                  // });


                }catch(e){
                  print('sending err -> ${e.toString()}');
                }

              }
            }
          }
        });
        */


//    if(user!=null){


      /*
        //user
        Map<String, dynamic>? uKey;

        // SharedPreferences.setMockInitialValues({});

        // if(Platform.isAndroid) {
        //   uKey = await Pref().getUserFromPref();

        // final SharedPreferences pref = await SharedPreferences();
        final SharedPreferences pref = await SharedPreferences.getInstance();
        var userData = pref.getString("user-info");

        if(userData!=null && userData!=""){
          uKey = {
            "uid": userData.split("\n")[0],
            "pass": userData.split("\n")[1],
            "role": userData.split("\n")[2],
          };
        }else{
          uKey = null;
        }

        //Path -> /data/user/0/suvarna.innovations.appoint_manager/app_flutter/credential/user.txt
        //URI -> file:///data/user/0/suvarna.innovations.appoint_manager/app_flutter/credential/user.txt

        // String udata = await Featured.readUserText();
        // uKey = udata!=""?json.decode(udata):null;
        */

      /*
        String path = '/data/user/0/suvarna.innovations.appoint_manager/app_flutter/credential/user.txt';
        String udata = await Featured.readUserTextfromPath(path);
        uKey = udata!=""?json.decode(udata):null;

        print('userkey ${uKey}');

        user = uKey==null? null :await Fire().checkUserSnap(uKey["uid"], uKey["pass"]);

        // }
        */


      /*
        //visitor data
        print('listening visitors');
        // Fire().listenVisitorsStream()
        store.collection(_app_id).doc(_id)
            .collection("visitors")
            .orderBy("ts", descending: true)
            .snapshots().listen((event) {
          print('background fire change detected');

          for (var change in event.docChanges) {
            DocumentSnapshot ds = change.doc;

            print('change detected ${ds.id}');

            String msg = "";
            String title = "";
            String payload = "";
            String key = (ds["appointment-id"] as String).replaceAll(
                "siam-bis-", "");
            // int id = int.parse(key.substring(key.length - 2, key.length - 1));
            int id = int.parse(key.substring(key.length - 3));
            // print('notify id ${key}');
            // print('notify id ${id}');
            if (ds['status'] == "Created") {
              //payload = "Arrived";
              payload = "${ds.id}";
              title = "New appointment arrived";
              // msg = "${ds['name']}\n${ds['contact']}\n\n${ds['purpose']}";
              msg = "<h1> ${ds['name']} </h1> </br> "
                  " <h2> ${ds['contact']} </h2> </br>"
                  "<p></p>"
                  " </br> <h2> ${ds['purpose']} </h2> <picture src='${Uri
                  .directory(
                  "assets/images/ic_approved")}'/>";
              // " </br> <h2> ${ds['purpose']} </h2> <picture> assets/images/ic_created </picture>";
              // Featured.showToast(msg: msg);
            }
            else if (ds['status'] == "Approved") {
              title = "Appointment request has been approved";
              //payload = "Approved";
              payload = "${ds.id}";
              // msg = "${ds['name']}\n${ds['contact']}\n\n${ds['purpose']}";
              msg = "<h1> ${ds['name']} </h1> </br> "
                  " <h2> ${ds['contact']} </h2> </br>"
                  "<p></p>"
                  " </br> <h2 style='color:amber'> ${ds['purpose']} </h2> <picture src='${Uri
                  .directory("assets/images/ic_approved")}'/>";
              // " </br> <h2> ${ds['purpose']} </h2> <picture> assets/images/ic_approved </picture>";
              // Featured.showToast(msg: msg);
            }
            else if (ds['status'] == "Rejected") {
              title = "Appointment request has been rejected";
              // payload = "Rejected";
              payload = "${ds.id}";
              // msg = "${ds['name']}\n${ds['contact']}\n\n${ds['purpose']}";
              msg = "<h1> ${ds['name']} </h1> </br> "
                  " <h2> ${ds['contact']} </h2> </br>"
                  "<p></p>"
                  " </br> <h2 style='color:red'> ${ds['purpose']} </h2> <picture src='${Uri
                  .directory("assets/images/ic_approved")}'/>";
              // " </br> <h2> ${ds['purpose']} </h2> <picture> assets/images/ic_approved </picture>";
              // Featured.showToast(msg: msg);
            }
            else if (ds['status'] == "Visited") {
              title = "Appointment visited successfully";
              // payload = "Visited";
              payload = "${ds.id}";
              // msg = "${ds['name']}\n${ds['contact']}\n\n${ds['purpose']}";
              msg = "<h1> ${ds['name']} </h1> </br> "
                  " <h2> ${ds['contact']} </h2> </br>"
                  "<p></p>"
                  " </br> <h2 style='color:green'> ${ds['purpose']} </h2> <picture src='${Uri
                  .directory("assets/images/ic_approved")}'/>";
              // " </br> <h2> ${ds['purpose']} </h2> <picture> assets/images/ic_approved </picture>";
              // Featured.showToast(msg: msg);
            }

            if((ds['ts'] as Timestamp).toDate().isAfter(
                DateTime.now().subtract(const Duration(days: 1, minutes: 0))
            )) {
              if (user != null) {
                if (user["role"] == "admin" || user["role"] == "reception") {
                  if (ds['meeting-with'] == user["position"]) {
                    try {
                      print("notify id ${id}");
                      // NotificationApi.showNotification_11(
                      //   id: id,
                      //   title: title,
                      //   body: msg,
                      //   payload: payload,
                      // );

                      NotificationApi.showNotification_11(
                        id: id,
                        // id: 0,
                        title: title,
                        body: msg,
                        payload: payload,
                      );

                      // service.setForegroundNotificationInfo(
                      //   title: title,
                      //   content: msg,
                      // );
                    } catch (e) {
                      print('notify error');
                      print(e.toString());
                      print('------------');
                    }
                  }
                }
              }
            }

          }


        });

        //  }
        */


      /*
        DocumentSnapshot? user;
      final String _app_id = "si-fa-002_am_bis";
      final _id = "bis_app";
      final store = FirebaseFirestore.instance;
        */

      //**********************
      /*DocumentSnapshot? user;
      Map<String, dynamic>? device;

      await App().getDeviceInfo().then(
              (value) {
            device = value;
          }
      );

      final credential = {
        'serial': device==null?null:device!["serial"]!,
      };
      print('user serial key ${credential["serial"]}');
*/

      // user ??= await Login.getUser('gu_${credential["serial"]}');

      // if(user==null){
      //   user = await Login.getUser('gu_${credential["serial"]}');
      //   print("guest uid ${user.id}");
      // }


      /*FirebaseAuth.instance.authStateChanges().listen((event) async {
        if(event!=null){
          // event.uid;
          // user = await Login.getUser('gu_${credentials["serial"]}');
          user = await Login.getUser(event.uid);
          // print("event.uid ${event.uid}");
          print("user uid ${event.uid}");
          print("user mail ${user!['email'] ?? ''}");
        }else{
          // print("user uid ${event.uid}");
        }
      });*/


      // Timer.periodic(const Duration(hours: 1), (timer) {
      // Timer.periodic(const Duration(minutes: 30), (timer) {
      Timer.periodic(const Duration(minutes: 15), (timer) { // 15 MIN
      // Timer.periodic(const Duration(minutes: 1), (timer) {
      // Timer.periodic(const Duration(seconds: 5), (timer) {
      // Timer.periodic(const Duration(minutes: 1), (timer) {

        // print();

        final cTime = DateTime.now();

        // if(!cTime.isAfter(DateFormat("hh:mm a").parse("8:00 AM"))
        //   && !cTime.isBefore(DateFormat("hh:mm a").parse("9:00 AM"))
        // ){
        // if(cTime.isAfter(DateFormat("hh:mm a").parse("10:00 PM"))
        //     || cTime.isBefore(DateFormat("hh:mm a").parse("9:00 PM"))
        // ){

        print('cTime $cTime');
        // print('${DateFormat("hh:mm a").parse("1:00 AM")}');
        // print('${DateFormat("hh:mm a").parse("12:00 AM")}');
        // print('${DateFormat("dd-MM-yyyy hh:mm a").parse("${cTime.day}-${cTime.month}-${cTime.year} 1:00 AM")}');
        // print('${DateFormat("dd-MM-yyyy hh:mm a").parse("${cTime.day}-${cTime.month}-${cTime.year} 12:00 AM")}');

        // if(cTime.isAfter(DateFormat("dd-MM-yyyy hh:mm a").parse("${cTime.day}-${cTime.month}-${cTime.year} 1:00 AM"))
        //     || cTime.isBefore(DateFormat("dd-MM-yyyy hh:mm a").parse("${cTime.day}-${cTime.month}-${cTime.year} 12:00 AM"))

        // if(cTime.isAfter(DateFormat("dd-MM-yyyy hh:mm a").parse("${cTime.day}-${cTime.month}-${cTime.year} 2:00 PM"))
        //     || cTime.isBefore(DateFormat("dd-MM-yyyy hh:mm a").parse("${cTime.day}-${cTime.month}-${cTime.year} 1:00 PM"))
        // ){//working
        if(cTime.isAfter(DateFormat("dd-MM-yyyy hh:mm a").parse("${cTime.day}-${cTime.month}-${cTime.year} 9:00 AM"))
            || cTime.isBefore(DateFormat("dd-MM-yyyy hh:mm a").parse("${cTime.day}-${cTime.month}-${cTime.year} 8:00 AM"))
        ){

          // if(cTime.isAfter(DateFormat("hh:mm a").parse("9:00 AM"))
        //     || cTime.isBefore(DateFormat("hh:mm a").parse("8:00 AM"))
        // ){

          print("out of time window!");

          return;
        }

        print("in time window!");
        /**/

        String msg = "";
        String title = "";
        String payload = "";

        title = "We’re blasting off 🚀";
        msg = "Complete your daily challenge and get 2x points for next 2 hour.";
        payload = "daily_challenge";

        print("Notify\n$title\n$msg");

        try{
          NotificationApi.user = user!;

          NotificationApi.showNotification_11(
            // id: id,
            id: 0,
            title: title,
            body: msg,
            payload: payload,
          );

          Login.resetDailyChallenge(user!['id']);

        }catch(e){
          print('err $e');
        }

      });

      //**********************

      late DocumentSnapshot? fstRnk=null;
      //     () async {
      //   fstRnk = await Database.topPlayer();
      // };

      //fstRnk = Database.topPlayer();
      await Database.pathData("users").orderBy("history.total_points", descending: true)
          .get().then((value) {
        QuerySnapshot qs = value;
        print('qs len ${qs.size}');
        if(qs.docs.isNotEmpty){
          fstRnk = qs.docs.first;
        }else{
          // fstRnk = null;
        }
      });
      // print('top player $fstRnk');
      print('top player ${fstRnk!["name"]}');

      // Database.topPlayer().then((value) {
      //   fstRnk=value;
      //   print('top player $fstRnk');
      // });

      // Database.topPlayers()
      Database.pathData("users").orderBy("history.total_points", descending: true)
          .snapshots().listen((event) {

            print("doc changed!");

        //event.docChanges.map((e) {
        for (var change in event.docChanges) {
          // DocumentSnapshot ds = change.doc;

          DocumentSnapshot usr = change.doc;
          // DocumentSnapshot usr = e.doc;
          print('change id ${usr.id}');
          // print('compare ${usr["history.total_points"]} > ${fstRnk!["history.total_points"]}');

          // if(fstRnk!=null && usr["history"]["total_points"]>fstRnk!["history"]["total_points"]){
          if (fstRnk != null &&
              usr["history.total_points"] >= fstRnk!["history.total_points"]
          ) {
            // DocumentSnapshot? topRnk =  await Database.topPlayer();
            // if(fstRnk!=null){
            //   if(usr.id == topRnk!.id){

            final currentTime = DateTime.now();
            final updated = (usr["history.updated"] as Timestamp).toDate();
            final oneMinute = DateTime.now().subtract(const Duration(minutes: 1));
            print("currentTime $currentTime");
            print("updated $updated");
            print("oneMinute $oneMinute");
            // print('condition ${updated.isBefore(oneMinute)}}');
            print('condition ${updated.isAfter(oneMinute)}}');
            // print('condition ${!oneMinute.isBefore(updated)}}');
            // print('condition ${updated.isBefore(oneMinute) && updated.isAfter(oneMinute)}}');
            // print('condition ${updated.isBefore(oneMinute) && !oneMinute.isBefore(updated)}}');

            // if(updated.isAfter(oneMinute)){
            // if(updated.isBefore(oneMinute) && !oneMinute.isBefore(updated)){

            if(updated.isAfter(oneMinute)){
              //5:42
              // break;
              // return;


              print("first rank changed!");
              print('first rank id ${usr.id}');

              fstRnk = usr; //change 1st rank
              print('fstRank ${fstRnk!["name"]}');
              DocumentSnapshot fst = usr;

              // DocumentSnapshot fst =  event.docChanges.first!.doc;
              print("${fst["name"]} is gained first rank.");

              String msg = "";
              String title = "";
              String payload = "";

              // title = "first rank changed 👏🏽";
              // msg = "🎁🎁🎁 ${fst["name"]} is gained first rank.";
              title = "First rank changed 👏🏽";
              msg = "${fst["name"]} is gained first rank. 🥇";
              payload = "1st-rank";

              print("Notify\n$title\n$msg");

              try {
                NotificationApi.user = user!;
                // NotificationApi.user = user ?? ;

                NotificationApi.showNotification_11(
                  // id: id,
                  id: 1,
                  title: title,
                  body: msg,
                  payload: payload,
                );
              } catch (e) {
                print('notification err -> $e');
              }

              // }
              // }
            }

          }

        }

        // });

      });


    }

    /**/
    /*
    else {

      print('listening visitors');
      // Fire().listenVisitorsStream()
      store.collection(_app_id).doc(_id)
          .collection("visitors")
          .orderBy("ts", descending: true)
          .snapshots().listen((event) {

        print('background fire change detected');

        for (var change in event.docChanges) {
          DocumentSnapshot ds = change.doc;

          print('change detected ${ds.id}');

          String msg = "";
          String title = "";
          String payload = "";
          String key = (ds["appointment-id"] as String).replaceAll(
              "siam-bis-", "");
          int id = int.parse(key.substring(key.length - 2, key.length - 1));
          print('notify id ${key}');
          print('notify id ${id}');
          if (ds['status'] == "Created") {
            //payload = "Arrived";
            payload = "${ds.id}";
            title = "New appointment arrived";
            // msg = "${ds['name']}\n${ds['contact']}\n\n${ds['purpose']}";
            msg = "<h1> ${ds['name']} </h1> </br> "
                " <h2> ${ds['contact']} </h2> </br>"
                "<p></p>"
                " </br> <h2> ${ds['purpose']} </h2> <picture src='${Uri.directory(
                "assets/images/ic_approved")}'/>";
            // " </br> <h2> ${ds['purpose']} </h2> <picture> assets/images/ic_created </picture>";
            // Featured.showToast(msg: msg);
          }
          else if (ds['status'] == "Approved") {
            title = "Appointment request has been approved";
            //payload = "Approved";
            payload = "${ds.id}";
            // msg = "${ds['name']}\n${ds['contact']}\n\n${ds['purpose']}";
            msg = "<h1> ${ds['name']} </h1> </br> "
                " <h2> ${ds['contact']} </h2> </br>"
                "<p></p>"
                " </br> <h2 style='color:amber'> ${ds['purpose']} </h2> <picture src='${Uri
                .directory("assets/images/ic_approved")}'/>";
            // " </br> <h2> ${ds['purpose']} </h2> <picture> assets/images/ic_approved </picture>";
            // Featured.showToast(msg: msg);
          }
          else if (ds['status'] == "Rejected") {
            title = "Appointment request has been rejected";
            // payload = "Rejected";
            payload = "${ds.id}";
            // msg = "${ds['name']}\n${ds['contact']}\n\n${ds['purpose']}";
            msg = "<h1> ${ds['name']} </h1> </br> "
                " <h2> ${ds['contact']} </h2> </br>"
                "<p></p>"
                " </br> <h2 style='color:red'> ${ds['purpose']} </h2> <picture src='${Uri
                .directory("assets/images/ic_approved")}'/>";
            // " </br> <h2> ${ds['purpose']} </h2> <picture> assets/images/ic_approved </picture>";
            // Featured.showToast(msg: msg);
          }
          else if (ds['status'] == "Visited") {
            title = "Appointment visited successfully";
            // payload = "Visited";
            payload = "${ds.id}";
            // msg = "${ds['name']}\n${ds['contact']}\n\n${ds['purpose']}";
            msg = "<h1> ${ds['name']} </h1> </br> "
                " <h2> ${ds['contact']} </h2> </br>"
                "<p></p>"
                " </br> <h2 style='color:green'> ${ds['purpose']} </h2> <picture src='${Uri
                .directory("assets/images/ic_approved")}'/>";
            // " </br> <h2> ${ds['purpose']} </h2> <picture> assets/images/ic_approved </picture>";
            // Featured.showToast(msg: msg);
          }

          if (user != null) {
            if (user!["role"] == "admin" || user!["role"] == "reception") {
              if (ds['meeting-with'] == user!["position"]) {
                try {
                  print("notify id ${id}");
                  NotificationApi.showNotification_11(
                    id: id,
                    title: title,
                    body: msg,
                    payload: payload,
                  );
                } catch (e) {
                  print('notify error');
                  print(e.toString());
                  print('------------');
                }
              }
            }
          }
        }
      });

    }
*/
  }catch(e){
    print('service err ->');
    log(e.toString());
  }

}

updateWith(FlutterBackgroundService instance, Map<String, dynamic> data){
  try {
    instance.invoke(
        'update',
        data
    );
    // print('updating service');
  }catch(e){
    print('updating service err...');
  }

}
setBackground(FlutterBackgroundService instance){
  instance.invoke("background");
}
setForeground(FlutterBackgroundService instance){
  instance.invoke("foreground");
}
dismiss(FlutterBackgroundService instance){
  instance.invoke("stop");
  print('service dismissing');
}


void selectNotification(BuildContext context,
    String payload) async {
  if (payload != null) {
    debugPrint('notification payload: $payload');
  }
  // await Navigator.push(
  //   context,
  //   MaterialPageRoute<void>(builder: (context) => SecondScreen(payload)),
  // );
}

void onDidReceiveLocalNotification(
    BuildContext context,//added
    int id, String title, String body, String payload) async {
  // display a dialog with the notification details, tap ok to go to another page
  showDialog(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: Text(title),
      content: Text(body),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          child: Text('Ok'),
          onPressed: () async {
            Navigator.of(context, rootNavigator: true).pop();
            // await Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => SecondScreen(payload),
            //   ),
            // );
          },
        )
      ],
    ),
  );
}
//******************************************************
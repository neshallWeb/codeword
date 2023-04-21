import 'dart:async';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:f2f_puzzlegame/view/background_theme.dart';
// import 'package:f2f_puzzlegame/view/screen_2.dart';
// import 'package:f2f_puzzlegame/view/screen_3.dart';
import '../view/background_theme.dart';
// import '../view/screen_2.dart';
// import '../view/screen_3.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/constants.dart';
import '../model/page_route.dart';
import 'auth_screen.dart';
// import 'login_screen.dart';

class SignScreen extends StatefulWidget {
  const SignScreen({Key? key}) : super(key: key);

  @override
  State<SignScreen> createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Timer.periodic(const Duration(seconds: 5), (timer) {
    //   Navigator.pushReplacement(context,
    //     MaterialPageRoute(builder: (context) => Screen2()),
    //   );
    // });

    App().getDeviceInfo().then(
            (value) {
          setState(() {
            device = value;
          });
        }
    );

  }

  Map<String, dynamic>? device;

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();



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

    final bool isTablat = width>500 && height>800?true:false;

    return Scaffold(
      body: Container(
        height: display.height,
        width: display.width,
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

            backGround(display),

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
            Positioned(

              // top: 57,
              //left: 9,
              // top: 90,
              // left: -44,
              /*top: (90*scale) / mockupHeight * height,
              left: (-44*scale) / mockupWidth * width,*/
              top: (isTablat?90:90*scale) / mockupHeight * height,
              left: (isTablat?40:-44*scale) / mockupWidth * width,
              child: Container(
                // height: 209.34,
                // width: 372,
                // width: display.width*0.95,
                // width: 478,
                width: (478*scale) / mockupWidth * width,
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  "assets/images/Spooky_Text_Effect 2.png",
                  fit: BoxFit.fill,
                  scale: 4*scale,
                ),
              ),
            ),

            Positioned(
              // top: 90,
              // left: -44,
              // top: 400,
              // left: (display.width/2)-115,
              child: SingleChildScrollView(
                child: Container(
                  width: width,
                  height: height,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      SizedBox(height: (200*scale)/mockupHeight*height,),

                      InkWell(
                        onTap: (){},
                        child: Container(
                          // width: 230,
                          // height: 50,
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
                          child: TextField(
                            controller: nameCtrl,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: "Name",
                              hintStyle: TextStyle(
                                  // color: Color(0xffffffff),
                                  color: Color(0xff989898),
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w600,
                                  /*fontSize: 15,*/
                                fontSize: isTablat?20:15,
                                ),
                              border: const UnderlineInputBorder(
                                // borderSide: BorderSide(color: Color(0xffffffff),),
                                borderSide: BorderSide(color: Colors.transparent,),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                // borderSide: BorderSide(color: Color(0xffffffff),),
                                borderSide: BorderSide(color: Colors.transparent,),
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                // borderSide: BorderSide(color: Color(0xffffffff),),
                                borderSide: BorderSide(color: Colors.transparent,),
                              ),                        ),
                          ),
                        ),
                      ),

                      InkWell(
                        onTap: (){},
                        child: Container(
                          // width: 230,
                          // height: 50,
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
                          child: TextField(
                            controller: emailCtrl,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: "Email",
                              hintStyle: TextStyle(
                                // color: Color(0xffffffff),
                                color: Color(0xff989898),
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w600,
                                /*fontSize: 15,*/
                                fontSize: isTablat?20:15,
                              ),
                              border: const UnderlineInputBorder(
                                // borderSide: BorderSide(color: Color(0xffffffff),),
                                borderSide: BorderSide(color: Colors.transparent,),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                // borderSide: BorderSide(color: Color(0xffffffff),),
                                borderSide: BorderSide(color: Colors.transparent,),
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                // borderSide: BorderSide(color: Color(0xffffffff),),
                                borderSide: BorderSide(color: Colors.transparent,),
                              ),
                            ),
                          ),
                        ),
                      ),

                      InkWell(
                        onTap: (){},
                        child: Container(
                          // width: 230,
                          // height: 50,
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
                          child: TextField(
                            controller: passCtrl,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: TextStyle(
                                // color: Color(0xffffffff),
                                color: Color(0xff989898),
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w600,
                                /*fontSize: 15,*/
                                fontSize: isTablat?20:15,
                              ),
                              border: const UnderlineInputBorder(
                                // borderSide: BorderSide(color: Color(0xffffffff),),
                                borderSide: BorderSide(color: Colors.transparent,),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                // borderSide: BorderSide(color: Color(0xffffffff),),
                                borderSide: BorderSide(color: Colors.transparent,),
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                // borderSide: BorderSide(color: Color(0xffffffff),),
                                borderSide: BorderSide(color: Colors.transparent,),
                              ),
                            ),
                          ),
                        ),
                      ),

                      // InkWell(
                      //   onTap: (){},
                      //   child: Container(
                      //     width: 230,
                      //     height: 50,
                      //     margin: EdgeInsets.symmetric(vertical: 10),
                      //     alignment: Alignment.center,
                      //     decoration: const BoxDecoration(
                      //       color: Color(0xffffffff),
                      //       borderRadius: BorderRadius.all(Radius.circular(100)),
                      //     ),
                      //     child: const Text("Sign up",
                      //       style: TextStyle(
                      //         // color: Color(0xffffffff),
                      //         color: Color(0xff1E7757),
                      //         fontFamily: 'Roboto',
                      //         fontWeight: FontWeight.w600,
                      //         fontSize: 15,
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      Row(

                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: (){
                              // Navigator.of(context).pop();

                              Navigator.of(context).pushReplacement(
                                NavigateWithOpaque(
                                  child: AuthScreen(start: false,),
                                  // duration: 200,
                                  direction: AxisDirection.right,
                                ),
                              );

                            },
                            child: Container(
                              // width: 50,
                              // height: 50,
                              /*
                              width: (50*scale)/mockupWidth*width,
                              height: (50*scale)/mockupHeight*height,*/
                              width: (50*scale)/mockupWidth*width,
                              height: (isTablat?50:50*scale)/mockupHeight*height,
                              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                // color: Color(0xff1E7757),
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
                              // child: const Text("Login",
                              //   style: TextStyle(
                              //     color: Color(0xffffffff),
                              //     fontFamily: 'Roboto',
                              //     fontWeight: FontWeight.w600,
                              //     fontSize: 15,
                              //   ),
                              // ),
                              child: Image.asset(
                                "assets/images/close1.png",
                                fit: BoxFit.fill,
                                scale: 3,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              final credentials = {
                                'email': emailCtrl.text.trim(),
                                'name': nameCtrl.text,
                                'password': passCtrl.text.trim(),
                                'serial': device==null?null:device!["serial"]!,
                              };

                              await Login.signUpWithEmail(context, credentials)
                                  .then((value) {
                                if(value!=null){
                                //   Navigator.pop(context);
                                  Navigator.of(context).pushReplacement(
                                    NavigateWithOpaque(
                                      child: AuthScreen(start: false,),
                                      // duration: 200,
                                      direction: AxisDirection.right,
                                    ),
                                  );
                                }
                              });

                              //     .then((value) async {
                              //
                              //       if(value!=null){
                              //         // DocumentSnapshot user = await Login.getUser(value);
                              //
                              //         // Navigator.pushReplacement(context, MaterialPageRoute(
                              //         //   builder: (context) => Screen3(user: user,),
                              //         // ));
                              //
                              //         // Navigator.of(context).pushReplacement(
                              //         //   NavigateWithOpaque(
                              //         //     // child: Screen2(user: user,),
                              //         //     child: Screen2(user: value,),
                              //         //     // duration: 200,
                              //         //     direction: AxisDirection.left,
                              //         //   ),
                              //         // );
                              //
                              //         Navigator.of(context).pushReplacement(
                              //           NavigateWithOpaque(
                              //             child: AuthScreen(),
                              //             // duration: 200,
                              //             direction: AxisDirection.right,
                              //           ),
                              //         );
                              //
                              //       }
                              //       else{
                              //         print("signup err");
                              //       }
                              //
                              // });

                            },
                            child: Container(
                              // width: 230,
                              // width: 156,
                              // height: 50,
                              width: (156*scale)/mockupWidth*width,
                              /*height: (50*scale)/mockupHeight*height,*/
                              height: (isTablat?50:50*scale)/mockupHeight*height,
                              margin: const EdgeInsets.symmetric(vertical: 10),
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
                              child: Text("Confirm",
                                style: TextStyle(
                                  color: Color(0xffffffff),
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w600,
                                  /*fontSize: 15,*/
                                  fontSize: isTablat?20:15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
            ),
                ),
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
      ),
    );
  }
}

import 'dart:async';
// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:f2f_puzzlegame/model/constants.dart';
// import 'package:f2f_puzzlegame/model/page_route.dart';
// import 'package:f2f_puzzlegame/view/auth_screen.dart';
// import 'package:f2f_puzzlegame/view/background_theme.dart';
// import 'package:f2f_puzzlegame/view/dialogs.dart';
// import 'package:f2f_puzzlegame/view/screen_2.dart';
import '../model/constants.dart';
import '../model/page_route.dart';
import '../view/auth_screen.dart';
import '../view/background_theme.dart';
import '../view/dialogs.dart';
import '../view/screen_2.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  Map<String, dynamic>? device;

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

  // TextEditingController nameCtrl = TextEditingController();
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
    // print("\n\n$width $height $scale");


    getUser() async {
      await Login.getAuthUser().then((value) {
        if(value!=null){
          print('email ${value.email}');
        }else{
          print('email ${null}');
        }
      });
    }
    getUser();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
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
        // color: Colors.transparent,
        child: Stack(
          children: [

            // backGround(display),

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
              // top: (59*scale) / mockupHeight * height,
              // left: (9*scale) / mockupWidth * width,

              /*
              top: (90*scale) / mockupHeight * height,
              left: (-44*scale) / mockupWidth * width,*/
              top: (isTablat?90:90*scale) / mockupHeight * height,
              left: (isTablat?40:-44*scale) / mockupWidth * width,
              // top: (59*scale) / mockupHeight * height,
              // left: (9*scale) / mockupWidth * width,
              child: Container(
                // height: 209.34,
                // width: 372,
                // width: display.width*0.95,
                // width: 478,
                // height: (209.34*scale) / mockupHeight * height,
                // width: (372*scale) / mockupWidth * width,
                // height: (209.34*scale) / mockupHeight * height,

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
              // top: (2*scale)/mockupHeight*height,
              child: SingleChildScrollView(
                child: Container(
                  width: width,
                  height: height,
                  // alignment: Alignment.bottomCenter,
                  alignment: Alignment.center,
                  // alignment: width<=450?Alignment.bottomCenter:Alignment.center,
                  // margin: EdgeInsets.symmetric(vertical: width<=450?10:200),
                  // margin: EdgeInsets.symmetric(vertical: 200),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      // Container(
                      //   // height: 209.34,
                      //   // width: 372,
                      //   // width: display.width*0.95,
                      //   // width: 478,
                      //   height: (209.34*scale) / mockupHeight * height,
                      //   width: (372*scale) / mockupWidth * width,
                      //   alignment: Alignment.bottomCenter,
                      //   child: Image.asset(
                      //     "assets/images/Spooky_Text_Effect 2.png",
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),

                      SizedBox(height: (200*scale)/mockupHeight*height,),

                      // InkWell(
                      //   onTap: (){},
                      //   child: Container(
                      //     width: 230,
                      //     height: 50,
                      //     alignment: Alignment.center,
                      //     margin: EdgeInsets.symmetric(vertical: 10),
                      //     decoration: const BoxDecoration(
                      //       color: Color(0xffffffff),
                      //       borderRadius: BorderRadius.all(Radius.circular(100)),
                      //     ),
                      //     child: TextField(
                      //       controller: nameCtrl,
                      //       textAlign: TextAlign.center,
                      //       keyboardType: TextInputType.text,
                      //       decoration: const InputDecoration(
                      //         hintText: "Name",
                      //         hintStyle: TextStyle(
                      //           // color: Color(0xffffffff),
                      //           color: Color(0xff989898),
                      //           fontFamily: 'Roboto',
                      //           fontWeight: FontWeight.w600,
                      //           fontSize: 15,
                      //         ),
                      //         border: UnderlineInputBorder(
                      //           borderSide: BorderSide(color: Color(0xffffffff),),
                      //         ),
                      //         focusedBorder: UnderlineInputBorder(
                      //           borderSide: BorderSide(color: Color(0xffffffff),),
                      //         ),
                      //         enabledBorder: UnderlineInputBorder(
                      //           borderSide: BorderSide(color: Color(0xffffffff),),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),

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
                            decoration: const InputDecoration(
                              hintText: "Email",
                              hintStyle: TextStyle(
                                // color: Color(0xffffffff),
                                color: Color(0xff989898),
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                              border: UnderlineInputBorder(
                                // borderSide: BorderSide(color: Color(0xffffffff),),
                                borderSide: BorderSide(color: Colors.transparent,),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                // borderSide: BorderSide(color: Color(0xffffffff),),
                                borderSide: BorderSide(color: Colors.transparent,),
                              ),
                              enabledBorder: UnderlineInputBorder(
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
                          margin: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
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
                            decoration: const InputDecoration(
                              hintText: "Password",
                              hintStyle: TextStyle(
                                // color: Color(0xffffffff),
                                color: Color(0xff989898),
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                              border: UnderlineInputBorder(
                                // borderSide: BorderSide(color: Color(0xffffffff),),
                                borderSide: BorderSide(color: Colors.transparent,),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                // borderSide: BorderSide(color: Color(0xffffffff),),
                                borderSide: BorderSide(color: Colors.transparent,),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                // borderSide: BorderSide(color: Color(0xffffffff),),
                                borderSide: BorderSide(color: Colors.transparent,),
                              ),
                            ),
                          ),
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: (){
                              // Navigator.of(context).pop();

                              // Navigator.of(context).pushReplacement(
                              //   NavigateWithOpaque(
                              //     child: AuthScreen(),
                              //     // duration: 200,
                              //     direction: AxisDirection.down,
                              //   ),
                              // );

                              // Navigator.of(context).pop();
                              Navigator.of(context).pushReplacement(
                                NavigateWithOpaque(
                                  // child: AuthScreen(start: false,),
                                  child: AuthScreen(start: true,),
                                  // duration: 200,
                                  direction: AxisDirection.right,
                                ),
                              );

                            },
                            child: Container(
                              // width: 50,
                              // height: 50,
                              width: (50*scale)/mockupWidth*width,
                              /*height: (50*scale)/mockupHeight*height,*/
                              height: (isTablat?50:50*scale)/mockupHeight*height,
                              // margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                              margin: EdgeInsets.only(left: 0, right: 24, top: 10, bottom: 10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
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
                              // Navigator.of(context).pushReplacement(
                              // Navigator.of(context).push(
                              //   // MaterialPageRoute(
                              //   //     builder: (context) => Screen2()
                              //   // ),
                              //   // NavigateTo(
                              //   // NavigateWithOpaque(
                              //   NavigateRight(
                              //     // duration: 200,
                              //     // direction: AxisDirection.right,
                              //     child: Screen2(),
                              //   ),
                              // );

                              final credentials = {
                                'email': emailCtrl.text.trim(),
                                'password': passCtrl.text.trim(),
                                'serial': device==null?null:device!["serial"]!,
                              };

                              // await Login.signInWithEmail(credentials)
                              //     .then((DocumentSnapshot? response) async {
                              //
                              //   print('value $response');
                              //
                              //   if(response!=null){
                              //     // DocumentSnapshot user = await Login.getUser(response);
                              //
                              //     // Navigator.pushReplacement(context, MaterialPageRoute(
                              //     //   builder: (context) => Screen3(user: user,),
                              //     // ));
                              //
                              //     Navigator.of(context).pushReplacement(
                              //       NavigateWithOpaque(
                              //         // child: Screen2(user: user,),
                              //         child: Screen2(user: response,),
                              //         // duration: 200,
                              //         direction: AxisDirection.left,
                              //       ),
                              //     );
                              //
                              //   }else{
                              //     // methods.showToast(context, msg: );
                              //     print("signup err");
                              //   }
                              //
                              // });

                              //final response =
                              await Login.signInWithEmail(context, credentials)
                                  .then((value) {
                                //Navigator.pop(context);
                                if(value!=null){
                                  Navigator.pop(context);
                                // Navigator.of(context).pushReplacement(
                                  Navigator.of(context).push(
                                  NavigateWithOpaque(
                                    child: AuthScreen(start: false,),
                                    // duration: 200,
                                    direction: AxisDirection.right,
                                  ),
                                );
                                }
                              });

                              // print('uid ${response!.id}');



                              //running
                              // if(response!=null){
                              //     Navigator.of(context).pushReplacement(
                              //       NavigateWithOpaque(
                              //         child: Screen2(user: response,),
                              //         direction: AxisDirection.left,
                              //       ),
                              //     );
                              //
                              //   }else{
                              //     // methods.showToast(context, msg: );
                              //     print("signin err");
                              //   }





                              // Navigator.of(context).pushReplacement(
                              //   NavigateWithOpaque(
                              //     child: Screen2(),
                              //     // duration: 200,
                              //     direction: AxisDirection.left,
                              //   ),
                              // );
                            },
                            child: Container(
                              // width: 230,
                              // width: 156,
                              // height: 50,
                              width: (156*scale)/mockupWidth*width,
                              /*height: (50*scale)/mockupHeight*height,*/
                              height: (isTablat?50:50*scale)/mockupHeight*height,
                              margin: EdgeInsets.symmetric(vertical: 10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
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

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //google
                          InkWell(
                            onTap: (){
                              // Navigator.of(context).pop();

                              final credential = {
                                'serial': device==null?null:device!["serial"]!,
                              };
                              Login.signInWithGoogle(context, credential).then((value) {
                                // Navigator.pop(context);
                                if(value!=null){
                                  // Navigator.pop(context);
                                  Navigator.of(context).pushReplacement(
                                    NavigateWithOpaque(
                                      // child: AuthScreen(start: false,),
                                      child: AuthScreen(start: true,),
                                      // duration: 200,
                                      direction: AxisDirection.right,
                                    ),
                                  );
                                }
                              });
                            },
                            child: Container(
                              width: 51,
                              height: 51,
                              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                // color: Color(0xff1E7757),
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                // boxShadow: [
                                //   const BoxShadow(
                                //     blurRadius: 14,
                                //     spreadRadius: 4,
                                //     offset: Offset(2, 6),
                                //     color: Color(0xff787878).withOpacity(0.25),
                                //   ),
                                // ],

                                //drop shadow effect
                                boxShadow: [
                                  BoxShadow(
                                    spreadRadius: 4,
                                    blurRadius: 14,
                                    offset: Offset(0,4),
                                      // color: Color(0xff787878),
                                    color: Color.fromRGBO(120, 120, 120, 0.25),
                                    // color: const colors.darkGray.withOpacity(0.25),
                                    // color: Color(0xff787878).withOpacity(0.25),
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                "assets/images/image 1.png",
                                fit: BoxFit.fill,
                                scale: 3,
                              ),
                            ),
                          ),
                          //facebook
                          InkWell(
                            onTap: (){
                              // Navigator.of(context).pop();
                              final credential = {
                                'serial': device==null?null:device!["serial"]!,
                              };
                              Login.signInWithFacebook(context, credential).then((value) {
                                // Navigator.pop(context);
                                if(value!=null){
                                  // Navigator.pop(context);
                                  Navigator.of(context).pushReplacement(
                                    NavigateWithOpaque(
                                      // child: AuthScreen(start: false,),
                                      child: AuthScreen(start: true,),
                                      // duration: 200,
                                      direction: AxisDirection.right,
                                    ),
                                  );
                                }
                              });
                            },
                            child: Container(
                              width: 51,
                              height: 51,
                              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                // color: Color(0xff1E7757),
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                // boxShadow: [
                                //   const BoxShadow(
                                //     blurRadius: 14,
                                //     spreadRadius: 4,
                                //     offset: Offset(2, 6),
                                //     color: Color(0xff787878).withOpacity(0.25),
                                //   ),
                                // ],

                                //drop shadow effect
                                boxShadow: [
                                  BoxShadow(
                                    spreadRadius: 4,
                                    blurRadius: 14,
                                    offset: Offset(0,4),
                                    // color: Color(0xff787878),
                                    color: Color.fromRGBO(120, 120, 120, 0.25),
                                    // color: const colors.darkGray.withOpacity(0.25),
                                    // color: Color(0xff787878).withOpacity(0.25),
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                "assets/images/image 2.png",
                                fit: BoxFit.fill,
                                scale: 3,
                              ),
                            ),
                          ),
                          // InkWell(
                          //   onTap: (){
                          //     // Navigator.of(context).pop();
                          //   },
                          //   child: Container(
                          //     width: 51,
                          //     height: 51,
                          //     margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          //     alignment: Alignment.center,
                          //     decoration: const BoxDecoration(
                          //       // color: Color(0xff1E7757),
                          //       color: Color(0xffffffff),
                          //       borderRadius: BorderRadius.all(Radius.circular(10)),
                          //       // boxShadow: [
                          //       //   const BoxShadow(
                          //       //     blurRadius: 14,
                          //       //     spreadRadius: 4,
                          //       //     offset: Offset(2, 6),
                          //       //     color: Color(0xff787878).withOpacity(0.25),
                          //       //   ),
                          //       // ],
                          //
                          //       //drop shadow effect
                          //       boxShadow: [
                          //         BoxShadow(
                          //           spreadRadius: 4,
                          //           blurRadius: 14,
                          //           offset: const Offset(0,4),
                          //           // color: Color(0xff787878),
                          //           color: Color.fromRGBO(120, 120, 120, 0.25),
                          //           // color: const colors.darkGray.withOpacity(0.25),
                          //           // color: Color(0xff787878).withOpacity(0.25),
                          //         ),
                          //       ],
                          //     ),
                          //     child: Image.asset(
                          //       "assets/images/image 3.png",
                          //       fit: BoxFit.fill,
                          //       scale: 3,
                          //     ),
                          //   ),
                          // ),

                          // Expanded(flex: 1,child: Container()),
                        ],
                      ),


                      InkWell(
                        onTap: () async {

                          // final credentials = {
                          //   'email': emailCtrl.text,
                          //   'password': passCtrl.text,
                          // };
                          //
                          // final response = await Login.signInWithEmail(credentials);
                          //
                          // // print('uid ${response!.id}');
                          //
                          // if(response!=null){
                          //   Navigator.of(context).pushReplacement(
                          //     NavigateWithOpaque(
                          //       child: Screen2(user: response,),
                          //       direction: AxisDirection.left,
                          //     ),
                          //   );
                          //
                          // }else{
                          //   // methods.showToast(context, msg: );
                          //   print("signin err");
                          // }
                          //
                          // // Navigator.of(context).pushReplacement(
                          // //   NavigateWithOpaque(
                          // //     child: Screen2(),
                          // //     // duration: 200,
                          // //     direction: AxisDirection.left,
                          // //   ),
                          // // );

                          if(emailCtrl.text==""){
                            Dialogs.dialogAlert(context, "please enter email to reset password!", "Alert!");
                            return;
                          }

                          await Login.forgetPassword(context, emailCtrl.text.trim());

                        },
                        child: Container(
                          // width: 230,
                          width: 156,
                          // height: 50,
                          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            // color: Color(0xff1E7757),
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
                          child: const Text("Forget Password",
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

import 'dart:async';
import 'dart:math';
// import 'dart:math';
// import 'dart:html';
// import 'dart:html';

import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import 'package:f2f_puzzlegame/model/constants.dart';
// import 'package:f2f_puzzlegame/model/page_route.dart';
// import 'package:f2f_puzzlegame/view/auth_screen.dart';
import '../model/constants.dart';
import '../model/page_route.dart';
import '../view/auth_screen.dart';

// import 'package:f2f_puzzlegame/view/screen_2.dart';
// import 'package:f2f_puzzlegame/widgets/widget.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
// import 'package:lottie/lottie.dart';
// import 'package:pixel_perfect/pixel_perfect.dart';

import 'background_theme.dart';
import 'dialogs.dart';

// import 'dart:math' as math;

class Screen4 extends StatefulWidget {
  const Screen4({Key? key,
    required this.level,
    required this.mode,
    required this.user,
    // required this.mAudio,
    this.isDailyChallenge = false,
  }) : super(key: key);

  final String level;
  final String mode;
  final DocumentSnapshot user;
  final bool isDailyChallenge;
  // final MAudio? mAudio;

  @override
  State<Screen4> createState() => _Screen4State();
}

// class _Screen4State extends State<Screen4> {
// class _Screen4State extends State<Screen4> with WidgetsBindingObserver {
class _Screen4State extends State<Screen4> with WidgetsBindingObserver, SingleTickerProviderStateMixin {


  // late Future< Map<String, dynamic> > boardData;
  Map<String, dynamic> boardData
  // Map<String, dynamic> boardData1
  = {
    "board1":  [
      ["A","","15","","","A","20","3","19","12","","16",""],
      ["18","E","E","15","E","D","","12","","4","P","E","12"],
      ["A","","7","","","4","5","5","E","15","","20",""],
      ["15","4","17","1","E","15","","E","","6","A","20","1"],
      ["","","E","","22","12","4","15","1","","16","","3"],
      ["15","E","22","E","1","","11","","14","4","17","20","D"],
      ["3","","1","","A","19","3","20","E","","12","","E"],
      ["19","20","3","12","1","","D","","12","4","D","E","22"],
      ["23","","12","","E","20","E","8","1","","A","",""],
      ["1","17","19","22","","E","","23","9","E","12","A","22"],
      ["","12","","3","6","A","19","E","","","1","","E"],
      ["E","D","3","1","","2","","E","10","4","20","10","E"],
      ["","4","","22","P","9","E","15","","","9","","2"],
    ],
    "board":  [
      ["21","","15","","","21","20","3","19","12","","16",""],
      ["18","13","13","15","13","25","","12","","4","26","13","12"],
      ["21","","7","","","4","5","5","13","15","","20",""],
      ["15","4","17","1","13","15","","13","","6","21","20","1"],
      ["","","13","","22","12","4","15","1","","16","","3"],
      ["15","13","22","13","1","","11","","14","4","17","20","25"],
      ["3","","1","","21","19","3","20","13","","12","","13"],
      ["19","20","3","12","1","","25","","12","4","25","13","22"],
      ["23","","12","","13","20","13","8","1","","21","",""],
      ["1","17","19","22","","13","","23","9","13","12","21","22"],
      ["","12","","3","6","21","19","13","","","1","","13"],
      ["13","25","3","1","","2","","13","10","4","20","10","13"],
      ["","4","","22","26","9","13","15","","","9","","2"],
    ],
    "script": {
      "1": "",
      "2": "",
      "3": "",
      "4": "",
      "5": "",
      "6": "",
      "7": "",
      "8": "",
      "9": "",
      "10": "",
      "11": "",
      "12": "",
      "13": "E",//
      "14": "",
      "15": "",
      "16": "",
      "17": "",
      "18": "",
      "19": "",
      "20": "",
      "21": "A",//
      "22": "",
      "23": "",
      "24": "",
      "25": "D",//
      "26": "P",//
    },
    "script1": {
      "13": "E",//
      "21": "A",//
      "25": "D",//
      "26": "P",//
    },
    "history": {

    },
    "result" : {
      "1": "T",
      "2": "K",
      "3": "I",
      "4": "O",
      "5": "F",
      "6": "M",
      "7": "Q",
      "8": "C",
      "9": "Y",
      "10": "V",
      "11": "X",
      "12": "N",
      "13": "E",//
      "14": "Z",
      "15": "R",
      "16": "B",
      "17": "U",
      "18": "J",
      "19": "G",
      "20": "L",
      "21": "A",//
      "22": "S",
      "23": "H",
      "24": "W",//W
      "25": "D",//
      "26": "P",//
    },
  };

  int maxCorrect = 1000;//5
  int corrected = 0;
  int usedHint = 0;
  String hintTime = '00:00';
  int mistakes = 0;
  String selectedKey = "";
  String keypad = "";

  bool boardClick = false;

  bool hint = false;
  bool last = false;
  bool nHint = false;

  late DocumentSnapshot user;

  String playLevel = "Level 1";
  String playTime = "00:00";
  // String startTime = "00:00";
  DateTime? startTime;
  DateTime? currentTime;
  // Timer timer;

  String currentLevel = "1";

  bool gameEnd = false;
  bool gameWin = false;
  bool gameWinAnimate = true;
  bool gameWinRepeat = true;
  bool pointsCollected = false;

  int sec= 0, min=0, hour=0;

  late Map<String, dynamic> data = {};

  int getLastPuzzle(){
    int last = 0;
    switch(widget.mode){
      // case "Easy":
      //   last = 150;
      //   break;
      // case "Medium":
      //   last = 370;
      //   break;
      // case "Hard":
      //   last = 50;
      //   break;
      // case "Impossible":
      //   last = 80;
      //   break;

      case 'Easy':
        last = 146;
        break;
      case 'Medium':
        last = 400;
        break;
      case 'Hard':
        last = 36;
        break;
      case 'Impossible':
        last = 98;
        break;

    }

    return last;
  }

  // bool showProgress = false;

  onKeyPress(e, input) async {

    if(e!=""){

      if((boardData["script1"] as Map<String, dynamic>).containsValue('${e}')){
        return;
      }

      // if(!(boardData["script"] as Map<String, dynamic>).containsValue('${e}')){
      if(!(boardData["script"] as Map<String, dynamic>).containsValue('${e}')
          && !(boardData["script1"] as Map<String, dynamic>).containsKey('${selectedKey}')){

        // if(selectedKey!=""){
        print('selectedKey = ${selectedKey}');
        setState(() {
          keypad = e;
          // selectedKey="";
        });
        print("script ${(boardData["script"] as Map<String, dynamic>)}");
        // print('selectedKey = ${selectedKey}');
        print('keypad = ${keypad}');

        // (boardData["script"] as Map<String, dynamic>)[selectedKey] = Keypad;
        // (boardData["script"] as Map<String, dynamic>).putIfAbsent(selectedKey, (){Keypad;});

        // (boardData["script"] as Map<String, dynamic>).putIfAbsent(selectedKey, ()=> Keypad);
        (boardData["script"] as Map<String, dynamic>).update(selectedKey, (v)=> v=keypad);

        // print((boardData["history"] as Map<dynamic, dynamic>).values.length);

        print('history = ${(boardData["history"] as Map<dynamic, dynamic>)}');

        int historyLength = (boardData["history"] as Map<dynamic, dynamic>).values.length;
        if(historyLength < maxCorrect){
          (boardData["history"] as Map<dynamic, dynamic>).putIfAbsent('${historyLength+1}', ()=> selectedKey);
          // (boardData["history"] as Map<String, dynamic>).update(selectedKey, (v)=> v=keypad);
          setState(() {
            boardData;
          });
          print('history = ${(boardData["history"] as Map<dynamic, dynamic>)}');

          if(input=="keypad"){
            setState(() {
              selectedKey = "";
              keypad = "";
            });
          }

        }
        // else{
        //   // (boardData["history"] as Map<String, dynamic>).putIfAbsent(selectedKey, ()=> Keypad);
        // }

        setState(() {
          boardData;
        });

        print("script ${(boardData["script"] as Map<String, dynamic>)}");
        // }


        // bool condition = false;
        // (boardData["board"] as List).map((value) {
        //   (value as List).map((e) {
        //     i
        //   });
        // });
        // print('condition $condition');
        // print('board ${boardData["board"]}');

        // print('con1 ${!(boardData["script"] as Map<String, dynamic>).containsValue("")
        //     || !(boardData["board"] as Map<String, dynamic>).containsValue("")}');
        // print('con2 ${!(boardData["board"] as Map<String, dynamic>).containsValue("")}');


          //if(!(boardData["script"] as Map<String, dynamic>).containsValue("")){
        bool isNotEmpty = true;
        // final match = RegExp(r'^[a-zA-Z]');
        // final match = RegExp(r'^[0-9]');
        for (var e in (boardData["board"] as List)) {
          for (var e1 in (e as List)) {
            // if(e1 == ""){
            //   isNotEmpty = false;
            //   break;
            // }

            if(e1 != ""){
              // int.parse(e1)
              // if(match.hasMatch(e1)) isNotEmpty = false;
              // print('match ${match.hasMatch(e1)}');

              print('e1 $e1');
              print("value ${(boardData["script"] as Map<String, dynamic>)["$e1"]}");

              if((boardData["script"] as Map<String, dynamic>)["$e1"] == "")  isNotEmpty = false;
              // break;
            }

          }
        }

        // print('boardData["board"] ${boardData["board1"]}');
        print('isNotEmpty $isNotEmpty');

        // if(!(boardData["script"] as Map<String, dynamic>).containsValue("")){
        if(!(boardData["script"] as Map<String, dynamic>).containsValue("") || isNotEmpty){

        // if(!(boardData["script"] as Map<String, dynamic>).containsValue("")
        //     || !(boardData["board"] as Map<String, dynamic>).containsValue("")){
        // if(condition){


          List wrongLetters = [];
          String wrongLetters_ = '';
          bool isIncomplete = false;
          final compare = (boardData["result"] as Map<String, dynamic>);
          final answers = (boardData["script"] as Map<String, dynamic>);
          final defaultLetters = (boardData["script1"] as Map<String, dynamic>);
          for(int i=1; i<=26; i++){
            print('i $i');
            if(answers.containsKey('$i')){
              // print('answers[\'$i\'] == compare[\'$i\'] ${answers['$i']} == ${compare['$i']}');
              // print('!defaultLetters.containsKey(\'$i\') ${!defaultLetters.containsKey('$i')}');
              if(!defaultLetters.containsKey('$i')){
                print('checking...');
                if(answers['$i'] != compare['$i']){
                  wrongLetters.add(answers['$i']);
                  isIncomplete = true;
                  if(wrongLetters_==""){
                    wrongLetters_ = answers['$i'];
                  }else{
                    wrongLetters_ += ",${answers['$i']}";
                  }
                }
              }
            }
          }

          print('wrongLetters $wrongLetters');
          print('isIncomplete $isIncomplete');

          if(isIncomplete){
            //dialog
            print('Puzzle Incomplete!\n You entered below wrong letters : $wrongLetters_');

            showTransitionDialog(context: context, child: dialogIncompletePuzzle(context, wrongLetters_));

            return;
          }
          // return;

          print("Game Completed....");
          // print('${boardData["board"]}');

          setState(() {
            showProgress = true;
          });

          // Future.delayed(const Duration(seconds: 3),() async {
          Future.delayed(const Duration(seconds: 1),() async {

            setState(() {
              gameEnd = true;
            });
            print("gameEnd $gameEnd");

            String timeTaken = playTime;
            String hintCredit = "6:20";

            // int savedTime = DateFormat("mm:ss").parse(timeTaken).second;
            // int totalTime = DateFormat("mm:ss").parse(timeTaken).second
            //   + DateFormat("mm:ss").parse(hintCredit).second;

            List ts = playTime.split(":");
            int savedTime = int.parse(ts[ts.length-2])*60 + int.parse(ts[ts.length-1])*1;
            // int totalTime = savedTime;
            print('savedTime $savedTime');

            double pnt = 0;
            if(widget.mode == "Easy"){
              if(timerOn){
                // pnt += 10;
                pnt += savedTime * 1;//180
                // print('pnt $pnt');
                // pnt = pnt>180?0:pnt;
                // pnt = pnt>180?10:pnt;
                pnt = savedTime>180 || savedTime==0?10:(pnt+20);
              }else{
                pnt = 10;
              }
            } else if(widget.mode == "Medium"){
              if (timerOn){ // pnt += 20;
                pnt += savedTime * 1.5; //450
                // pnt = pnt>300?0:pnt;
                // pnt = pnt>300?20:pnt;
                pnt = savedTime > 300 || savedTime == 0 ? 20 : (pnt + 40);
              }else{
                pnt = 20;
              }
            } else if(widget.mode == "Hard"){
              if(timerOn){ // pnt += 30;
                pnt += savedTime * 2;
                // pnt = pnt>420?0:pnt;
                // pnt = pnt>420?30:pnt;
                pnt = savedTime > 420 || savedTime == 0 ? 30 : (pnt + 60);
              }else{
                pnt = 30;
              }
            } else if(widget.mode == "Impossible"){
              if(timerOn){ // pnt += 40;
                pnt += savedTime * 2.5;
                // pnt = pnt>600?0:pnt;
                // pnt = pnt>600?40:pnt;
                pnt = savedTime > 600 || savedTime == 0 ? 40 : (pnt + 80);
              }else{
                pnt = 40;
              }
            }

            // switch(widget.level){
            //   case "Easy":
            //     // pnt = savedTime * 1;
            //     // if(savedTime > 3*60){
            //     //   pnt = 0;
            //     // }
            //     pnt = savedTime * 1;
            //     print('pnt $pnt');
            //     pnt = pnt>180?0:pnt;
            //     break;
            //   case "Medium":
            //     pnt = savedTime * 1.5;
            //     // if(savedTime > 5*60){
            //     //   pnt = 0;
            //     // }
            //     pnt = pnt>300?0:pnt;
            //     break;
            //   case "Hard":
            //     pnt = savedTime * 2;
            //     // if(savedTime > 7*60){
            //     //   pnt = 0;
            //     // }
            //     pnt = pnt>420?0:pnt;
            //     break;
            //   case "Impossible":
            //     pnt = savedTime * 2.5;
            //     // if(savedTime > 10*60){
            //     //   pnt = 0;
            //     // }
            //     pnt = pnt>600?0:pnt;
            //     break;
            // }
            print('points $pnt');

            final preKey = (boardData["script1"] as Map<String, dynamic>).length;
            final ans = (boardData["script"] as Map<String, dynamic>);
            final answer = (boardData["result"] as Map<String, dynamic>);
            int totalCorrect = 0; int corr = 0; int fals = 0;
            for(var e in ans.keys) {
              // print('e $e');
              if(ans[e] == answer[e]){
                corr += 1 ;
              }else{
                fals +=1;
              }
            }

            print("true $corr false $fals");
            // ans.map((key, value) => null)

            //corrected = corr - preKey;
            // setState(() {
            //   corrected;
            // });

            print('corr & preKey $corr $preKey');

            totalCorrect = corr - preKey;

            int checkPoint = 0;
            if(widget.mode=="Easy"){
              checkPoint = 10;
            }else if(widget.mode=="Medium"){
              checkPoint = 20;
            }else if(widget.mode=="Hard"){
              checkPoint = 30;
            }else if(widget.mode=="Impossible"){
              checkPoint = 40;
            }


            //if(pnt>0){//show animation
            if(pnt>checkPoint){//show animation

              Login.updateWinData();

              setState(() {
                gameWin = true;
                // gameWinAnimate = true;
              });

              //??
              // (!user["sound"])? null :
              // gameWin?Sounds.gameLooseSound:Sounds.pointsCollect;

              /*if(gameWin){
                // dialogWin(context, mAudio, user, winMethod);
                //dialogWin(context, user, winMethod);
                winMethod();
              }*/
              if(gameWin){
                // winMethod();
                {
                  setState(() {
                    gameWin = false;
                    // gameWinAnimate = false;
                  });

                  // await Sounds.pointsCollect;

                  /*(!user["sound"])? null :
                  await AudioCache().play('sounds/${Sound.PointsCollect}');*/

                  setState(() {
                    showProgress = false;
                  });

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
                        showProgress = true;
                      });

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
                        // if (int.parse(currentLevel) > 1) {
                        if (int.parse(currentLevel) >= 1) {

                          setState(() {
                            currentLevel =
                            '${int.tryParse(currentLevel)! + 1}';
                          });

                          int lastPuzzle = getLastPuzzle();
                          Random random = Random();
                          final v_ = random.nextInt(lastPuzzle);
                          // late String res = "$v_";
                          late String res = v_==0?"1":"$v_";
                          print("res ?? $res");
                          setState(() {
                            currentLevel = res;
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

                          // adProvider.initializeRewarded();
                          try{
                            adProvider.initializeRewarded();
                          }catch(e){
                            print('adProvider err');
                          }

                          setState(() {
                            showProgress = false;
                          });

                        }
                      });
                    }
                    else if(value==0){

                      /*(!user["sound"])? null :
        Sounds.buttonClick;*/
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
                          child: AuthScreen(start: false, isGuestMode: widget.user["login_mode"]=="Guest",),
                          direction: AxisDirection.down,
                        ),
                      );

                    }

                    // }
                  });
                }
              }

            }

           /* (!user["sound"])? null :
            pnt==checkPoint? await AudioCache().play('sounds/${Sound.GameLoose}')
                :
            pnt>checkPoint? await AudioCache().play('sounds/${Sound.GameWin}'):null;*/

            widget.isDailyChallenge?pnt*2:null;//2x points
            widget.isDailyChallenge?Login.updateDailyChallenge(user['id']):null;


            String availableTime = "00:00";
            String spendTime = "";
            int sTime = 0;

            print('hintTime $hintTime');
            final arr1 = hintTime.split(":");
            int hTime = int.parse(arr1[0])*60 + int.parse(arr1[1])*1;

            if(widget.mode=="Easy"){
              availableTime = "03:00";//3 min
              sTime = 180 - savedTime;
            } else if(widget.mode=="Medium"){
              availableTime = "05:00";//5 min
              sTime = 300 - savedTime;
            } else if(widget.mode=="Hard"){
              availableTime = "07:00";//7 min
              sTime = 420 - savedTime;
            } else if(widget.mode=="Impossible"){
              availableTime = "10:00";//10 min
              sTime = 600 - savedTime;
            }

            sTime += hTime;

            // String res = (savedTime/60).toString();
            String res = (sTime/60).toString();

            if(!res.contains(".")) res = "$res.0";

            print('sTime $sTime');
            print('res $res');

            final arr = res.split(".");
            // String lS = ((int.parse(arr[1])*60).roundToDouble()).toString();

            // String lS = ((int.parse("0.${arr[1]}")*60).round()).toString();
            String lS = ((double.parse("0.${arr[1]}")*60).round()).toString();
            print('lS $lS');
            if(lS.length>2){
              lS = lS.substring(0,2);
            }
            if(savedTime>0){
              spendTime = "${arr[0].length==1?"0${arr[0]}":arr[0]}:${lS.length==1?"0${lS}":lS}";
            }else{
              spendTime = availableTime;
            }

            // Map<String, dynamic> data =  {
            data =  {
              // "correct-word": 20,
              // "hint-used": 5,
              // "point": 15,
              // "correct-word": corrected,
              "correct-word": totalCorrect,
              "hint-used": usedHint,
              "hint-time": hintTime,
              // "point": pnt.round(),
              "point": totalCorrect<1 ? 0 : pnt.round(),

              // "hint-credit": "6:20",
              // "time-taken": "7:27",
              // "total-time": "13:47",
              "hint-credit": "${hintCredit}",
              "time-taken": "${timeTaken}",
              // "total-time": "${totalTime}",
              // "total-time": "${playTime}",
              // "total-time": "${spendTime}",
              "total-time": "${timerOn?spendTime:"00:00"}",

              // "total-time": "${DateFormat("hh:mm:ss").format()}",


            };

            if(!mounted) return;
            setState(() {
              data;
            });

            // Login.updateTotalPoints(widget.user['id'], (data["point"] as int));
            Login.updateTotalPoints(user['id'], (data["point"] as int));

            // int lastPuzzle = getLastPuzzle();

            Map<String, dynamic> udata = {
              // 'points': data["point"],
              'points': {
                // 'easy': widget.mode=="Easy"? ((data["point"] as int) + (widget.user['points.easy'] as int)) : widget.user['points.easy'],
                // 'medium': widget.mode=="Medium"? ((data["point"] as int) + (widget.user['points.medium'] as int)) : widget.user['points.medium'],
                // 'hard': widget.mode=="Hard"? ((data["point"] as int) + (widget.user['points.hard'] as int)) : widget.user['points.hard'],
                // 'impossible': widget.mode=="Impossible"? ((data["point"] as int) + (widget.user['points.impossible'] as int)) : widget.user['points.impossible'],
                'easy': widget.mode=="Easy"? (data["point"] as int) : null,
                'medium': widget.mode=="Medium"? (data["point"] as int) : null,
                'hard': widget.mode=="Hard"? (data["point"] as int) : null,
                'impossible': widget.mode=="Impossible"? (data["point"] as int) : null,
              },
              'rank': 0,

              "hint-time": data["hint-time"],
              'hints': data["hint-used"],
              'played': 1,
              'time': data["total-time"],

              'easy': widget.mode=="Easy"? ((int.parse(widget.level))+1) :null,
              'medium': widget.mode=="Medium"? ((int.parse(widget.level))+1) :null,
              'hard': widget.mode=="Hard"? ((int.parse(widget.level))+1) :null,
              'impossible': widget.mode=="Impossible"? ((int.parse(widget.level))+1) :null,

              // 'easy': widget.mode=="Easy"? int.parse(currentLevel) == lastPuzzle? 1 : ((int.parse(widget.level))+1) :null,
              // 'medium': widget.mode=="Medium"?  int.parse(currentLevel) == lastPuzzle? 1 : ((int.parse(widget.level))+1) :null,
              // 'hard': widget.mode=="Hard"?  int.parse(currentLevel) == lastPuzzle? 1 : ((int.parse(widget.level))+1) :null,
              // 'impossible': widget.mode=="Impossible"?  int.parse(currentLevel) == lastPuzzle? 1 : ((int.parse(widget.level))+1) :null,

            };

            // print('uid ${widget.user.id}');
            // Login.setPlayData(widget.user.id, data: udata);
            Login.setPlayData(user.id, data: udata);

            // if(pnt==0){
            //   // await methods.playSound(file: "soundscrate-graphics-game-blip-2")
            //   await methods.playSound(file: "Lose-sound-effect")
            //       .then((value) {
            //   });
            // }else{
            //   await methods.playSound(file: "Power-Points-Sound-Effect")
            //       .then((value) {
            //   });
            // }

            // showDialog(
            //     context: context,
            //     // barrierDismissible: false,
            //     builder: (context) => dialogUserBoard(widget.mode, widget.level, widget.user, data)
            // );



            // await methods.playSound(file: pnt==0?"Lose-sound-effect":"Power-Points-Sound-Effect")
            //     .then((value) {

            //pnt==0?Sounds.gameLooseSound:Sounds.pointsCollect;

            /*int checkPoint = 0;
            if(widget.mode=="Easy"){
              checkPoint = 10;
            }else if(widget.mode=="Medium"){
              checkPoint = 20;
            }else if(widget.mode=="Hard"){
              checkPoint = 30;
            }else if(widget.mode=="Impossible"){
              checkPoint = 40;
            }

            (!user["sound"])? null :
            // pnt==0? await AudioCache().play('sounds/${Sound.GameLoose}')
            pnt==checkPoint? await AudioCache().play('sounds/${Sound.GameLoose}')
            : //await AudioCache().play('sounds/${Sound.PointsCollect}');
            // null;
            pnt>checkPoint? await AudioCache().play('sounds/${Sound.GameWin}'):null;*/


            setState(() {
              showProgress = false;
            });

            //game loose
            // pnt>0? null :
            pnt>checkPoint? null :
              //Future.delayed(const Duration(seconds: 1),(){
              Future.delayed(const Duration(milliseconds: 200), (){
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    // builder: (context) => dialogUserBoard(widget.mode, widget.level, widget.user, data, adProvider)
                    // builder: (context) => dialogUserBoard(context,widget.mode, currentLevel, widget.user, data, adProvider)
                    // builder: (context) => dialogUserBoard(context,widget.mode, currentLevel, user, data, adProvider)
                    builder: (context) => dialogUserBoard(context,widget.mode, currentLevel, user, data, adProvider, isDailyChallange: widget.isDailyChallenge)
                ).then((value) {
                  /*
                  // if(value){

                  // setState(() {
                  //   pointsCollected = true;
                  // });

                  Future.delayed(const Duration(seconds: 2), () async {
                    // setState(() {
                    //   pointsCollected = false;
                    // });


                    user = await Database.pathData("users").doc(user['id']).get();
                    setState(() {
                      user;
                    });


                    if(int.parse(currentLevel)>1){
                      setState(() {
                        currentLevel = '${int.tryParse(currentLevel)!+1}';
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
                      });

                      adProvider.initializeRewarded();
                    }
                  });

                  // }
                  */

                  print('value dialog ${value}');

                  if(value==1){
                    // setState(() {
                    //   pointsCollected = true;
                    // });

                    setState(() {
                      showProgress = true;
                    });

                    // Future.delayed(const Duration(seconds: 2), ()//2 sec animation
                    Future.delayed(const Duration(seconds: 1), ()//2 sec animation
                    async {

                      user = await Database.pathData("users").doc(user['id']).get();
                      setState(() {
                        user;
                      });

                      // setState(() {
                      //   pointsCollected = false;
                      // });
                      // if (int.parse(currentLevel) > 1) {
                      if (int.parse(currentLevel) >= 1) {

                        // int lastPuzzle = getLastPuzzle();
                        // print('last puzzle $lastPuzzle');

                        // if(int.parse(currentLevel) == lastPuzzle){
                        //
                        //   currentLevel = "1";
                        //   setState(() {
                        //     currentLevel;
                        //   });
                        //
                        // }else{
                        //   setState(() {
                        //     currentLevel =
                        //     '${int.tryParse(currentLevel)! + 1}';
                        //   });
                        // }

                        setState(() {
                          currentLevel =
                          '${int.tryParse(currentLevel)! + 1}';
                        });

                        int lastPuzzle = getLastPuzzle();
                        Random random = Random();
                        final v_ = random.nextInt(lastPuzzle);
                        // late String res = "$v_";
                        late String res = v_==0?"1":"$v_";
                        print("res ?? $res");
                        setState(() {
                          currentLevel = res;
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

                        // adProvider.initializeRewarded();
                        try{
                          adProvider.initializeRewarded();
                        }catch(e){
                          print('adProvider err');
                        }

                        setState(() {
                          showProgress = false;
                        });

                      }
                    });
                  }
                  else if(value==0){

                    /*(!user["sound"])? null :
                    Sounds.buttonClick;*/
                    // // Navigator.of(context).pop()
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
                        child: AuthScreen(start: false, isGuestMode: widget.user["login_mode"]=="Guest",),
                        direction: AxisDirection.down,
                      ),
                    );

                  }
                });
              });
            // });
            /**/

          });




        }

      }
      else if((boardData["script"] as Map<String, dynamic>).containsValue('${e}')
          && !(boardData["script1"] as Map<String, dynamic>).containsKey('${selectedKey}')){
        print("executing else...");

        print('selectedKey = ${selectedKey}');
        setState(() {
          keypad = e;
          // selectedKey="";
        });
        print("script ${(boardData["script"] as Map<String, dynamic>)}");
        // print('selectedKey = ${selectedKey}');
        print('keypad = ${keypad}');

        for(var e in (boardData["script"] as Map<String, dynamic>).entries){
          print('Script -> $e');
          if(e.value == keypad){
            (boardData["script"] as Map<String, dynamic>).update(e.key, (v)=> v="");
          }
        }
        // (boardData["script"] as Map<String, dynamic>)[""]

        (boardData["script"] as Map<String, dynamic>).update(selectedKey, (v)=> v=keypad);

        print('history = ${(boardData["history"] as Map<dynamic, dynamic>)}');

        int historyLength = (boardData["history"] as Map<dynamic, dynamic>).values.length;
        if(historyLength < maxCorrect){
          (boardData["history"] as Map<dynamic, dynamic>).putIfAbsent('${historyLength+1}', ()=> selectedKey);
          // (boardData["history"] as Map<String, dynamic>).update(selectedKey, (v)=> v=keypad);
          setState(() {
            boardData;
          });
          print('history = ${(boardData["history"] as Map<dynamic, dynamic>)}');

          if(input=="keypad"){
            setState(() {
              selectedKey = "";
              keypad = "";
            });
          }

        }

        setState(() {
          boardData;
        });

        print("script ${(boardData["script"] as Map<String, dynamic>)}");


      }

    }else{

      int historyLength = (boardData["history"] as Map<dynamic, dynamic>).values.length;
      // if(historyLength < maxCorrect){
      if(corrected < maxCorrect){

        print("script ${(boardData["script"] as Map<String, dynamic>)}");
        (boardData["script"] as Map<String, dynamic>).update(
            (boardData["history"] as Map<dynamic, dynamic>)['${historyLength}'], (v)=> v="");
        print("script ${(boardData["script"] as Map<String, dynamic>)}");

        setState(() {
          boardData;
        });

        print('history = ${(boardData["history"] as Map<dynamic, dynamic>)}');
        (boardData["history"] as Map<dynamic, dynamic>).remove('${historyLength}');
        setState(() {
          boardData;
        });
        print('history = ${(boardData["history"] as Map<dynamic, dynamic>)}');

        setState(() {
          corrected += 1;
        });
        print('corrected ${corrected}');
      }

      setState(() {
        boardData;
      });

      print("script ${(boardData["script"] as Map<String, dynamic>)}");

      setState(() {
        selectedKey = "";
        keypad = "";
      });
    }
  }

  showTime(){

    setState(() {
      // if(!timerOn) playTime = "";
      if(!timerOn) playTime = "00:00";
    });

    startTime = DateTime.now();
    currentTime = startTime;

    /*
    setState(() {
      // sec=60; min=3; hour=0;
      sec=60; min=1; hour=0;
    });

    // bool last = false;

    if(widget.mode=="Easy"){
      min=2;//3 min
    } else if(widget.mode=="Medium"){
      min=4;//5 min
    } else if(widget.mode=="Hard"){
      min=6;//7 min
    } else if(widget.mode=="Impossible"){
      min=9;//10 min
    }

    setState(() {
      min;
    });

    */
    setMinute();

    Timer.periodic(const Duration(seconds: 1) , (timer) {

      if(!gameEnd){

        // if(hour>=12){
        //   hour = 1;
        // }

        // if(min>=59){
        //   // min = 0;
        //   // hour += 1;
        //   min = 60;
        //   hour -= 1;
        // }


        if(!(min<0)){



          if(sec==1 || sec==0){
            // sec = 0;
            // min += 1;

            if(sec==1){
              sec-=1;
              min>0?min -= 1:null;

              // min>0?null:last=true;
              // setState(() {
              //   last;
              // });
            }else{
              last?null:sec = 59;

              min>0?null:last=true;

              // sec = 60;
            }
            // sec-=1;
          }
          else{
            // sec+=1;
            sec-=1;
          }

          if(min!=0 || sec!=0){

            if (!mounted) {
              return;
            }

            setState(() {hour; min; sec;});

            String time = "${(min.toString().length==1)?'0${min}':min} : ${(sec.toString().length==1)?'0${sec}':sec}";
            time = hour>0?"${(hour.toString().length==1)?'0${hour}':hour} : ${time}": time;

            if (!mounted) {
              return;
            }
            // setState(() {
            //   playTime = time;
            // });

            setState(() {
              if(timerOn) playTime = time;
            });

            //

          }
          else{
            // setState(() {
            //
            // });

            String time = "${(min.toString().length==1)?'0${min}':min} : ${(sec.toString().length==1)?'0${sec}':sec}";
            time = hour>0?"${(hour.toString().length==1)?'0${hour}':hour} : ${time}": time;

            if(!mounted) return;
            // setState(() {
            //   playTime = time;
            // });

            setState(() {
              if(timerOn) playTime = time;
            });

          }

          // String time = "${(min.toString().length==1)?'0${min}':min} : ${(sec.toString().length==1)?'0${sec}':sec}";
          // time = hour>0?"${(hour.toString().length==1)?'0${hour}':hour} : ${time}": time;
          //
          // setState(() {
          //   playTime = time;
          // });


        }


      }

    });

  }
  showTimeOld(){
    startTime = DateTime.now();
    currentTime = startTime;

    // int sec= 0;
    // int min=0;
    // int hour=0;

    Timer.periodic(const Duration(seconds: 1) , (timer) {

      if(!gameEnd){

        // currentTime = DateTime.now();
        //
        // int sec = currentTime!.difference(startTime!).inSeconds;
        // int min = currentTime!.difference(startTime!).inMinutes;

        if(hour>=12){
          hour = 1;
        }

        if(min>=59){
          min = 0;
          hour += 1;
        }

        if(sec>=59){
          sec = 0;
          min += 1;
        }else{
          sec+=1;
        }


        if (!mounted) {
          return; // Just do nothing if the widget is disposed.
        }

        // if(mounted){
          setState(() {hour; min; sec;});
        // }

        // if(timer){
        //   setState(() {hour; min; sec;});
        // }

        // print("${(min.toString().length==1)?'0${min}':min} : ${(sec.toString().length==1)?'0${sec}':sec}");

        String time = "${(min.toString().length==1)?'0${min}':min} : ${(sec.toString().length==1)?'0${sec}':sec}";
        time = hour>0?"${(hour.toString().length==1)?'0${hour}':hour} : ${time}": time;
        // print(time);

        if (!mounted) {
          return; // Just do nothing if the widget is disposed.
        }
        setState(() {
          playTime = time;
        });

      }

    });

  }

  bool dialogShow = true;
  bool mistakeShow = false;

  bool timerOn = true;
  // bool timerOn = false;

  init () async {

    setState(() {
      user = widget.user;

      // playLevel = "Level ${widget.level}";
      playLevel = "${widget.mode} ${widget.level}";
      currentLevel = widget.level;

      // mAudio = widget.mAudio!;

      //medium puzzle not open M72, M134
      if(widget.mode.toLowerCase()=="easy"){
        if(widget.level == '47' || widget.level == '59'
            || widget.level == '77' || widget.level == '125'){
          playLevel = "${widget.mode} ${int.parse(widget.level)+1}";
          currentLevel = '${int.parse(widget.level)+1}';
        }
      }else if(widget.mode.toLowerCase()=="medium"){
        if(widget.level == '7' || widget.level == '20' || widget.level == '91' || widget.level == '134'
            || widget.level == '163' || widget.level == '167' || widget.level == '179' || widget.level == '182'
            || widget.level == '244' || widget.level == '278' || widget.level == '294' || widget.level == '305'
            || widget.level == '352'){
          playLevel = "${widget.mode} ${int.parse(widget.level)+1}";
          currentLevel = '${int.parse(widget.level)+1}';
        }
      }else if(widget.mode.toLowerCase()=="hard"){
        if(widget.level == '22'){
          playLevel = "${widget.mode} ${int.parse(widget.level)+1}";
          currentLevel = '${int.parse(widget.level)+1}';
        }
      }else if(widget.mode.toLowerCase()=="impossible"){
        if(widget.level == '6' || widget.level == '69'){
          playLevel = "${widget.mode} ${int.parse(widget.level)+1}";
          currentLevel = '${int.parse(widget.level)+1}';
        }
      }

    });

    // print("puzzle ${widget.mode.toLowerCase()}_${widget.level}");
    print("current puzzle $currentLevel");

    /*
    // await methods.loadPuzzle("easy_2").then(
    await methods.loadPuzzle("${widget.mode.toLowerCase()}_${widget.level}").then(
      (value) {

        // print('puzzle $value');

          if(value!=null){
            setState(() {
              boardData = value;
            });
          }
    });

    setState(() {
      col = ((boardData["board"] as List)[0] as List).length;
      row = (boardData["board"] as List).length;
    });
    // print('row $row column $col');
    */

    loadPuzzleData();
  }

  winMethod() async {
    setState(() {
      gameWin = false;
      // gameWinAnimate = false;
    });

    // await Sounds.pointsCollect;

    (!user["sound"])? null :
    await AudioCache().play('sounds/${Sound.PointsCollect}');

    setState(() {
      showProgress = false;
    });

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
          showProgress = true;
        });

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
          // if (int.parse(currentLevel) > 1) {
          if (int.parse(currentLevel) >= 1) {
            setState(() {
              currentLevel =
              '${int.tryParse(currentLevel)! + 1}';
            });

            int lastPuzzle = getLastPuzzle();
            Random random = Random();
            final v_ = random.nextInt(lastPuzzle);
            // late String res = "$v_";
            late String res = v_==0?"1":"$v_";
            print("res ?? $res");
            setState(() {
              currentLevel = res;
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

            // adProvider.initializeRewarded();
            try{
              adProvider.initializeRewarded();
            }catch(e){
              print('adProvider err');
            }

            setState(() {
              showProgress = false;
            });

          }
        });
      }
      else if(value==0){

        /*(!user["sound"])? null :
        Sounds.buttonClick;*/
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
            child: AuthScreen(start: false, isGuestMode: widget.user["login_mode"]=="Guest",),
            direction: AxisDirection.down,
          ),
        );

      }

      // }
    });
  }

  setMinute(){
    setState(() {
      // sec=60; min=3; hour=0;
      sec=60; min=1; hour=0;
    });

    // bool last = false;
    setState(() {
      last = false;
    });

    if(widget.mode=="Easy"){
      min=2;//3 min
    } else if(widget.mode=="Medium"){
      min=4;//5 min
    } else if(widget.mode=="Hard"){
      min=6;//7 min
    } else if(widget.mode=="Impossible"){
      min=9;//10 min
    }

    setState(() {
      min;
    });
  }
  getHint(){
    // if(!hint){
    List keys = [];
    (boardData["script"] as Map<String, dynamic>)
        .forEach((key, value) {
      if(value==""){
        keys.add(key);
      }
    });
    // String hintKey = keys.first;
    String hintKey = selectedKey!="" && !(boardData["script1"] as Map<String, dynamic>).containsKey(selectedKey)?selectedKey:keys.first;
    print('hintKey $hintKey');

    setState(() {
      // selectedKey = "";
      // selectedKey = hintKey;
      // keypad = "";
      // keypad = (boardData["result"] as Map<String, dynamic>)[selectedKey];

      keypad = (boardData["result"] as Map<String, dynamic>)[hintKey];
      // selectedKey = hintKey;

      selectedKey = hintKey;

      (boardData["script"] as Map<String, dynamic>).update(selectedKey, (v)=> v=keypad);

      // if(){
      //
      // }

      print('keypad $keypad');

      // selectedKey = hintKey;

      hint = true;
      usedHint += 1;

      nHint = true;

      // boardData;

    });
    print('usedHint $usedHint');
    print('hint $hint');
    print('nHint $nHint');

    // Future.delayed(const Duration(seconds: 3), () {
    // Future.delayed(const Duration(seconds: 2), () {
    Future.delayed(const Duration(seconds: 1), () {
    // Future.delayed(const Duration(milliseconds: 1500), () {
      setState(() {

        (boardData["script"] as Map<String, dynamic>).update(selectedKey, (v)=> v="");

        // selectedKey = "";
        if(!boardClick) selectedKey = "";

        // selectedKey = hintKey;
        keypad = "";

        hint = false;

        nHint = false;
        // boardData;
      });
    });
    // }
  }

  loadPuzzleData() async {
    try {

      int lastPuzzle = 0;
      String mode = widget.mode.toLowerCase();
      switch(mode){
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
      int currentPuzzle = int.tryParse(currentLevel) ?? 1;
      if(currentPuzzle > lastPuzzle){
        Database.setPuzzleToInitial(user["id"],mode: mode);
        setState(() {
          currentLevel = "1";
        });
      }

      // int lastPuzzle = getLastPuzzle();

      await methods.loadPuzzle("${widget.mode.toLowerCase()}_$currentLevel")
      // await methods.loadPuzzle("${widget.mode.toLowerCase()}_${int.parse(currentLevel) == lastPuzzle?"1":currentLevel}")
      // await methods.loadPuzzle("${widget.mode.toLowerCase()}_${int.parse(currentLevel) > lastPuzzle?"1":currentLevel}")
          .then(
              (value) {
            // print('puzzle $value');

            if (value != null) {
              setState(() {
                boardData = value;
              });
            }
          });

    }catch(e){

      print('puzzle load err ->\n$e');

      boardData = {
    "board1":  [
    ["A","","15","","","A","20","3","19","12","","16",""],
    ["18","E","E","15","E","D","","12","","4","P","E","12"],
    ["A","","7","","","4","5","5","E","15","","20",""],
    ["15","4","17","1","E","15","","E","","6","A","20","1"],
    ["","","E","","22","12","4","15","1","","16","","3"],
    ["15","E","22","E","1","","11","","14","4","17","20","D"],
    ["3","","1","","A","19","3","20","E","","12","","E"],
    ["19","20","3","12","1","","D","","12","4","D","E","22"],
    ["23","","12","","E","20","E","8","1","","A","",""],
    ["1","17","19","22","","E","","23","9","E","12","A","22"],
    ["","12","","3","6","A","19","E","","","1","","E"],
    ["E","D","3","1","","2","","E","10","4","20","10","E"],
    ["","4","","22","P","9","E","15","","","9","","2"],
    ],
    "board":  [
    ["21","","15","","","21","20","3","19","12","","16",""],
    ["18","13","13","15","13","25","","12","","4","26","13","12"],
    ["21","","7","","","4","5","5","13","15","","20",""],
    ["15","4","17","1","13","15","","13","","6","21","20","1"],
    ["","","13","","22","12","4","15","1","","16","","3"],
    ["15","13","22","13","1","","11","","14","4","17","20","25"],
    ["3","","1","","21","19","3","20","13","","12","","13"],
    ["19","20","3","12","1","","25","","12","4","25","13","22"],
    ["23","","12","","13","20","13","8","1","","21","",""],
    ["1","17","19","22","","13","","23","9","13","12","21","22"],
    ["","12","","3","6","21","19","13","","","1","","13"],
    ["13","25","3","1","","2","","13","10","4","20","10","13"],
    ["","4","","22","26","9","13","15","","","9","","2"],
    ],
    "script": {
    "1": "",
    "2": "",
    "3": "",
    "4": "",
    "5": "",
    "6": "",
    "7": "",
    "8": "",
    "9": "",
    "10": "",
    "11": "",
    "12": "",
    "13": "E",//
    "14": "",
    "15": "",
    "16": "",
    "17": "",
    "18": "",
    "19": "",
    "20": "",
    "21": "A",//
    "22": "",
    "23": "",
    "24": "",
    "25": "D",//
    "26": "P",//
    },
    "script1": {
    "13": "E",//
    "21": "A",//
    "25": "D",//
    "26": "P",//
    },
    "history": {

    },
    "result" : {
    "1": "T",
    "2": "K",
    "3": "I",
    "4": "O",
    "5": "F",
    "6": "M",
    "7": "Q",
    "8": "C",
    "9": "Y",
    "10": "V",
    "11": "X",
    "12": "N",
    "13": "E",//
    "14": "Z",
    "15": "R",
    "16": "B",
    "17": "U",
    "18": "J",
    "19": "G",
    "20": "L",
    "21": "A",//
    "22": "S",
    "23": "H",
    "24": "W",//W
    "25": "D",//
    "26": "P",//
    },
    };

      setState(() {
        boardData;
      });

    }

    setState(() {
      col = ((boardData["board"] as List)[0] as List).length;
      row = (boardData["board"] as List).length;
    });
  }

  late AdProvider adProvider;

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

  late Timer timer;

  @override
  void dispose() {
    // TODO: implement dispose
    print('screen4');
    print('disposed.....');
    super.dispose();

    // setState(() {
    //   gameEnd=true;
    // });

/*
    try { // loadingAudio.dispose();
      // mAudio.dispose();
      if (widget.mAudio == null) {
        mAudio.dispose();
      }
    } catch(e){
      print('audio dispose err');
    }
*/


    timer.cancel();
    adProvider.dispose();

    WidgetsBinding.instance!.removeObserver(this);

  }

  late MAudio mAudio;
  late bool isPlaying = false;

  late AnimationController winAnimator;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      showProgress = true;
    });

    WidgetsBinding.instance!.addObserver(this);
    print('initial state.....');

    adProvider = AdProvider();
    // adProvider.initializeBanner();
    // adProvider.initializeInterstitial();
    // adProvider.initializeRewarded();
    try{
      adProvider.initializeBanner();
      adProvider.initializeInterstitial();
      adProvider.initializeRewarded();
    }catch(e){
      print('adProvider err');
    }
    Future.delayed(const Duration(seconds: 1),(){
      setState(() {
        adProvider;
      });
    });



    // showDialog(
    //     context: context,
    //     // barrierDismissible: false,
    //     builder: (context) => dialogQuery()
    // );



    init();

/*
    if(widget.mAudio == null){
      mAudio = MAudio();
      setState(() {
        mAudio;
      });

      // -loadingAudio.initialize('sounds/${Sound.BackGround}');
      mAudio.initialize('sounds/${Sound.BackGround}').then((value) {
        if(mAudio!=null && user!=null){
          if(!user["music"]){
            print('isPlaying $isPlaying');
            if(isPlaying){
              mAudio.pauseMusic();
              isPlaying = false;
            }
          }else{
            if(!isPlaying){
              mAudio.playLoopMusic();
              isPlaying = true;
            }
          }
        }
      });

    }
    else{
      mAudio = widget.mAudio!;

      if(mAudio!=null && user!=null){
        if(!user["music"]){
          if(isPlaying){
            mAudio.pauseMusic();
            isPlaying = false;
          }
        }else{
          if(!isPlaying){
            mAudio.playLoopMusic();
            isPlaying = true;
          }
        }
      }
    }
*/


    try{
      (!user["timer"])? timerOn=false: timerOn=true;
      setState(() {
        timerOn;
      });
    }catch(e){
      setState(() {
        timerOn = true;
      });
    }

    // winAnimator = AnimationController(vsync: this, duration: const Duration(seconds: 1))
    //   ..addListener(() { });
    // setState(() {
    //   winAnimator;
    // });

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if(dialogShow){

        setState(() {
          dialogShow = false;
        });

        // showTransitionDialog(
        //     context: context,
        //     child: dialogQuery(context),
        // );

      }
    });

    showTime();


    setState(() {
      showProgress = false;
    });

    // //crashlytics check
    // // throw const FormatException("error");
    // FirebaseCrashlytics.instance.crash();
    // //SystemNavigator.pop();
    // // exit(0);
    // // throw(Exception('Hello Crashlytics'));
    // // return;

  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement LifeCycle Change
    super.didChangeAppLifecycleState(state);

    if(state == AppLifecycleState.inactive
        || state == AppLifecycleState.detached) return;

    final isBackground = state == AppLifecycleState.paused;

    if(isBackground){
      print('App in Background!');

      print('isPlaying $isPlaying');

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
      // }
    } else {

      print('App in Foreground!');

      print('isPlaying $isPlaying');

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
      // }
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

  int col = 13; //13
  int row = 13;

  late bool showProgress = false;

  @override
  Widget build(BuildContext context) {

    Size display = MediaQuery.of(context).size;

    // if(min>0){
    //   showDialog(
    //       context: context,
    //       // barrierDismissible: false,
    //       builder: (context) => dialogUserBoard()
    //   );
    // }

    double width = display.width;
    double height = display.height;

    // double width = 360;
    // double height = 800;
    // double height = 760;
    // double height = 640;
    // double height = 780;
    // double height = 720;

    // double width = 390;
    // double height = 844;

    // double width = 424;
    // double height = 918;

    // double width = 393;
    // double height = 873;

    const mockupWidth = 390;
    const mockupHeight = 844;

    final scale = mockupWidth / width;
    // final divide = mockupWidth * width;

    // gameWin?Sounds.gameLooseSound:Sounds.pointsCollect;


    // setState(() {
    //
    // });

    // print('width x height ${width} x ${height}');

    // print('col $col  row $row');

    final bool isTablat = width>500 && height>800?true:false;

    return
      // PixelPerfect(
      // scale: 4 * scale,
      // assetPath: "assets/images/13 Pro - 8.png",
      // child:
      WillPopScope(
        onWillPop: () async {

          /*(!user["sound"])? null :
          await Sounds.buttonClick;*/


          if(widget.isDailyChallenge){
            // await mAudio.pauseMusic();

            Navigator.of(context).pop();
            Navigator.push(context,
              // Navigator.pushReplacement(context,
              NavigateWithOpaque(
                // child: AuthScreen(start: false, isGuestMode: widget.user["login_mode"]=="Guest"?true:false),
                // child: AuthScreen(start: false, isGuestMode: widget.user["login_mode"]=="Guest"?true:false, isPlaying: widget.user["music"],),
                child: AuthScreen(start: false, isGuestMode: widget.user["login_mode"]=="Guest"?true:false,),
                direction: AxisDirection.down,
              ),
            );
          }
          else {

            //update level on data update
            if(App.userdata.value!=null){
              user = App.userdata.value!;
              // String level_ = '${widget.user["level"][widget.mode.toLowerCase()]}';
              // playLevel = "${widget.mode} $level_";
              // currentLevel = level_;
            }

            Future.delayed(const Duration(milliseconds: 200), () {
              showDialog(
                  context: context,
                  // builder: (context) => dialogClose(context, user: user, mAudio: mAudio)
                  builder: (context) => dialogClose(context, user: user)
              );
            });
          }

          return false;
          // return true;
        },

        // child: FutureBuilder(
        //   future: boardData,
        // ),

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
              // color: Colors.transparent,
              // color: Color(0xff151515).withOpacity(0.7),
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

                //back
                Positioned(
                  child: Container(
                    color: Color(0xff151515).withOpacity(0.7),
                  )
                ),

                Positioned(
                  // top: display.height*(45/700),
                  // top: 45 / mockupHeight * height,

                  // top: (45*scale) / mockupHeight * height,
                  /*top: (height<=640?25:45*scale) / mockupHeight * height,*/
                  top: isTablat?30:(height<=640?25:45*scale) / mockupHeight * height,

                  // left: 0,
                  child: Container(
                    // height: 209.34,
                    // width: 372,
                    // width: display.width*0.87,
                    // width: display.width*0.90,
                    width: display.width,
                    // height: 60 / mockupHeight * height,
                    /*height: (60*scale) / mockupHeight * height,*/
                    height: (isTablat?60:(60*scale)) / mockupHeight * height,

                    // width: MediaQuery.of(context).size.width,
                    color: Color(0xffffffff),
                    // height: 70,

                    // width: 73,
                    // width: display.width*(73/350),
                    // alignment: Alignment.bottomCenter,
                    alignment: Alignment.center,
                    // child: Image.asset(
                    //   "assets/images/Rectangle 15.png",
                    //   fit: BoxFit.fitWidth,
                    // ),
                    child: Center(
                      child: mistakeShow?
                      Text(
                        // "00:05",
                        // "${mistakes} Mistakes",
                        "${mistakes} \n Mistakes",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          color: Color(0xff459F67),
                          fontSize: (20.0*scale) / mockupWidth * width,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                      : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            // "Level 1",
                            //"${playLevel}",
                            // "Level ${currentLevel}",
                            // widget.isDailyChallenge?"Daily Challenge":"Level ${currentLevel}",
                            widget.isDailyChallenge?"Daily Challenge":"${widget.mode} ${currentLevel}",
                            style: GoogleFonts.roboto(
                              color: Color(0xff459F67),
                              fontSize: (20.0*scale) / mockupWidth * width,
                              // fontSize: ((widget.mode.length>6)?16:20.0*scale) / mockupWidth * width,

                              // fontSize: (widget.isDailyChallenge?15:20.0) / mockupHeight * height,
                              // fontSize: (widget.isDailyChallenge?width<=360?13:15:20.0) / mockupHeight * height,
                              // letterSpacing: -1.5,
                              fontWeight: FontWeight.w700,
                              // fontWeight: widget.isDailyChallenge?width<=360?FontWeight.w800:FontWeight.w700:FontWeight.w700,
                              // height: 23.44,
                            ),
                          ),
                          Text(
                            // "00:05",
                            "${playTime}",
                            style: GoogleFonts.roboto(
                              color: Color(0xff74C171),
                              // fontSize: 15.0 / mockupHeight * height,
                              fontSize: (15.0*scale) / mockupWidth * width,
                              // letterSpacing: -1.5,
                              fontWeight: FontWeight.w500,
                              // height: 23.44,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),


                // Positioned(
                //   top: display.height*(45/700),
                //   left: 0,
                //   child: Container(
                //     // height: 209.34,
                //     // width: 372,
                //     // width: display.width*0.87,
                //     // width: display.width*0.90,
                //     width: display.width,
                //     // width: MediaQuery.of(context).size.width,
                //     // color: Color(0xffffffff),
                //     // height: 70,
                //     height: 60,
                //     color: Colors.transparent,
                //     // width: 73,
                //     // width: display.width*(73/350),
                //     alignment: Alignment.center,
                //     // child: Image.asset(
                //     //   "assets/images/Rectangle 15.png",
                //     //   fit: BoxFit.fitWidth,
                //     // ),
                //     child: Center(
                //       child: Column(
                //         children: [
                //           Text(
                //             "Level 1",
                //             style: GoogleFonts.roboto(
                //               color: Color(0xff459F67),
                //               fontSize: 20.0,
                //               // letterSpacing: -1.5,
                //               fontWeight: FontWeight.w700,
                //               // height: 23.44,
                //             ),
                //           ),
                //           Text(
                //             "00:05",
                //             style: GoogleFonts.roboto(
                //               color: Color(0xff459F67),
                //               fontSize: 15.0,
                //               // letterSpacing: -1.5,
                //               fontWeight: FontWeight.w500,
                //               // height: 23.44,
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),

                //back
                Positioned(
                  // top: display.height*(30/700),
                  // top: display.height*(30/580),
                  // // top: 30,
                  // left: display.width*(20/980),
                  // top:  38 / mockupHeight * height,
                  // left: 29 / mockupWidth * width,

                  // top:  (38*scale) / mockupHeight * height,
                  /*top:  (height<=640?10:38*scale) / mockupHeight * height,
                  left: (29*scale) / mockupWidth * width,*/
                  top:  isTablat?5:(height<=640?10:38*scale) / mockupHeight * height,
                  left: (29*scale) / mockupWidth * width,
                  child: Container(
                    // height: 209.34,
                    // width: 372,
                    // width: display.width*0.87,
                    // width: display.width*0.90,
                    // width: display.width*0.93,
                    // width: 73,
                    // width: display.width*(73/350),
                    alignment: Alignment.bottomCenter,
                    // child: GestureDetector(
                    child: InkWell(
                      onTap: () async {
                        // Navigator.of(context).pop();

                        // showDialog(
                        //     context: context,
                        //     // barrierDismissible: false,
                        //     // builder: (context) => dialogClose()
                        //     builder: (context) => dialogClose(user: widget.user)
                        // );

                        // await methods.playSound(file: "click1")
                        //     .then((value) {

                        /*(!user["sound"])? null :
                        await Sounds.buttonClick;*/


                        // widget.isDailyChallenge?
                        // (){
                        //   Navigator.of(context).pop();
                        //   Navigator.push(context,
                        //     // Navigator.pushReplacement(context,
                        //     NavigateWithOpaque(
                        //       child: AuthScreen(start: false, isGuestMode: widget.user["login_mode"]=="Guest"?true:false),
                        //       direction: AxisDirection.down,
                        //     ),
                        //   );
                        // }
                        // :
                        //
                        // // Future.delayed(const Duration(seconds: 1), (){
                        //   Future.delayed(const Duration(milliseconds: 200), (){
                        //         showDialog(
                        //             context: context,
                        //             // barrierDismissible: false,
                        //             // builder: (context) => dialogClose()
                        //             // builder: (context) => dialogClose(context, user: widget.user)
                        //             builder: (context) => dialogClose(context, user: user)
                        //         );
                        //   });
                        //
                        // // });


                        if(widget.isDailyChallenge){

                          // await mAudio.pauseMusic();

                          Navigator.of(context).pop();
                          Navigator.push(context,
                            // Navigator.pushReplacement(context,
                            NavigateWithOpaque(
                              // child: AuthScreen(start: false, isGuestMode: widget.user["login_mode"]=="Guest"?true:false),
                              // child: AuthScreen(start: false, isGuestMode: widget.user["login_mode"]=="Guest"?true:false, isPlaying: widget.user["music"],),
                              child: AuthScreen(start: false, isGuestMode: widget.user["login_mode"]=="Guest"?true:false),
                              direction: AxisDirection.down,
                            ),
                          );
                        }else {

                          //update level on data update
                          if(App.userdata.value!=null){
                            user = App.userdata.value!;
                            // String level_ = '${widget.user["level"][widget.mode.toLowerCase()]}';
                            // playLevel = "${widget.mode} $level_";
                            // currentLevel = level_;
                          }

                          Future.delayed(const Duration(milliseconds: 200), () {
                            showDialog(
                                context: context,
                                // builder: (context) => dialogClose(context, user: user, mAudio: mAudio)
                                builder: (context) => dialogClose(context, user: user)
                            );
                          });
                        }

                      },
                      child: Image.asset(
                        "assets/images/back.png",
                        fit: BoxFit.fill,
                        scale: 4 * scale,
                      ),
                    ),
                  ),
                ),


                /*
                //previous
                widget.isDailyChallenge?Container():
                Positioned(
                  // top: display.height*(30/700),
                  // top: display.height*(30/580),
                  // top: display.height*(25/580),
                  // // top: 30,
                  // left: display.width*(20/980) + 65,
                  // top:  38 / mockupHeight * height,
                  // left: (29+60) / mockupWidth * width,

                  // top:  (38*scale) / mockupHeight * height,
                  top:  (height<=640?10:38*scale) / mockupHeight * height,
                  // left: ((29+60)*scale) / mockupWidth * width,
                  left: ((width<=360?82:(29+60))*scale) / mockupWidth * width,
                  child: Container(
                    // height: 209.34,
                    // width: 372,
                    // width: display.width*0.87,
                    // width: display.width*0.90,
                    // width: display.width*0.93,
                    // width: 73,
                    // width: display.width*(73/350),
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      onTap: () async {
                        // Navigator.of(context).pop();

                        // Navigator.of(context).pushReplacement(
                        //   MaterialPageRoute(
                        //       builder: (context) =>  Screen4(mode: widget.mode, level: '${int.tryParse(widget.level)!-1}', user: widget.user,)
                        //   ),
                        // );

                        // await methods.playSound(file: "soundscrate-click-fx-tonal-18")
                        //     .then((value) {

                        (!user["sound"])? null :
                        Sounds.buttonClick;
                          // if(adProvider.isRewardedLoaded){
                          //   adProvider.rewardedAd.show(
                          //       onUserEarnedReward: (view, reward) {
                          //         print('reward.amount ${reward.amount}');
                          //         //10
                          //
                          //         // print('reward.update ${widget.user['id']} ${reward.amount as int} ${widget.mode.toLowerCase()}');
                          //         // Login.updateReward(widget.user['id'], reward.amount as int, widget.mode.toLowerCase());

                                  (!user["sound"])? null :
                                  Sounds.rewardsCollect;
                                  // // Login.updateReward(widget.user['id'], 35, widget.mode.toLowerCase());
                                  // // Login.updateTotalPoints(widget.user['id'], reward.amount as int);
                                  // Login.updateReward(user['id'], 35, widget.mode.toLowerCase());
                                  // Login.updateTotalPoints(user['id'], reward.amount as int);
                                  //
                                  // // timer.cancel();
                                  // // adProvider.dispose();
                                  //
                                  // // Navigator.of(context).pop();
                                  // // Navigator.of(context).pushReplacement(
                                  // //   MaterialPageRoute(
                                  // //       builder: (context) =>  Screen4(mode: widget.mode, level: '${int.tryParse(widget.level)!-1}', user: widget.user,)
                                  // //   ),
                                  // // );

                                  if(int.parse(currentLevel)>1){
                                    // setState(() {
                                    //   currentLevel = '${int.tryParse(currentLevel)!-1}';
                                    // });

                                    // setState(() {
                                    //   playLevel = "${widget.mode} ${int.parse(widget.level)!-1}";
                                    //   currentLevel = "${int.parse(widget.level)!-1}";
                                    // });
                                    //
                                    // loadPuzzleData();

                                    // Database.setPuzzleTo(widget.user["id"], mode: widget.mode.toLowerCase(), puzzle: int.parse(widget.level)-1);
                                    //
                                    // Login.getUser(widget.user["id"]).then((value){
                                    //   if(value!=null){
                                    //     App.userdata.value = value;
                                    //     App.userdata.notifyListeners();
                                    //   }
                                    // });

                                    //medium puzzle not open M72, M134
                                    // if(widget.level == '72' || widget.level == '134'){
                                    if(widget.level == '73' || widget.level == '135'){
                                      currentLevel = '${int.parse(widget.level)+1}';
                                      Database.setPuzzleTo(widget.user["id"], mode: widget.mode.toLowerCase(), puzzle: int.parse(widget.level)-2);
                                    }else{
                                      Database.setPuzzleTo(widget.user["id"], mode: widget.mode.toLowerCase(), puzzle: int.parse(widget.level)-1);
                                    }

                                    Login.getUser(widget.user["id"]).then((value){
                                      if(value!=null){
                                        App.userdata.value = value;
                                        App.userdata.notifyListeners();
                                      }
                                    });

                                    Navigator.of(context).pushReplacement(
                                      NavigateWithOpaque(
                                        // child: Screen4(mode: "${widget.mode}", level: '${int.parse(widget.level)!-1}', user: widget.user, mAudio: mAudio,),
                                        child: Screen4(mode: "${widget.mode}", level: '${int.parse(widget.level)-1}', user: widget.user,),
                                        // duration: 200,
                                        direction: AxisDirection.left,
                                      ),
                                    );

                                    // setState(() {
                                    //   sec = 0;
                                    //   min = 0;
                                    //   hour = 0;
                                    // });

                                    // adProvider.initializeRewarded();
                                  }
                          //
                          //       }
                          //   );
                          // }

                        // });




                      },
                      child: Transform.rotate(
                        // angle: 90,
                          angle: 135,
                        // angle: Matrix4.rotationX(radians),
                        child: Image.asset("assets/images/Group 59.png",
                          scale: 4 * scale,
                        )
                      ),
                    ),
                  ),
                ),
                //next
                widget.isDailyChallenge?Container():
                Positioned(
                  // top: display.height*(30/700),
                  // top: display.height*(30/580),
                  // top: display.height*(35/580),
                  // // top: 30,
                  // // left: display.width*(20/980) + 65,
                  // left: display.width*(290/370) - 65,
                  // top:  (38+10) / mockupHeight * height,
                  // right: (25+65) / mockupWidth * width,

                  // top:  ((38+10)*scale) / mockupHeight * height,
                  top:  (height<=640?(10+10):(38+10)*scale) / mockupHeight * height,
                  // right: ((25+65)*scale) / mockupWidth * width,
                  right: ((width<=360?82:(25+65))*scale) / mockupWidth * width,
                  child: Container(
                    // height: 209.34,
                    // width: 372,
                    // width: display.width*0.87,
                    // width: display.width*0.90,
                    // width: display.width*0.93,
                    // width: 73,
                    // width: display.width*(73/350),
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      onTap: () async {
                        // Navigator.of(context).pop();

                        // Navigator.of(context).pushReplacement(
                        //   MaterialPageRoute(
                        //       builder: (context) =>  Screen4(mode: widget.mode, level: '${int.tryParse(widget.level)!+1}', user: widget.user,)
                        //   ),
                        // );

                        // await methods.playSound(file: "soundscrate-click-fx-tonal-18")
                        //     .then((value) {

                        (!user["sound"])? null :
                        Sounds.buttonClick;
                          // if(adProvider.isRewardedLoaded){
                          //   adProvider.rewardedAd.show(
                          //       onUserEarnedReward: (view, reward){
                          //         // view.dispose();
                          //
                          //         print('reward.amount ${reward.amount}');
                          //         //10
                          //
                          //         // print('reward.update ${widget.user['id']} ${reward.amount as int} ${widget.mode.toLowerCase()}');
                          //         // Login.updateReward(widget.user['id'], reward.amount as int, widget.mode.toLowerCase());

                                  (!user["sound"])? null :
                                  Sounds.rewardsCollect;
                                  // // Login.updateReward(widget.user['id'], 35, widget.mode.toLowerCase());
                                  // // Login.updateTotalPoints(widget.user['id'], reward.amount as int);
                                  // Login.updateReward(user['id'], 35, widget.mode.toLowerCase());
                                  // Login.updateTotalPoints(user['id'], reward.amount as int);
                                  //
                                  // // timer.cancel();
                                  // // adProvider.dispose();
                                  //
                                  // // Navigator.of(context).pop();
                                  // // Navigator.of(context).pushReplacement(
                                  // //   MaterialPageRoute(
                                  // //       builder: (context) =>  Screen4(mode: widget.mode, level: '${int.tryParse(widget.level)!+1}', user: widget.user,)
                                  // //   ),
                                  // // );

                        print('playLevel $playLevel currentLevel $currentLevel');

                                  if(int.parse(currentLevel)>=1){
                                    // setState(() {
                                    //   currentLevel = '${int.tryParse(currentLevel)!+1}';
                                    // });

                                    // print('playLevel $playLevel currentLevel $currentLevel');

                                    // setState(() {
                                    //   playLevel = "${widget.mode} ${int.parse(widget.level)!+1}";
                                    //   currentLevel = "${int.parse(widget.level)!+1}";
                                    // });
                                    //
                                    // print('playLevel $playLevel currentLevel $currentLevel');
                                    //
                                    // loadPuzzleData();

                                    Database.setPuzzleTo(widget.user["id"], mode: widget.mode.toLowerCase(), puzzle: int.parse(widget.level)+1);

                                    Login.getUser(widget.user["id"]).then((value){
                                      if(value!=null){
                                        App.userdata.value = value;
                                        App.userdata.notifyListeners();
                                      }
                                    });



                                    Navigator.of(context).pushReplacement(
                                      NavigateWithOpaque(
                                        // child: Screen4(mode: "${widget.mode}", level: '${int.parse(widget.level)!+1}', user: widget.user, mAudio: mAudio,),
                                        child: Screen4(mode: "${widget.mode}", level: '${int.parse(widget.level)+1}', user: widget.user,),
                                        // duration: 200,
                                        direction: AxisDirection.left,
                                      ),
                                    );

                                    // setState(() {
                                    //   sec = 0;
                                    //   min = 0;
                                    //   hour = 0;
                                    // });

                                    // adProvider.initializeRewarded();
                                  }

                                // }
                            // );
                          // }


                        // });



                      },
                      child: Image.asset("assets/images/Group 59.png",
                        scale: 4 * scale,
                      ),
                    ),
                  ),
                ),
                */

                //query
                Positioned(
                  // top: display.height*(30/700),
                  // top: display.height*(30/580),
                  // // left: display.width*(290/980),
                  // left: display.width*(290/370),

                  // top:  38 / mockupHeight * height,
                  // // left: 290 / mockupWidth * width,
                  // right: 25 / mockupWidth * width,

                  // top:  (38*scale) / mockupHeight * height,
                  /*top:  height<=640?(10):(38*scale) / mockupHeight * height,
                  right: (25*scale) / mockupWidth * width,*/
                  top:  isTablat?5:(height<=640?(10):(38*scale)) / mockupHeight * height,
                  right: (25*scale) / mockupWidth * width,

                  child: Container(
                    // height: 209.34,
                    // width: 372,
                    // width: display.width*0.87,
                    // width: display.width*0.90,
                    // width: display.width*0.93,
                    // width: 73,
                    // width: display.width*(73/350),
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () async {
                        //Navigator.of(context).pop();
                        // showDialog(
                        //     context: context,
                        //     // barrierDismissible: false,
                        //     builder: (context) => dialogQuery()
                        // );


                        // showToast(text: "${0} Mistakes");

                        // await methods.playSound(file: "Click-Sound-Effect")
                        // await methods.playSound(file: "soundscrate-graphics-game-blip-2")
                        //     .then((value) {

                        // await Sounds.btnHintClick;
                        // await Sounds.buttonClick;
                        // await Sounds.gameLooseSound;
                        // await Sounds.pointsCollect;

                        /*(!user["sound"])? null :
                        await AudioCache().play('sounds/${Sound.HintClick}');*/

                        // AudioCache().play('sounds/${Sound.PointsCollect}');
                        // AudioCache().play('sounds/${Sound.GameLoose}');

                        print("keypad $keypad");
                        print("hint $hint");
                        print("nHint $nHint");
                        print("gameEnd $gameEnd");


                          if(!gameEnd){

                            setState(() {
                              mistakes=0;
                            });
                            final kres = (boardData["script"] as Map<String, dynamic>);
                            final res = (boardData["result"] as Map<String, dynamic>);
                            List.generate(kres.length, (index) {
                              if(kres['${index+1}']!=""){
                                if(kres['${index+1}'] != res['${index+1}']){
                                  mistakes += 1;
                                }
                              }
                            });
                            setState(() {
                              mistakes;
                            });

                            setState(() {
                              gameEnd = true;
                              mistakeShow = true;
                            });

                            Future.delayed(const Duration(seconds: 2), () {
                              setState(() {
                                gameEnd = false;
                                mistakeShow = false;
                              });
                            });

                          }
                          else {
                            setState(() {
                              // gameEnd = true;
                              mistakeShow = true;
                            });

                            Future.delayed(const Duration(seconds: 2), () {
                              setState(() {
                                // gameEnd = false;
                                mistakeShow = false;
                              });
                            });
                          }

                          // if(!(boardData["board"] as Map<String, dynamic>).containsKey("")){
                          //   return;
                          // }

                          // if(usedHint<=5){
                          if(usedHint<=4){
                            getHint();
                            print("reach max hint uses");
                          }else{

                            /*
                            if(adProvider.isRewardedLoaded){
                              adProvider.rewardedAd.show(
                                  onUserEarnedReward: (view, reward){
                                    // view.dispose();

                                    print('reward.amount ${reward.amount}');

                                    //10

                                    // print('reward.update ${widget.user['id']} ${reward.amount as int} ${widget.mode.toLowerCase()}');
                                    // Login.updateReward(widget.user['id'], reward.amount as int, widget.mode.toLowerCase());
                                    // Login.updateReward(widget.user['id'], 35, widget.mode.toLowerCase());
                                    // Login.updateTotalPoints(widget.user['id'], reward.amount as int);

                                    // timer.cancel();
                                    // adProvider.dispose();

                                    // Navigator.of(context).pop();
                                    // Navigator.of(context).pushReplacement(
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>  Screen4(mode: widget.mode, level: '${int.tryParse(widget.level)!+1}', user: widget.user,)
                                    //   ),
                                    // );

                                    // if(int.parse(currentLevel)>1){
                                      // setState(() {
                                      //   currentLevel = '${int.tryParse(currentLevel)!+1}';
                                      // });
                                      //
                                      // loadPuzzleData();
                                      //
                                      // setState(() {
                                      //   sec = 0;
                                      //   min = 0;
                                      //   hour = 0;
                                      // });

                                      adProvider.initializeRewarded();
                                    // }

                                    // if(!hint){

                                      List keys = [];
                                      (boardData["script"] as Map<String, dynamic>)
                                          .forEach((key, value) {
                                        if(value==""){
                                          keys.add(key);
                                        }
                                      });
                                      // String hintKey = keys.first;
                                      String hintKey = selectedKey!="" && !(boardData["script1"] as Map<String, dynamic>).containsKey(selectedKey)?selectedKey:keys.first;

                                      setState(() {
                                        // selectedKey = "";
                                        // selectedKey = hintKey;
                                        // keypad = "";
                                        // keypad = (boardData["result"] as Map<String, dynamic>)[selectedKey];

                                        keypad = (boardData["result"] as Map<String, dynamic>)[hintKey];
                                        selectedKey = hintKey;
                                        print('keypad $keypad');

                                        // selectedKey = hintKey;

                                        hint = true;
                                        usedHint += 1;

                                        nHint = true;

                                        // boardData;

                                      });
                                      print('usedHint $usedHint');
                                      print('hint $hint');

                                      // Future.delayed(const Duration(seconds: 3), () {
                                      Future.delayed(const Duration(seconds: 5), () {
                                        setState(() {

                                          selectedKey = "";
                                          // selectedKey = hintKey;
                                          keypad = "";

                                          hint = false;

                                          nHint = false;

                                          // boardData;
                                        });
                                      });
                                    // }

                                  }
                              );
                            }
                            */

                          final ti = hintTime.split(":");
                          final min = int.parse(ti[0]);
                          setState(() {
                            hintTime = '${min.toString().length==1?(min!=9?'0':''):''}${min+1}:00';
                          });

                          print('hintTime $hintTime');

                          getHint();

                          }//else




                        // });

/*
                        if(!gameEnd){

                          setState(() {
                            gameEnd = true;
                            mistakeShow = true;
                          });

                          Future.delayed(const Duration(seconds: 2), () {
                            setState(() {
                              gameEnd = false;
                              mistakeShow = false;
                            });
                          });

                        } else {
                          setState(() {
                            // gameEnd = true;
                            mistakeShow = true;
                          });

                          Future.delayed(const Duration(seconds: 2), () {
                            setState(() {
                              // gameEnd = false;
                              mistakeShow = false;
                            });
                          });
                        }
*/


                        // showDialog(
                        //     context: context,
                        //     // barrierDismissible: false,
                        //     builder: (context) => dialogUserBoard()
                        // );

/*
                        if(!hint){
                          List keys = [];
                          (boardData["script"] as Map<String, dynamic>)
                              .forEach((key, value) {
                            if(value==""){
                              keys.add(key);
                            }
                          });
                          String hintKey = keys.first;
                          setState(() {
                            // selectedKey = "";
                            // selectedKey = hintKey;
                            // keypad = "";
                            // keypad = (boardData["result"] as Map<String, dynamic>)[selectedKey];

                            keypad = (boardData["result"] as Map<String, dynamic>)[hintKey];
                            selectedKey = hintKey;
                            print('keypad $keypad');

                            // selectedKey = hintKey;

                            hint = true;
                            usedHint += 1;

                            // boardData;

                          });
                          print('usedHint $usedHint');
                          print('hint $hint');

                          Future.delayed(const Duration(seconds: 3), () {
                            setState(() {

                              selectedKey = "";
                              // selectedKey = hintKey;
                              keypad = "";

                              hint = false;

                              // boardData;
                            });
                          });
                        }
*/
                      },
                      child: Image.asset(
                        // "assets/images/Group 47.png",
                        "assets/images/hint.png",
                        fit: BoxFit.fill,
                        scale: 4 * scale,
                      ),
                    ),
                  ),
                ),

                //points
                // Positioned(
                //   // top: display.height*(30/700),
                //   top: display.height*(30/580)+80,
                //   // left: display.width*(20/980),
                //   // left: display.width*(20/980)+10,
                //   left: display.width*(290/370)+10,
                //   child: InkWell(
                //     onTap: () async {
                //     },
                //     child: Container(
                //       padding: EdgeInsets.all(3),
                //       // padding: EdgeInsets.all(4),
                //       decoration: BoxDecoration(
                //         color: Color(0xffFFEDBE),
                //         borderRadius: BorderRadius.all(Radius.circular(20)),
                //       ),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         children: [
                //           Container(
                //             // width: display.width*(73/350),
                //             margin: EdgeInsets.symmetric(horizontal: 5),
                //             alignment: Alignment.center,
                //             // child: Image.asset(
                //             //   "assets/images/Group 2608537.png",
                //             //   fit: BoxFit.fill,
                //             //   scale: 4,
                //             // ),
                //             child: Text(//"100",
                //               "${widget.user["history"]["total_points"]}",
                //               style: TextStyle(
                //                 fontWeight: FontWeight.w500,
                //                 color: Color(0xffD49A34),
                //               ),
                //             ),
                //           ),
                //           // SizedBox(width: 5,),
                //           Container(
                //             // width: display.width*(73/350),
                //             margin: EdgeInsets.symmetric(horizontal: 3),
                //             alignment: Alignment.center,
                //             child: Image.asset(
                //               "assets/images/Group 2608537.png",
                //               fit: BoxFit.fill,
                //               scale: 4,
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                //points
                Positioned(
                  // top: display.height*(30/700),
                  // top: display.height*(30/580)+80,
                  // // left: display.width*(20/980),
                  // left: display.width*(20/980)+10,
                  // top: (25+73+13+5) / mockupHeight * height,
                  // left: 26 / mockupWidth * width,
                  // top: (25+73+13+8) / mockupHeight * height,
                  // right: (26+15) / mockupWidth * width,

                  // top: ((25+73+13+8)*scale) / mockupHeight * height,
                  /*top: ((height<=640?92:(25+73+13+8))*scale) / mockupHeight * height,
                  right: ((26+15)*scale) / mockupWidth * width,*/
                  top: (isTablat?98:(height<=640?92:(25+73+13+8))*scale) / mockupHeight * height,
                  right: isTablat?(26+15+30):((26+15)*scale) / mockupWidth * width,
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
                              // "${widget.user["history"]["total_points"]??0}",
                              "${user["history"]["total_points"]??0}",
                              style: TextStyle(
                                // fontWeight: FontWeight.w500,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffD49A34),
                                fontFamily: 'Roboto',
                                // fontSize: (17.17*scale) / mockupWidth * width,
                                fontSize: (height<=640?15:17.17*scale) / mockupWidth * width,
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
                              scale: height<=640?4:4 * scale,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),



                //board
                // Positioned(
                //   top: 150,
                //   // left: 30,
                //   // left: 15,
                //   // top: display.height*(30/700),
                //   child: Container(
                //     margin: EdgeInsets.all(10),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       children: List.generate(13, (index) {
                //         return Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           crossAxisAlignment: CrossAxisAlignment.center,
                //           children: List.generate(13, (index1) {
                //             return Container(
                //               width: (display.width/13)-(20/13),
                //               //width: 28.15,
                //               height: 28.15,
                //               alignment: Alignment.center,
                //               decoration: BoxDecoration(
                //                 // color: index1==5&&index==5 || index1==5&&index==1 || index1==7&&index==3?Color(0xff151515).withOpacity(0.7):Color(0xff74C171),
                //                 color: index1==5&&index==5 || index1==5&&index==1 || index1==7&&index==3?Colors.transparent:Color(0xff74C171),
                //                 borderRadius: BorderRadius.only(
                //                   topLeft: index==0 && index1==0?Radius.circular(10):Radius.circular(0),
                //                   bottomLeft: index==12 && index1==0?Radius.circular(10):Radius.circular(0),
                //                   topRight: index==0 && index1==12?Radius.circular(10):Radius.circular(0),
                //                   bottomRight: index==12  && index1==12?Radius.circular(4):Radius.circular(0),
                //                 ),
                //                 border: Border.all(width: 1, style: BorderStyle.solid, color: Color(0xffffffff))
                //               ),
                //               child: Text(
                //                 index1==5&&index==5?"12"
                //                     : index1==5&&index==1 || index1==7&&index==3?
                //                     "A":"",
                //                 style: GoogleFonts.roboto(
                //                   color: index1==5&&index==5 || index1==5&&index==1 || index1==7&&index==3?Color(0xffffffff):Color(0xff459F67),
                //                   // fontSize: 8.0,
                //                   fontSize: index1==5&&index==5?8:15.0,
                //                   // letterSpacing: -1.5,
                //                   fontWeight: FontWeight.w700,
                //                   // height: 23.44,
                //                 ),
                //               ),
                //             );
                //           }),
                //         );
                //       }),
                //     ),
                //   ),
                // ),
                Positioned(
                  // top: 150,
                  // top: 145,
                  // left: 30,
                  // left: 15,
                  // top: display.height*(30/700),
                  // top: 145 / mockupHeight * height,
                  // top: (145*scale) / mockupHeight * height,
                  /*top: (height<=640?120:145*scale) / mockupHeight * height,*/
                  /*top: isTablat?185:(height<=640?120:145*scale) / mockupHeight * height,*/
                  top: isTablat?(height<1000?150:185):(height<=640?120:145*scale) / mockupHeight * height,
                  child: Container(
                    // margin: EdgeInsets.all(10),
                    margin: EdgeInsets.all((12*scale) / mockupWidth * width),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // children: List.generate((boardData["board"] as List).length, (index) {
                      children: List.generate(row, (index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // children: ((boardData["board"] as List)[index] as List).map((e) {
                          //   return Container(
                          //     // width: (display.width/13)-(20/13),
                          //     // width: 28.15,
                          //     width: (display.width/13)-(20/13),
                          //     height: 28.15,
                          //     alignment: Alignment.center,
                          //     decoration: BoxDecoration(
                          //         // color: colors.white,
                          //         color: e==""?colors.lightGreen:Colors.transparent,
                          //         //   borderRadius: BorderRadius.only(
                          //         //     topLeft: index==0 && index1==0?Radius.circular(10):Radius.circular(0),
                          //         //     bottomLeft: index==12 && index1==0?Radius.circular(10):Radius.circular(0),
                          //         //     topRight: index==0 && index1==12?Radius.circular(10):Radius.circular(0),
                          //         //     bottomRight: index==12  && index1==12?Radius.circular(10):Radius.circular(0),
                          //
                          //         //     topLeft: index==0 && index1==0?Radius.circular(4):Radius.circular(0),
                          //         //     bottomLeft: index==12 && index1==0?Radius.circular(4):Radius.circular(0),
                          //         //     topRight: index==0 && index1==12?Radius.circular(4):Radius.circular(0),
                          //         //     bottomRight: index==12  && index1==12?Radius.circular(4):Radius.circular(0),
                          //
                          //         //   ),
                          //
                          //         border: Border.all(width: 1, style: BorderStyle.solid, color: Color(0xffffffff))
                          //         // border: Border.all(width: 0.5, style: BorderStyle.solid, color: Color(0xffffffff))
                          //     ),
                          //     child: Text(//"${e}",
                          //       "${(boardData["script"] as Map<String, dynamic>).containsKey(e)?(boardData["script"] as Map<String, dynamic>)[e]:e}",
                          //       style: GoogleFonts.roboto(
                          //         // color: colors.green,
                          //         // color: colors.white,
                          //         color: e==""?colors.green:colors.white,
                          //         // fontSize: index1==5&&index==5?8:15.0,
                          //         // fontWeight: FontWeight.w700,
                          //         fontSize: (boardData["script"] as Map<String, dynamic>).containsKey(e)?
                          //           15:10,
                          //         fontWeight: (boardData["script"] as Map<String, dynamic>).containsKey(e)?
                          //           FontWeight.w700:FontWeight.w400,
                          //       ),
                          //     ),
                          //   );
                          // }).toList(),
                          children: List.generate(row, (index1) {
                          // children: List.generate((boardData["board"] as List)[index].length, (index1) {
                            return InkWell(
                              onTap: (){

                                // setState(() {
                                //   selectedKey;
                                // });
                                // print('selectedKey $selectedKey');
                                // if((boardData["script1"] as Map<String, dynamic>).containsKey('${selectedKey}')){
                                //   return;
                                // }

                                boardClick = true;

                                final String hintKey = ((boardData["board"] as List)[index] as List)[index1];

                                selectedKey = hintKey;
                                print('selectedKey $selectedKey');
                                // keypad = (boardData["result"] as Map<String, dynamic>)[hintKey];
                                keypad = (boardData["script"] as Map<String, dynamic>)[hintKey] ?? "";
                                print('keypad $keypad');

                                // print(((boardData["board"] as List)[index] as List)[index1]);
                                // print((boardData["script1"] as Map<String, dynamic>).containsKey(selectedKey));
                                // print((boardData["script"] as Map<String, dynamic>).containsKey(selectedKey));

                                // print((selectedKey!="" &&
                                //     (selectedKey==((boardData["board"] as List)[index] as List)[index1]
                                //         ||(
                                //             !((boardData["script1"] as Map<String, dynamic>).containsKey(selectedKey))
                                //                 && (boardData["script"] as Map<String, dynamic>).containsKey(selectedKey)
                                //         )
                                //     )
                                // ));

                                // print((boardData["script"] as Map<String, dynamic>)[((boardData["board"] as List)[index] as List)[index1]]
                                //     == keypad);
                                //
                                // print((boardData["script"] as Map<String, dynamic>).containsKey(((boardData["board"] as List)[index] as List)[index1])?
                                // ((15*scale)/mockupWidth*width): ((10*scale)/mockupWidth*width));

                                // print('script1 ${(boardData["script1"] as Map<String, dynamic>).containsKey('${selectedKey}')}');
                                if((boardData["script1"] as Map<String, dynamic>).containsKey('${selectedKey}')){
                                  setState(() {
                                    hint = false;
                                    keypad = "";
                                    selectedKey = "";
                                  });
                                  // return;
                                }else{
                                  setState(() {
                                    hint = true;
                                  });
                                }

                                // hint = true;
                                // setState(() {
                                //   hint = true;
                                // });

                              },
                              child: Container(
                                // width: (display.width/13)-(20/13),
                                // width: 28.15,
                                // width: (display.width/13)-(20/13),
                                // width: (display.width/col)-(20/col)>28.15?28.15:(display.width/col)-(20/col),
                                // // height: 28.15,
                                // height: (display.width/row)-(20/row)>28.15?28.15:(display.width/row)-(20/row),

                                // width: 28.15 / mockupWidth * width,
                                // height: 28.15 / mockupWidth * width,

                                // width: ((display.width/col)-(20/col)>28.15?28.15:(display.width/col)-(20/col)) / mockupWidth * width,
                                // height: (display.width/row)-(20/row)>28.15?28.15:(display.width/row)-(20/row),
                                // width: ((display.width/col)-(20/col)>28.15?
                                //   width<=360?28.15:28.15
                                //     :(display.width/col)-(20/col)) / mockupWidth * width,

                                // width: (col>13?24.15:28.15) / mockupWidth * width,
                                // height: (col>13?24.15:28.15) / mockupWidth * width,

                                width: (col==15?24.15
                                    :col==14?26.15
                                    :col==13?28.15
                                    :col==11?33.15
                                    : 24.15) / mockupWidth * width,
                                height: (col==15?24.15
                                    :col==14?26.15
                                    :col==13?28.15
                                    :col==11?33.15
                                    :24.15) / mockupWidth * width,


                                // height: 28.15 / mockupHeight * height,


                                // width: (28.15*scale) / mockupWidth * width,
                                // height: (28.15*scale) / mockupWidth * width,

                                // width: (display.width/col)-(20/col),
                                // height: (display.width/row)-(20/row),

                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  // color: colors.white,
                                  //   color: e==""?colors.lightGreen:Colors.transparent,
                                  color: ((boardData["board"] as List)[index] as List)[index1]==""?colors.lightGreen:Colors.transparent,
                                      borderRadius: BorderRadius.only(
                                        // topLeft: index==0 && index1==0?Radius.circular(10):Radius.circular(0),
                                        // bottomLeft: index==12 && index1==0?Radius.circular(10):Radius.circular(0),
                                        // topRight: index==0 && index1==12?Radius.circular(10):Radius.circular(0),
                                        // bottomRight: index==12  && index1==12?Radius.circular(10):Radius.circular(0),

                                        // topLeft: index==0 && index1==0?Radius.circular(4):Radius.circular(0),
                                        // bottomLeft: index==12 && index1==0?Radius.circular(4):Radius.circular(0),
                                        // topRight: index==0 && index1==12?Radius.circular(4):Radius.circular(0),
                                        // bottomRight: index==12  && index1==12?Radius.circular(4):Radius.circular(0),

                                        topLeft: index==0 && index1==0?Radius.circular(4):Radius.circular(0),
                                        bottomLeft: index==row-1 && index1==0?Radius.circular(4):Radius.circular(0),
                                        topRight: index==0 && index1==col-1?Radius.circular(4):Radius.circular(0),
                                        bottomRight: index==row-1  && index1==col-1?Radius.circular(4):Radius.circular(0),

                                      ),

                                    border: Border.all(width: 1, style: BorderStyle.solid, color: Color(0xffffffff))
                                  // border: Border.all(width: 0.5, style: BorderStyle.solid, color: Color(0xffffffff))
                                ),
                                child: Text(//"${e}",
                                  // "${(boardData["script"] as Map<String, dynamic>).containsKey(e)?(boardData["script"] as Map<String, dynamic>)[e]:e",

                                  "${(boardData["script"] as Map<String, dynamic>).containsKey(
                                      ((boardData["board"] as List)[index] as List)[index1]
                                  )?
                                  (boardData["script"] as Map<String, dynamic>)[
                                  ((boardData["board"] as List)[index] as List)[index1]
                                  ]==""? ((boardData["board"] as List)[index] as List)[index1]:
                                  (boardData["script"] as Map<String, dynamic>)[
                                    ((boardData["board"] as List)[index] as List)[index1]
                                  ]
                                      :((boardData["board"] as List)[index] as List)[index1]}",
                                  // :"${((boardData["board"] as List)[index] as List)[index1]}",
                                  style: GoogleFonts.roboto(
                                    // color: colors.green,
                                    // color: colors.white,
                                    // color: e==""?colors.green:colors.white,

                                    // color: (boardData["script"] as Map<String, dynamic>)[
                                    //   ((boardData["board"] as List)[index] as List)[index1]
                                    // ]==""? colors.white:
                                    // ((boardData["board"] as List)[index] as List)[index1]==""?colors.green:colors.white,

                                    /*
                                    color: (boardData["script"] as Map<String, dynamic>)[
                                    ((boardData["board"] as List)[index] as List)[index1]
                                    ]==""?

                                    (selectedKey!="" && selectedKey==((boardData["board"] as List)[index] as List)[index1])?
                                    (boardData["script1"] as Map<String, dynamic>).containsKey(selectedKey)?colors.white:Colors.amber:

                                    colors.white:
                                    ((boardData["board"] as List)[index] as List)[index1]==""?colors.green :


                                    !(boardData["script1"] as Map<String, dynamic>).containsValue(
                                        (boardData["script"] as Map<String, dynamic>)[((boardData["board"] as List)[index] as List)[index1]] )?colors.lightBlue://


                                    colors.white,
                                    */

                                    color:
                                    (((boardData["board"] as List)[index] as List)[index1] == selectedKey)? Colors.amber :

                                    (boardData["script"] as Map<String, dynamic>)[
                                    ((boardData["board"] as List)[index] as List)[index1]
                                    ]==""?

                                    (selectedKey!="" && selectedKey==((boardData["board"] as List)[index] as List)[index1])?
                                    (boardData["script1"] as Map<String, dynamic>).containsKey(selectedKey)?colors.white:Colors.amber:

                                    colors.white:
                                    ((boardData["board"] as List)[index] as List)[index1]==""?colors.green :


                                    !(boardData["script1"] as Map<String, dynamic>).containsValue(
                                        (boardData["script"] as Map<String, dynamic>)[((boardData["board"] as List)[index] as List)[index1]] )?colors.lightBlue://


                                    colors.white,


                                    /*
                                    color: (boardData["script"] as Map<String, dynamic>)[
                                    ((boardData["board"] as List)[index] as List)[index1]
                                    ]==""?

                                    // (selectedKey!="" && selectedKey==((boardData["board"] as List)[index] as List)[index1])?
                                    (selectedKey!="" &&
                                        (selectedKey==((boardData["board"] as List)[index] as List)[index1]
                                            ||(
                                                !((boardData["script1"] as Map<String, dynamic>).containsKey(selectedKey))
                                                    && (boardData["script"] as Map<String, dynamic>).containsKey(selectedKey)
                                            )
                                        )
                                    )?
                                    (
                                        !((boardData["script1"] as Map<String, dynamic>).containsKey(selectedKey))
                                            && (boardData["script"] as Map<String, dynamic>).containsKey(selectedKey)
                                    )?
                                    (
                                        (boardData["script"] as Map<String, dynamic>)[((boardData["board"] as List)[index] as List)[index1]]
                                            == keypad)?Colors.amber:colors.white:
                                    (boardData["script1"] as Map<String, dynamic>).containsKey(selectedKey)?colors.white:Colors.amber:

                                    colors.white:
                                    // selectedKey!="" && (
                                    //     !((boardData["script1"] as Map<String, dynamic>).containsKey(selectedKey))
                                    //         && (boardData["script"] as Map<String, dynamic>).containsKey(selectedKey)
                                    // )?Colors.amber:colors.white:

                                    ((boardData["board"] as List)[index] as List)[index1]==""?colors.green :


                                    !(boardData["script1"] as Map<String, dynamic>).containsValue(
                                        (boardData["script"] as Map<String, dynamic>)[((boardData["board"] as List)[index] as List)[index1]] )?colors.lightBlue://

                                    // colors.white,
                                    (
                                        !((boardData["script1"] as Map<String, dynamic>).containsKey(selectedKey))
                                            && (boardData["script"] as Map<String, dynamic>).containsKey(selectedKey)
                                    )?
                                    (
                                        (boardData["script"] as Map<String, dynamic>)[((boardData["board"] as List)[index] as List)[index1]]
                                            == keypad)?Colors.amber:colors.white

                                    :colors.white,
                                    */




                                    // fontSize: index1==5&&index==5?8:15.0,
                                    // fontWeight: FontWeight.w700,
                                    //fontSize: (boardData["script"] as Map<String, dynamic>).containsKey(e)?
                                    // fontSize: (boardData["script"] as Map<String, dynamic>)[
                                    // ((boardData["board"] as List)[index] as List)[index1]
                                    // ]==""? 10:
                                    // (boardData["script"] as Map<String, dynamic>).containsKey(
                                    //     ((boardData["board"] as List)[index] as List)[index1]
                                    // )? 15:10,

                                    /*

                                      fontSize: (boardData["script"] as Map<String, dynamic>)[
                                      ((boardData["board"] as List)[index] as List)[index1]
                                      ]==""?

                                      // (selectedKey!="" && selectedKey==((boardData["board"] as List)[index] as List)[index1])?
                                      (selectedKey!="" && (selectedKey==((boardData["board"] as List)[index] as List)[index1]))?
                                      (boardData["script1"] as Map<String, dynamic>).containsKey(selectedKey)?
                                      //10:15:
                                      // (10/mockupWidth*width):(15/mockupWidth*width):
                                      ((10*scale)/mockupWidth*width):((15*scale)/mockupWidth*width):
                                      // 10:
                                      // (10/mockupWidth*width):
                                      ((10*scale)/mockupWidth*width):
                                      (boardData["script"] as Map<String, dynamic>).containsKey(
                                          ((boardData["board"] as List)[index] as List)[index1]
                                      )?
                                      //15:10,
                                      // (15/mockupWidth*width):(10/mockupWidth*width),
                                      ((15*scale)/mockupWidth*width):((10*scale)/mockupWidth*width),
                                    */



                                    fontSize: // ((boardData["script"] as Map<String, dynamic>)[((boardData["board"] as List)[index] as List)[index1]]
                                    //     == keypad)? ((15*scale)/mockupWidth*width) :
                                    (((boardData["board"] as List)[index] as List)[index1] == selectedKey)? ((15*scale)/mockupWidth*width) :


                                    (boardData["script"] as Map<String, dynamic>)[((boardData["board"] as List)[index] as List)[index1]]==""?
                                        // (selectedKey!="" && selectedKey==((boardData["board"] as List)[index] as List)[index1])?
                                          (selectedKey!="" && (selectedKey==((boardData["board"] as List)[index] as List)[index1]))?
                                            (boardData["script1"] as Map<String, dynamic>).containsKey(selectedKey)? ((10*scale)/mockupWidth*width):((15*scale)/mockupWidth*width)
                                          : ((10*scale)/mockupWidth*width)
                                    : (boardData["script"] as Map<String, dynamic>).containsKey(((boardData["board"] as List)[index] as List)[index1])?
                                      ((15*scale)/mockupWidth*width): ((10*scale)/mockupWidth*width),

                                    // (selectedKey!="" && (selectedKey==((boardData["board"] as List)[index] as List)[index1]))?
                                    //   (boardData["script1"] as Map<String, dynamic>).containsKey(selectedKey)? ((10*scale)/mockupWidth*width):((15*scale)/mockupWidth*width)
                                    // : ((10*scale)/mockupWidth*width)
                                    /**/

                                    // // fontWeight: (boardData["script"] as Map<String, dynamic>).containsKey(e)?
                                    // fontWeight: (boardData["script"] as Map<String, dynamic>)[
                                    // ((boardData["board"] as List)[index] as List)[index1]
                                    // ]==""? FontWeight.w400:
                                    // (boardData["script"] as Map<String, dynamic>).containsKey(
                                    //     ((boardData["board"] as List)[index] as List)[index1]
                                    // )?
                                    // FontWeight.w700:FontWeight.w400,

                                      /*fontWeight: (boardData["script"] as Map<String, dynamic>)[
                                      ((boardData["board"] as List)[index] as List)[index1]
                                      ]==""?

                                      (selectedKey!="" && selectedKey==((boardData["board"] as List)[index] as List)[index1])?
                                      (boardData["script1"] as Map<String, dynamic>).containsKey(selectedKey)?FontWeight.w400:FontWeight.w700:

                                      FontWeight.w400:
                                      (boardData["script"] as Map<String, dynamic>).containsKey(
                                          ((boardData["board"] as List)[index] as List)[index1]
                                      )?
                                      FontWeight.w700:FontWeight.w400,*/

                                      fontWeight:

                                      (((boardData["board"] as List)[index] as List)[index1] == selectedKey)? FontWeight.w700 :


                                      (boardData["script"] as Map<String, dynamic>)[
                                      ((boardData["board"] as List)[index] as List)[index1]
                                      ]==""?

                                      (selectedKey!="" && selectedKey==((boardData["board"] as List)[index] as List)[index1])?
                                      (boardData["script1"] as Map<String, dynamic>).containsKey(selectedKey)?FontWeight.w400:FontWeight.w700:

                                      FontWeight.w400:
                                      (boardData["script"] as Map<String, dynamic>).containsKey(
                                          ((boardData["board"] as List)[index] as List)[index1]
                                      )?
                                      FontWeight.w700:FontWeight.w400,



                                  ),
                                ),
                              ),
                            );
                          }),
                        );
                      }).toList(),
                    ),
                  ),
                ),

                /*
                //texts
                Positioned(
                  // top: 550+15,
                  // left: 30,
                  // left: 15,
                  // top: display.height*(30/700),
                  // top: 553 / mockupHeight * height,

                  // top: ((553+10)*scale) / mockupHeight * height,

                  // top: ((height<840?553:(553+10))*scale) / mockupHeight * height,
                  // top: ((height<840?(height<=720?525:553):(553+10))*scale) / mockupHeight * height,
                  // top: ((height<840?(height<=720?(height<=640?530:525):553):(553+10))*scale) / mockupHeight * height,
                  top: ((height<840?height<=800&&height>720?495:(height<=720?(height<=640?530:525):553):(553+10))*scale) / mockupHeight * height,

                  child: Container(
                    // margin: EdgeInsets.all(10),
                    margin: EdgeInsets.all((12*scale) / mockupWidth * width),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: List.generate(2, (index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(13, (index1) {
                            return InkWell(
                              onTap: () async {
                                // if((boardData["script"] as Map<String, dynamic>)['${index==0?index+1+index1:14+index1}']==""){

                                //   if((boardData["script"] as Map<String, dynamic>).containsKey(
                                //       '${index==0?index+1+index1:14+index1}')
                                //   && (boardData["script"] as Map<String, dynamic>)['${index==0?index+1+index1:14+index1}']==""){
                                //
                                //     setState(() {
                                //       (boardData["script"] as Map<String, dynamic>);
                                //     });
                                //
                                //     setState(() {
                                //       selectedKey = '${index==0?index+1+index1:14+index1}';
                                //     });
                                //     print('selectedKey == ${selectedKey}');
                                //   }

                                  await methods.playSound(file: "keypad").then((value) {
                                    Future.delayed(const Duration(milliseconds: 100),(){

                                      if((boardData["script"] as Map<String, dynamic>).containsKey(
                                          '${index==0?index+1+index1:14+index1}')
                                          && (boardData["script"] as Map<String, dynamic>)['${index==0?index+1+index1:14+index1}']==""){

                                        setState(() {
                                          (boardData["script"] as Map<String, dynamic>);
                                        });

                                        setState(() {
                                          selectedKey = '${index==0?index+1+index1:14+index1}';
                                        });
                                        print('selectedKey == ${selectedKey}');
                                      }

                                    });
                                  });

                                // }
                                // else{
                                //   if(!(boardData["script"] as Map<String, dynamic>).containsKey(
                                //       '${index==0?index+1+index1:14+index1}')){
                                //
                                //     setState(() {
                                //       (boardData["script"] as Map<String, dynamic>);
                                //     });
                                //
                                //     setState(() {
                                //       selectedKey = '${index==0?index+1+index1:14+index1}';
                                //     });
                                //     print('selectedKey == ${selectedKey}');
                                //   }
                                // }

                              },
                              child: Container(
                                  // width: (display.width/13)-(20/13),
                                // width: 28.15,
                                // height: 28.15,
                                //   width: 28.15 / mockupWidth * width,
                                  // height: 37.15 / mockupHeight * height,
                                  // height: 37.15 / mockupWidth * width,

                                  // width: (28.15*scale) / mockupWidth * width,
                                  // height: (37.15*scale) / mockupWidth * width,

                                  // width: (height>802?28.15:(28.15*scale)) / mockupWidth * width,
                                  // height: (height>802?37.15:(37.15*scale)) / mockupWidth * width,

                                  // width: (height>802?28.15:height<=720?(26*scale):(28.15*scale)) / mockupWidth * width,
                                  width: (height>802?28.15:height<=800&&height>720?(26.15*scale):height<=720?(26*scale):(28.15*scale)) / mockupWidth * width,
                                  // height: (height>802?37.15:height<=720?(37.15*scale):(37.15*scale)) / mockupWidth * width,
                                  height: (height>802?37.15:height<=720?(height<=640?42:37.15*scale):(37.15*scale)) / mockupWidth * width,

                                  // height: 35.15 / mockupWidth * width,

                                // width: 30.15,
                                // height: 30.15,
                                alignment: Alignment.topLeft,
                                padding: EdgeInsets.all(5/mockupWidth*width),
                                decoration: BoxDecoration(
                                  // color: index1==5&&index==1 || index1==7&&index==0?Color(0xffC87670):Color(0xffffffff),
                                  color:
                                    selectedKey == '${index==0?index+1+index1:14+index1}'
                                    ?//Color(0xffC87670)
                                    hint?Colors.amber:Color(0xffC87670)
                                      :
                                    (boardData["script"] as Map<String, dynamic>)['${index==0?index+1+index1:14+index1}']==""? Color(0xffffffff):
                                    (boardData["script"] as Map<String, dynamic>).containsKey(
                                      '${index==0?index+1+index1:14+index1}'
                                  )?Color(0xffC87670):Color(0xffffffff),
                                  // borderRadius: BorderRadius.only(
                                  //   topLeft: index==0 && index1==0?Radius.circular(10):Radius.circular(0),
                                  //   bottomLeft: index==12 && index1==0?Radius.circular(10):Radius.circular(0),
                                  //   topRight: index==0 && index1==12?Radius.circular(10):Radius.circular(0),
                                  //   bottomRight: index==12  && index1==12?Radius.circular(4):Radius.circular(0),
                                  // ),
                                  border: Border.all(width: 1.5, style: BorderStyle.solid, color: Color(0xff151515).withOpacity(0.7)),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      //index1==5&&index==1?"12":"",
                                      '${index==0?index+1+index1:14+index1}',
                                      style: GoogleFonts.roboto(
                                        // color: index1==5&&index==1 || index1==7&&index==0?Color(0xffffffff):Color(0xff6A6A6A),
                                        color:
                                        selectedKey == '${index==0?index+1+index1:14+index1}'
                                            ?Color(0xffffffff)
                                            :(boardData["script"] as Map<String, dynamic>)['${index==0?index+1+index1:14+index1}']==""? Color(0xff6A6A6A)
                                            :(boardData["script"] as Map<String, dynamic>).containsKey(
                                            '${index==0?index+1+index1:14+index1}'
                                        )?Color(0xffffffff):Color(0xff6A6A6A),
                                        // fontSize: 8.0,
                                        // fontSize: 10.0 / mockupWidth * width,
                                        fontSize: (10*scale) / mockupWidth * width,
                                        // fontSize: hint?12:10,
                                        // fontSize: index1==5&&index==1?8:15.0,
                                        // letterSpacing: -1.5,
                                        fontWeight: FontWeight.w600,
                                        // height: 23.44,
                                      ),
                                    ),

                                    //index1==5&&index==1 || index1==7&&index==0?
                                    Container(
                                      // top: 8,
                                      // left: 8,
                                      // margin: EdgeInsets.only(left: (10*scale)/mockupWidth*width),
                                      margin: EdgeInsets.only(left: ((height<=720?7:10)*scale)/mockupWidth*width),
                                      child: Text(
                                        //index1==5&&index==1?"12":"",
                                        // '${index==0?index+1+index1:14+index1}',
                                        //'A',

                                        // hint?
                                        // ((index==0?index+1+index1:14+index1) == (boardData["script"] as Map<String, dynamic>)[selectedKey] ? keypad : "")
                                        //
                                        //     :

                                        "${(boardData["script"] as Map<String, dynamic>).containsKey(
                                          '${index==0?index+1+index1:14+index1}'
                                        )? //(boardData["script"] as Map<String, dynamic>)['${index==0?index+1+index1:14+index1}']

                                        hint && selectedKey == '${index==0?index+1+index1:14+index1}'? keypad :
                                        (boardData["script"] as Map<String, dynamic>)['${index==0?index+1+index1:14+index1}']
                                        :""}",

                                        //: hint? (boardData["result"] as Map<String, dynamic>)[selectedKey] : ""}",
                                        style: GoogleFonts.roboto(
                                          //color: index1==5&&index==1 || index1==7&&index==0?Color(0xffffffff):Color(0xff6A6A6A),
                                          color:
                                          (boardData["script"] as Map<String, dynamic>)['${index==0?index+1+index1:14+index1}']==""? //Color(0xff6A6A6A):

                                          hint?Color(0xffffffff) : Color(0xff6A6A6A):

                                          (boardData["script"] as Map<String, dynamic>).containsKey(
                                              '${index==0?index+1+index1:14+index1}'
                                          )?Color(0xffffffff):Color(0xff6A6A6A),
                                          // fontSize: 8.0,
                                          // fontSize: 10.0/mockupWidth*width,
                                          fontSize: (10*scale) / mockupWidth * width,
                                          // fontSize: index1==5&&index==1?8:15.0,
                                          // letterSpacing: -1.5,
                                          fontWeight: FontWeight.w600,
                                          // height: 23.44,
                                        ),
                                      ),
                                    ),
                                    //:Container(),

                                  ],
                                )
                              ),
                            );
                          }),
                        );
                      }),
                    ),
                  ),
                ),
                */

                //keypad
                Positioned(
                  // top: 650,
                  // left: 30,
                  // left: 15,
                  // top: display.height*(30/700),
                  // top: 644 / mockupWidth * width,
                  // top: (644*scale) / mockupWidth * width,
                  // top: ((644*scale) / mockupWidth * width) + (37.15 / mockupHeight * height),
                  // top: height>802?(((644*scale) / mockupWidth * width) + (37.15 / mockupHeight * height)):((644*scale) / mockupWidth * width),

                  // top: height>802?
                  // height<840?
                  // (((650*scale) / mockupWidth * width)):
                  // (((644*scale) / mockupWidth * width) + (37.15 / mockupHeight * height))
                  //     :((644*scale) / mockupWidth * width),

                  // top: height>802?
                  //   height<840? (((650*scale) / mockupWidth * width)):
                  //     (((644*scale) / mockupWidth * width) + (37.15 / mockupHeight * height))
                  // :
                  // // height<=720?((570*scale) / mockupWidth * width):
                  // height<=720?(((height<=640?515:570)*scale) / mockupWidth * width):
                  // ((644*scale) / mockupWidth * width),

                  /*
                  top: height>802?
                  height<840? (((650*scale) / mockupWidth * width)):
                  (((644*scale) / mockupWidth * width) + (37.15 / mockupHeight * height))
                      :
                  // height<=720?((570*scale) / mockupWidth * width):
                  height<=800&&height>720? 600:
                  height<=720?(((height<=640?515:570)*scale) / mockupWidth * width):
                  ((644*scale) / mockupWidth * width),
                  */

                  /*
                  top: height>802?
                  height<840? (((650*scale) / mockupWidth * width)):
                  (((644*scale) / mockupWidth * width) + (37.15 / mockupHeight * height))
                      :
                  height<=800&&height>720? 600:
                  height<=720?(((height<=640?515:570)*scale) / mockupWidth * width):
                  ((644*scale) / mockupWidth * width),
                  */

                  /*top: width + (130*scale)/mockupWidth*width,*/
                  top: width + (isTablat?80:(130*scale))/mockupWidth*width,


                  // top: ((height<840?553:(553+10))*scale) / mockupHeight * height,
                  child: Container(
                    // height: display.height,
                    // alignment: Alignment.bottomCenter,
                    // margin: EdgeInsets.all(10),
                    /*margin: EdgeInsets.all((12*scale) / mockupWidth * width),*/
                    margin: EdgeInsets.all(isTablat?12:(12*scale) / mockupWidth * width),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // children: List.generate(13, (index1) {
                          //   return Container(
                          //       width: (display.width/13)-(20/13),
                          //       // width: 28.15,
                          //       // height: 28.15,
                          //       height: 37.15,
                          //       // width: 30.15,
                          //       // height: 30.15,
                          //       alignment: Alignment.topLeft,
                          //       padding: EdgeInsets.all(5),
                          //       decoration: BoxDecoration(
                          //         color: index1==5 || index1==7?Color(0xffC87670):Color(0xffffffff),
                          //         // borderRadius: BorderRadius.only(
                          //         //   topLeft: index==0 && index1==0?Radius.circular(10):Radius.circular(0),
                          //         //   bottomLeft: index==12 && index1==0?Radius.circular(10):Radius.circular(0),
                          //         //   topRight: index==0 && index1==12?Radius.circular(10):Radius.circular(0),
                          //         //   bottomRight: index==12  && index1==12?Radius.circular(4):Radius.circular(0),
                          //         // ),
                          //         border: Border.all(width: 1.5, style: BorderStyle.solid, color: Color(0xff151515).withOpacity(0.7)),
                          //       ),
                          //       child: Column(
                          //         children: [
                          //           Text(
                          //             //index1==5&&index==1?"12":"",
                          //             // '${index==0?index+1+index1:14+index1}',
                          //             "",
                          //             style: GoogleFonts.roboto(
                          //               color: index1==5 || index1==7?Color(0xffffffff):Color(0xff6A6A6A),
                          //               // fontSize: 8.0,
                          //               fontSize: 10.0,
                          //               // fontSize: index1==5&&index==1?8:15.0,
                          //               // letterSpacing: -1.5,
                          //               fontWeight: FontWeight.w600,
                          //               // height: 23.44,
                          //             ),
                          //           ),
                          //
                          //           index1==5 || index1==7?
                          //           Container(
                          //             // top: 8,
                          //             // left: 8,
                          //             margin: EdgeInsets.only(left: 5),
                          //             child: Text(
                          //               //index1==5&&index==1?"12":"",
                          //               // '${index==0?index+1+index1:14+index1}',
                          //               'A',
                          //               style: GoogleFonts.roboto(
                          //                 color: index1==5 || index1==7?Color(0xffffffff):Color(0xff6A6A6A),
                          //                 // fontSize: 8.0,
                          //                 fontSize: 10.0,
                          //                 // fontSize: index1==5&&index==1?8:15.0,
                          //                 // letterSpacing: -1.5,
                          //                 fontWeight: FontWeight.w600,
                          //                 // height: 23.44,
                          //               ),
                          //             ),
                          //           )
                          //               :Container(),
                          //
                          //         ],
                          //       )
                          //   );
                          // }),

                          children: //["Q","W","E","R","T","Y","U","I","O","P"]
                          ["A","B","C","D","E","F","G","H","I","J"]
                              .map((e){
                            return InkWell(
                              onTap: () async {

                                boardClick = false;

                                // onKeyPress(e, "keypad");

                                // await methods.playSound(file: "soundscrate-graphics-game-blip-2");
                                // await methods.playSound(file: "keypad");
                                // SystemSound.play(SystemSoundType.click);

                                // await methods.playSound(file: "keypad").then((value) {
                                //   Future.delayed(const Duration(milliseconds: 100),(){
                                //     onKeyPress(e, "keypad");
                                //   });
                                // });
                                Future.delayed(const Duration(milliseconds: 100),(){
                                  onKeyPress(e, "keypad");
                                });

                              },
                              child: Container(

                                  // width: 28.15,
                                  // height: 28.15,

                                // width: (display.width/10)-(20/10)-(2*2*10/10),
                                // height: 43,
                                width: 32 / mockupWidth * width,
                                height: 43 / mockupHeight * height,
                                // width: (32*scale) / mockupWidth * width,
                                // height: (43*scale) / mockupHeight * height,
                                  // width: 30.15,
                                  // height: 30.15,
                                  alignment: Alignment.center,
                                  // padding: EdgeInsets.all(5),
                                  // margin: EdgeInsets.symmetric(horizontal: 2),
                                  /*margin: EdgeInsets.all((2*scale)/ mockupWidth * width),*/
                                  /*margin: EdgeInsets.all(isTablat?5:(2*scale)/ mockupWidth * width),*/
                                  margin: EdgeInsets.all(isTablat?(width<900?4:5):(2*scale)/ mockupWidth * width),
                                  decoration: BoxDecoration(
                                    // color: index1==5 || index1==7?Color(0xffC87670):Color(0xffffffff),
                                    // color: e=="E" || e=="D"?Color(0xffC87670):Color(0xffffffff),

                                    // color: Color(0xffffffff),
                                    // color: (boardData["script"] as Map<String, dynamic>).containsValue(
                                    //     '${e}')?Color(0xffC87670):Color(0xffffffff),

                                    /*color: (boardData["script"] as Map<String, dynamic>).containsValue(
                                        '${e}')?
                                      !(boardData["script1"] as Map<String, dynamic>).containsValue(
                                        '${e}')?Color(0xffC87670):Color(0xffffffff)
                                    :Color(0xffffffff),*/

                                      // color:
                                      // // hint? (boardData["result"] as Map<String, dynamic>)[selectedKey]=='$e'?Colors.amber:Color(0xffffffff):
                                      // // nHint? (boardData["result"] as Map<String, dynamic>)[selectedKey]=='$e'?Colors.amber:Color(0xffffffff):
                                      //
                                      // (boardData["script"] as Map<String, dynamic>).containsValue(
                                      //     '${e}')?
                                      // !(boardData["script1"] as Map<String, dynamic>).containsValue(
                                      //     '${e}')?Color(0xffC87670):
                                      // nHint? (boardData["result"] as Map<String, dynamic>)[selectedKey]=='$e'?Colors.amber:Color(0xffffffff):
                                      // Color(0xffffffff)
                                      //     :Color(0xffffffff),

                                    color:
                                    (boardData["script"] as Map<String, dynamic>).containsValue('${e}')?
                                    // !(boardData["script1"] as Map<String, dynamic>).containsValue('${e}')?Color(0xffC87670):
                                    !(boardData["script1"] as Map<String, dynamic>).containsValue('${e}')?nHint? (boardData["result"] as Map<String, dynamic>)[selectedKey]=='$e'?Colors.amber:Color(0xffC87670):Color(0xffC87670):

                                    // Color(0xffffffff)
                                    Colors.green
                                        : nHint? (boardData["result"] as Map<String, dynamic>)[selectedKey]=='$e'?Colors.amber:Color(0xffffffff): Color(0xffffffff),


                                      // Colors.amber:Color(0xffC87670)
                                      // Color(0xffffffff):Color(0xff6A6A6A)

                                    // borderRadius: BorderRadius.only(
                                    //   topLeft: index==0 && index1==0?Radius.circular(10):Radius.circular(0),
                                    //   bottomLeft: index==12 && index1==0?Radius.circular(10):Radius.circular(0),
                                    //   topRight: index==0 && index1==12?Radius.circular(10):Radius.circular(0),
                                    //   bottomRight: index==12  && index1==12?Radius.circular(4):Radius.circular(0),
                                    // ),
                                    borderRadius: BorderRadius.circular(5/ mockupWidth * width),
                                    border: Border.all(width: 1, style: BorderStyle.solid, color: Color(0xff151515).withOpacity(0.7)),
                                  ),
                                  child: Text(
                                    //index1==5&&index==1?"12":"",
                                    // '${index==0?index+1+index1:14+index1}',
                                    "${e}",
                                    style: //GoogleFonts.roboto(
                                    TextStyle(
                                      fontFamily: 'SFProText',
                                      // color: e=="E" || e=="D"?Color(0xffffffff):Color(0xff6A6A6A),
                                      // color: e=="E" || e=="D"?Color(0xffBDBDBD):Color(0xff4F4F4F),


                                      // color: (boardData["script"] as Map<String, dynamic>).containsValue(
                                      //     '${e}')?Color(0xffBDBDBD):Color(0xff4F4F4F),
                                      // color: (boardData["script"] as Map<String, dynamic>).containsValue(
                                      //     '${e}')?Color(0xffffffff):Color(0xff4F4F4F),
                                      /*color: (boardData["script"] as Map<String, dynamic>).containsValue(
                                          '${e}')?
                                        !(boardData["script1"] as Map<String, dynamic>).containsValue(
                                          '${e}')?Color(0xffffffff):Color(0xffBDBDBD)
                                      :Color(0xff4F4F4F),
                                      */
                                      color:
                                      (boardData["script"] as Map<String, dynamic>).containsValue(
                                          '${e}')?
                                      !(boardData["script1"] as Map<String, dynamic>).containsValue(
                                          // '${e}')?Color(0xffffffff):Color(0xffBDBDBD)
                                          // '${e}')?Color(0xffffffff):Colors.green
                                          '${e}')?Color(0xffffffff):Colors.white
                                          :
                                      nHint? (boardData["result"] as Map<String, dynamic>)[selectedKey]=='$e'?Color(0xffffffff):Color(0xff4F4F4F):

                                      Color(0xff4F4F4F),

                                        // Color(0xffC87670):Color(0xffffffff)

                                      // fontSize: 8.0,
                                      fontSize: (24*scale) / mockupWidth * width,
                                      // fontSize: index1==5&&index==1?8:15.0,
                                      // letterSpacing: -1.5,
                                      fontWeight: FontWeight.w300,
                                      // height: 23.44,
                                    ),
                                  ),
                              ),
                            );
                          }).toList(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: //["A","S","D","F","G","H","J","K","L"]
                          ["K","L","M","N","O","P","Q","R","S"]
                              .map((e){
                            return InkWell(
                              onTap: () async {

                                boardClick = false;

                                // onKeyPress(e, "keypad");

                                // await methods.playSound(file: "keypad").then((value) {
                                //   Future.delayed(const Duration(milliseconds: 100),(){
                                //     onKeyPress(e, "keypad");
                                //   });
                                // });
                                Future.delayed(const Duration(milliseconds: 100),(){
                                  onKeyPress(e, "keypad");
                                });

                              },
                              child: Container(
                                // width: (display.width/10)-(20/10)-(2*2*10/10),
                                // // width: 28.15,
                                // // height: 28.15,
                                // height: 43,
                                width: 32 / mockupWidth * width,
                                height: 43 / mockupHeight * height,
                                // width: (32*scale) / mockupWidth * width,
                                // height: (43*scale) / mockupHeight * height,
                                // width: 30.15,
                                // height: 30.15,
                                alignment: Alignment.center,
                                // padding: EdgeInsets.all(5),
                                // margin: EdgeInsets.symmetric(horizontal: 2),
                                /*margin: EdgeInsets.all((2*scale) / mockupWidth * width),*/
                                /*margin: EdgeInsets.all(isTablat?5:(2*scale)/ mockupWidth * width),*/
                                margin: EdgeInsets.all(isTablat?(width<900?4:5):(2*scale)/ mockupWidth * width),
                                decoration: BoxDecoration(
                                  // color: index1==5 || index1==7?Color(0xffC87670):Color(0xffffffff),
                                  // color: e=="E" || e=="D"?Color(0xffC87670):Color(0xffffffff),

                                  // color: Color(0xffffffff),
                                  // color: (boardData["script"] as Map<String, dynamic>).containsValue(
                                  //     '${e}')?Color(0xffC87670):Color(0xffffffff),

                                  /*
                                  color: (boardData["script"] as Map<String, dynamic>).containsValue(
                                      '${e}')?
                                  !(boardData["script1"] as Map<String, dynamic>).containsValue(
                                      '${e}')?Color(0xffC87670):Color(0xffffffff)
                                      :Color(0xffffffff),
                                  */

                                  color:
                                  // hint? (boardData["result"] as Map<String, dynamic>)[selectedKey]=='$e'?Colors.amber:Color(0xffffffff):
                                  // nHint? (boardData["result"] as Map<String, dynamic>)[selectedKey]=='$e'?Colors.amber:Color(0xffffffff):

                                  (boardData["script"] as Map<String, dynamic>).containsValue('${e}')?
                                    // nHint? (boardData["result"] as Map<String, dynamic>)[selectedKey]=='$e'?Colors.amber:Color(0xffffffff):
                                    //   !(boardData["script1"] as Map<String, dynamic>).containsValue('${e}')?Color(0xffC87670):
                                  !(boardData["script1"] as Map<String, dynamic>).containsValue('${e}')?nHint? (boardData["result"] as Map<String, dynamic>)[selectedKey]=='$e'?Colors.amber:Color(0xffC87670):Color(0xffC87670):
                                      // nHint? (boardData["result"] as Map<String, dynamic>)[selectedKey]=='$e'?Colors.amber:Color(0xffffffff):
                                      // Color(0xffffffff)
                                      Colors.green
                                      // nHint? (boardData["result"] as Map<String, dynamic>)[selectedKey]=='$e'?Colors.amber:Color(0xffffffff):
                                      // Color(0xffffffff)

                                  // : Color(0xffffffff),
                                  : nHint? (boardData["result"] as Map<String, dynamic>)[selectedKey]=='$e'?Colors.amber:Color(0xffffffff): Color(0xffffffff),

                                  // borderRadius: BorderRadius.only(
                                  //   topLeft: index==0 && index1==0?Radius.circular(10):Radius.circular(0),
                                  //   bottomLeft: index==12 && index1==0?Radius.circular(10):Radius.circular(0),
                                  //   topRight: index==0 && index1==12?Radius.circular(10):Radius.circular(0),
                                  //   bottomRight: index==12  && index1==12?Radius.circular(4):Radius.circular(0),
                                  // ),
                                  borderRadius: BorderRadius.circular(5/mockupWidth*width),
                                  border: Border.all(width: 1, style: BorderStyle.solid, color: Color(0xff151515).withOpacity(0.7)),
                                ),
                                child: Text(
                                  //index1==5&&index==1?"12":"",
                                  // '${index==0?index+1+index1:14+index1}',
                                  "${e}",
                                  style: //GoogleFonts.roboto(
                                  TextStyle(
                                    fontFamily: 'SFProText',
                                    // color: e=="E" || e=="D"?Color(0xffffffff):Color(0xff6A6A6A),
                                    // color: e=="E" || e=="D"?Color(0xffBDBDBD):Color(0xff4F4F4F),

                                    // color: (boardData["script"] as Map<String, dynamic>).containsValue(
                                    //     '${e}')?Color(0xffBDBDBD):Color(0xff4F4F4F),
                                    // color: (boardData["script"] as Map<String, dynamic>).containsValue(
                                    //     '${e}')?Color(0xffffffff):Color(0xff4F4F4F),
                                    /*color: (boardData["script"] as Map<String, dynamic>).containsValue(
                                        '${e}')?
                                    !(boardData["script1"] as Map<String, dynamic>).containsValue(
                                        '${e}')?Color(0xffffffff):Color(0xffBDBDBD)
                                        :Color(0xff4F4F4F),
                                    */

                                    color:
                                    (boardData["script"] as Map<String, dynamic>).containsValue(
                                        '${e}')?
                                    !(boardData["script1"] as Map<String, dynamic>).containsValue(
                                        // '${e}')?Color(0xffffffff):Color(0xffBDBDBD)
                                        // '${e}')?Color(0xffffffff):Colors.green
                                        '${e}')?Color(0xffffffff):Colors.white
                                        :
                                    nHint? (boardData["result"] as Map<String, dynamic>)[selectedKey]=='$e'?Color(0xffffffff):Color(0xff4F4F4F):

                                    Color(0xff4F4F4F),




                                    // fontSize: 8.0,
                                    fontSize: (24*scale) / mockupWidth * width,
                                    // fontSize: index1==5&&index==1?8:15.0,
                                    // letterSpacing: -1.5,
                                    fontWeight: FontWeight.w300,
                                    // height: 23.44,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: //["Z","X","C","V","B","N","M",""]
                          ["T","U","V","W","X","Y","Z",""]
                              .map((e){
                            return InkWell(
                              onTap: () async {

                                boardClick = false;

                                // onKeyPress(e, "keypad");

                                // await methods.playSound(file: "keypad").then((value) {
                                //   Future.delayed(const Duration(milliseconds: 100),(){
                                //     onKeyPress(e, "keypad");
                                //   });
                                // });
                                Future.delayed(const Duration(milliseconds: 100),(){
                                  onKeyPress(e, "keypad");
                                });

                              },
                              child: Container(
                                // width: (display.width/10)-(20/10)-(2*2*10/10),
                                // width: e==""?50:(display.width/10)-(20/10)-(2*2*10/10),
                                // // width: 28.15,
                                // // height: 28.15,
                                // height: 43,
                                width: (e==""?43:32) / mockupWidth * width,
                                height: 43 / mockupHeight * height,
                                // width: ((e==""?43:32)*scale) / mockupWidth * width,
                                // height: (43*scale) / mockupHeight * height,
                                // width: 30.15,
                                // height: 30.15,
                                alignment: Alignment.center,
                                // padding: EdgeInsets.all(5),
                                // margin: EdgeInsets.symmetric(horizontal: 2),
                                /*margin: EdgeInsets.all((2*scale)/mockupWidth*width),*/
                                /*margin: EdgeInsets.all(isTablat?5:(2*scale)/ mockupWidth * width),*/
                                margin: EdgeInsets.all(isTablat?(width<900?4:5):(2*scale)/ mockupWidth * width),
                                decoration: BoxDecoration(
                                  // color: index1==5 || index1==7?Color(0xffC87670):Color(0xffffffff),
                                  // color: e=="E" || e=="D"?Color(0xffC87670):Color(0xffffffff),

                                  //color: Color(0xffffffff),
                                  // color: e==""?Color(0xff1E7757):Color(0xffffffff),
                                  // color: e==""?Color(0xff1E7757):(boardData["script"] as Map<String, dynamic>).containsValue(
                                  //     '${e}')?Color(0xffC87670):Color(0xffffffff),

                                  /*color: e==""?Color(0xff1E7757):
                                  (boardData["script"] as Map<String, dynamic>).containsValue(
                                      '${e}')?
                                  !(boardData["script1"] as Map<String, dynamic>).containsValue(
                                      '${e}')?Color(0xffC87670):Color(0xffffffff)
                                      :Color(0xffffffff),
                                  */

                                    // color:
                                    // e==""?Color(0xff1E7757):
                                    // // hint? (boardData["result"] as Map<String, dynamic>)[selectedKey]=='$e'?Colors.amber:Color(0xffffffff):
                                    // // nHint? (boardData["result"] as Map<String, dynamic>)[selectedKey]=='$e'?Colors.amber:Color(0xffffffff):
                                    //
                                    // (boardData["script"] as Map<String, dynamic>).containsValue(
                                    //     '${e}')?
                                    // !(boardData["script1"] as Map<String, dynamic>).containsValue(
                                    //     '${e}')?Color(0xffC87670):
                                    // nHint? (boardData["result"] as Map<String, dynamic>)[selectedKey]=='$e'?Colors.amber:Color(0xffffffff):
                                    // Color(0xffffffff)
                                    //     :Color(0xffffffff),


                                  color: e==""?Color(0xff1E7757):
                                  (boardData["script"] as Map<String, dynamic>).containsValue('${e}')?
                                  //!(boardData["script1"] as Map<String, dynamic>).containsValue('${e}')?Color(0xffC87670):
                                  !(boardData["script1"] as Map<String, dynamic>).containsValue('${e}')?nHint? (boardData["result"] as Map<String, dynamic>)[selectedKey]=='$e'?Colors.amber:Color(0xffC87670):Color(0xffC87670):
                                  // Color(0xffffffff)
                                  Colors.green
                                      : nHint? (boardData["result"] as Map<String, dynamic>)[selectedKey]=='$e'?Colors.amber:Color(0xffffffff): Color(0xffffffff),


                                  // borderRadius: BorderRadius.only(
                                  //   topLeft: index==0 && index1==0?Radius.circular(10):Radius.circular(0),
                                  //   bottomLeft: index==12 && index1==0?Radius.circular(10):Radius.circular(0),
                                  //   topRight: index==0 && index1==12?Radius.circular(10):Radius.circular(0),
                                  //   bottomRight: index==12  && index1==12?Radius.circular(4):Radius.circular(0),
                                  // ),
                                  borderRadius: BorderRadius.circular(5/ mockupWidth * width),
                                  border: Border.all(width: 1, style: BorderStyle.solid, color: Color(0xff151515).withOpacity(0.7)),
                                ),
                                child: e==""?Image.asset("assets/images/Union.png", scale: 3,)
                                    :Text(
                                  //index1==5&&index==1?"12":"",
                                  // '${index==0?index+1+index1:14+index1}',
                                  "${e}",
                                  style: //GoogleFonts.roboto(
                                  TextStyle(
                                    fontFamily: 'SFProText',
                                    // color: e=="E" || e=="D"?Color(0xffffffff):Color(0xff6A6A6A),
                                    // color: e=="E" || e=="D"?Color(0xffBDBDBD):Color(0xff4F4F4F),

                                    // color: (boardData["script"] as Map<String, dynamic>).containsValue(
                                    //     '${e}')?Color(0xffBDBDBD):Color(0xff4F4F4F),
                                    // color: (boardData["script"] as Map<String, dynamic>).containsValue(
                                    //     '${e}')?Color(0xffffffff):Color(0xff4F4F4F),

                                    /*color: (boardData["script"] as Map<String, dynamic>).containsValue(
                                        '${e}')?
                                    !(boardData["script1"] as Map<String, dynamic>).containsValue(
                                        '${e}')?Color(0xffffffff):Color(0xffBDBDBD)
                                        :Color(0xff4F4F4F),
                                    */
                                    color:
                                    (boardData["script"] as Map<String, dynamic>).containsValue(
                                        '${e}')?
                                    !(boardData["script1"] as Map<String, dynamic>).containsValue(
                                        // '${e}')?Color(0xffffffff):Color(0xffBDBDBD)
                                        // '${e}')?Color(0xffffffff):Colors.green
                                        '${e}')?Color(0xffffffff):Colors.white
                                        :
                                    nHint? (boardData["result"] as Map<String, dynamic>)[selectedKey]=='$e'?Color(0xffffffff):Color(0xff4F4F4F):

                                    Color(0xff4F4F4F),

                                    // fontSize: 8.0,
                                    fontSize: (24.0*scale)/mockupWidth * width,
                                    // fontSize: index1==5&&index==1?8:15.0,
                                    // letterSpacing: -1.5,
                                    fontWeight: FontWeight.w300,
                                    // height: 23.44,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ]
                    ),
                  ),
                ),


        /*        //win animation
                // !gameWin? Container():
                // Visibility(
                //   visible: gameWin,
                //   child:
                  Positioned(
                    // top: display.height/2,
                    // left: display.width/5,

                    // top: display.height/2 - (MediaQuery.of(context).size.height/8),

                    // top: display.height/2 - (MediaQuery.of(context).size.width/4),
                    // left: display.width/2 - (MediaQuery.of(context).size.width/4),

                    // left: 0,
                    // left: width,
                    left: gameWin?0:width,

                    child: TrophyWidget(width: width, height: height, onClose: winMethod,),
                  ),
                // ),
*/

                //animation
                /*Positioned(
                  // top: 50,
                  // left: 60,
                  // top: 50/mockupHeight*height,
                  // left: 60/mockupWidth*width,
                  top: ((25+73+13+8+5)*scale) / mockupHeight * height,
                  // right: ((26+15)*scale) / mockupWidth * width,
                  right: ((12)*scale) / mockupWidth * width,
                  child: Visibility(
                    visible: pointsCollected,
                    child: Container(
                      // width: 100,
                      // height: 200,
                      width: 200,
                      // height: 500,
                      child: Lottie.asset(
                        // 'assets/animations/90547-trophy-animation.json',
                        // 'assets/animations/9733-coin.json',
                        // 'assets/animations/9568-coin-collect.json',
                        'assets/animations/9568-coin-collect-35.json',
                        // width: 200,
                        // height: 200,
                        // width: MediaQuery.of(context).size.width/2,
                        // height: MediaQuery.of(context).size.width/2,
                        fit: BoxFit.cover,
                        // repeat: gameWinRepeat,
                        // reverse: false,

                        // reverse: true,
                        // repeat: false,
                        // repeat: true,

                        // animate: gameWinAnimate,
                      ),
                    ),
                  ),
                ),*/



                //progress
                Container(
                  // width: width,
                  // height: height,
                  alignment: Alignment.center,
                  child: showProgress?Container(
                    // width: 50,
                    // height: 50,
                    // alignment: Alignment.center,
                      child: const CircularProgressIndicator(
                        color: Colors.white,
                      )
                  ): Container(),
                ),

              ],
            ),
          ),
        ),
        /**/
      );
    //   ,
    // );
  }

}

// dialogWin (BuildContext context, MAudio? mAudio, DocumentSnapshot user, Function onClose) {//usr
//
//   Size display = MediaQuery.of(context).size;
//   double width = display.width;
//   double height = display.height;
//
//   const mockupWidth = 390;
//   const mockupHeight = 844;
//
//   final scale = mockupWidth / width;
//
//   showTransitionDialog(
//     context: context,
//     //child: dialogMenu(mAudio, user!),
//     child: Dialog(
//       elevation: 0,
//       // insetPadding: EdgeInsets.all(10),
//       // insetPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//       insetPadding: EdgeInsets.symmetric(horizontal: (30*scale)/mockupWidth*width, vertical: 10),
//       backgroundColor: Colors.transparent,
//       alignment: Alignment.center,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(20),
//       ), //this right here
//       child: StatefulBuilder(
//           builder: (context, setState) {
//
//             // print("width ${MediaQuery.of(context).size.width}");
//             // print("height ${MediaQuery.of(context).size.height}");
//
//             return TrophyWidget(width: width, height: height, onClose: onClose);
//           }),
//     ),
//   );
//
//   // return ;
// }

/*dialogWin (BuildContext context, DocumentSnapshot user, Function onClose) {//usr //MAudio? mAudio,

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

            // print("width ${MediaQuery.of(context).size.width}");
            // print("height ${MediaQuery.of(context).size.height}");

            return TrophyWidget(width: width, height: height, onClose: onClose);
          }),
    ),
  );

  // return ;
}
class TrophyWidget extends StatelessWidget {
  const TrophyWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.onClose,
  }) : super(key: key);

  final double width;
  final double height;
  final Function onClose;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      // width: 0,
      // width: gameWin?width:0,
      height: height,
      alignment: Alignment.center,
      child: Container(
        width: MediaQuery.of(context).size.width/2,
        height: MediaQuery.of(context).size.width/2,
        // margin: EdgeInsets.all(100),
        margin: EdgeInsets.all(50),
        child: Stack(
          children: [
            Container(
              // color: Colors.white70,
              margin: EdgeInsets.all(20),
              // padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
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
                    reverse: false,
                    // animate: gameWinAnimate,

                    repeat: true,

                    // controller: winAnimator,
                  onLoaded: (comp){
                      // winAnimator.animateTo(comp.durationFrames);
                  }
                ),
              ),
            ),

            Trophy(),

            Positioned(
              // top: -25,
              // right: -25,
              top: 10,
              right: 10,
              child: InkWell(
                // onTap: () async {
                //   // await winMethod();
                // },
                //onTap: onClose(),
                onTap: () async {
                  await onClose();
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
  }
}
class Trophy extends StatelessWidget {
  const Trophy({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}*/

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
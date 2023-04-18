
import 'dart:async';
import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:io';
import 'dart:math';
// import 'dart:typed_data';
import 'dart:ui';

// import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audioplayers_api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
// import 'package:f2f_puzzlegame/view/auth_screen.dart';
// import 'package:f2f_puzzlegame/view/screen_1.dart';
import '../view/screen_1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:kplayer/kplayer.dart';
// import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

import '../view/dialogs.dart';
import '../view/screen_4.dart';
// import 'package:soundpool/soundpool.dart';

import '../view/auth_screen.dart' as appAuth;

class strings {
  // static String testAdMobDevice = 'device id';
  // static int maxFailedLoadAttempts = 3;
}

class colors {
  static Color green = Color(0xff1E7455);
  static Color lightGreen = Color(0xff74C171);
  // static Color lightGreen = Color(0xff74C171);
  static Color red = Color(0xffC3333C);
  static Color white = Color(0xffFFFDF9);
  static Color pureWhite = Color(0xffFFFDF9);
  static Color orange = Color(0xffFD9696);
  static Color darkGreen = Color(0xff1E7757);
  static Color gray = Color(0xffBDBDBD);
  static Color darkGray = Color(0xff787878);
  static Color lightBlue = Color(0xff48D3FF);
}

class AdMob {

  // String testDevice = '800eeabc-dbd1-4f6e-8eb4-e97768ef5062';
  //String testDevice = 'ca-app-pub-3940256099942544~3347511713';
  String testDevice = 'ca-app-pub-8658866895706808~6526455993';
  int maxFailedLoadAttempts = 3;

  InterstitialAd? _interstitialAd;
  int _numInterstitialLoadAttempts = 0;

  RewardedAd? _rewardedAd;
  int _numRewardedLoadAttempts = 0;

  RewardedInterstitialAd? _rewardedInterstitialAd;
  int _numRewardedInterstitialLoadAttempts = 0;

  final AdRequest request = AdRequest(
    // keywords: <String>['foo', 'bar'],
    // contentUrl: 'http://foo.com/bar.html',
    // nonPersonalizedAds: true,
  );

  void _createInterstitialAd() {
    InterstitialAd.load(
        adUnitId: Platform.isAndroid
            // ? 'ca-app-pub-3940256099942544/1033173712'
            // : 'ca-app-pub-3940256099942544/4411468910',
            ? 'ca-app-pub-8658866895706808/4938042151'
            : 'ca-app-pub-3940256099942544/4411468910',
        request: request,
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            print('$ad loaded');
            _interstitialAd = ad;
            _numInterstitialLoadAttempts = 0;
            _interstitialAd!.setImmersiveMode(true);
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error.');
            _numInterstitialLoadAttempts += 1;
            _interstitialAd = null;
            if (_numInterstitialLoadAttempts < maxFailedLoadAttempts) {
              _createInterstitialAd();
            }
          },
        ));
  }
  void showInterstitialAd() {
    if (_interstitialAd == null) {
      print('Warning: attempt to show interstitial before loaded.');
      return;
    }
    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) =>
          print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        _createInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        _createInterstitialAd();
      },
    );
    _interstitialAd!.show();
    _interstitialAd = null;
  }

  void _createRewardedAd() {
    RewardedAd.load(
        adUnitId: Platform.isAndroid
            // ? 'ca-app-pub-3940256099942544/5224354917'
            // : 'ca-app-pub-3940256099942544/1712485313',
            ? 'ca-app-pub-8658866895706808/9579408019'
            : 'ca-app-pub-3940256099942544/1712485313',
        request: request,
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (RewardedAd ad) {
            print('$ad loaded.');
            _rewardedAd = ad;
            _numRewardedLoadAttempts = 0;
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('RewardedAd failed to load: $error');
            _rewardedAd = null;
            _numRewardedLoadAttempts += 1;
            if (_numRewardedLoadAttempts < maxFailedLoadAttempts) {
              _createRewardedAd();
            }
          },
        ));
  }
  void showRewardedAd() {
    if (_rewardedAd == null) {
      print('Warning: attempt to show rewarded before loaded.');
      return;
    }
    _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedAd ad) =>
          print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (RewardedAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        _createRewardedAd();
      },
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        _createRewardedAd();
      },
    );

    _rewardedAd!.setImmersiveMode(true);
    _rewardedAd!.show(
        onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
          print('$ad with reward $RewardItem(${reward.amount}, ${reward.type})');
        });
    _rewardedAd = null;
  }

  void _createRewardedInterstitialAd() {
    RewardedInterstitialAd.load(
        adUnitId: Platform.isAndroid
            // ? 'ca-app-pub-3940256099942544/5354046379'
            // : 'ca-app-pub-3940256099942544/6978759866',
            ? 'ca-app-pub-8658866895706808/3158056624'
            : 'ca-app-pub-3940256099942544/6978759866',
        request: request,
        rewardedInterstitialAdLoadCallback: RewardedInterstitialAdLoadCallback(
          onAdLoaded: (RewardedInterstitialAd ad) {
            print('$ad loaded.');
            _rewardedInterstitialAd = ad;
            _numRewardedInterstitialLoadAttempts = 0;
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('RewardedInterstitialAd failed to load: $error');
            _rewardedInterstitialAd = null;
            _numRewardedInterstitialLoadAttempts += 1;
            if (_numRewardedInterstitialLoadAttempts < maxFailedLoadAttempts) {
              _createRewardedInterstitialAd();
            }
          },
        ));
  }
  void showRewardedInterstitialAd() {
    if (_rewardedInterstitialAd == null) {
      print('Warning: attempt to show rewarded interstitial before loaded.');
      return;
    }
    _rewardedInterstitialAd!.fullScreenContentCallback =
        FullScreenContentCallback(
          onAdShowedFullScreenContent: (RewardedInterstitialAd ad) =>
              print('$ad onAdShowedFullScreenContent.'),
          onAdDismissedFullScreenContent: (RewardedInterstitialAd ad) {
            print('$ad onAdDismissedFullScreenContent.');
            ad.dispose();
            _createRewardedInterstitialAd();
          },
          onAdFailedToShowFullScreenContent:
              (RewardedInterstitialAd ad, AdError error) {
            print('$ad onAdFailedToShowFullScreenContent: $error');
            ad.dispose();
            _createRewardedInterstitialAd();
          },
        );

    _rewardedInterstitialAd!.setImmersiveMode(true);
    _rewardedInterstitialAd!.show(
        onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
          print('$ad with reward $RewardItem(${reward.amount}, ${reward.type})');
        });
    _rewardedInterstitialAd = null;
  }

  AdMob();

  void createAds() async {
    _createInterstitialAd();
    _createRewardedAd();
    _createRewardedInterstitialAd();
  }

  void disposeAds() async {
    _interstitialAd?.dispose();
    _rewardedAd?.dispose();
    _rewardedInterstitialAd?.dispose();
  }

}

class AdProvider extends ChangeNotifier {

  AdProvider();

  late BannerAd bannerAd;
  bool isBannerLoaded = false;
  void initializeBanner() async {//String adId
    String adType = 'banner';
    bannerAd = BannerAd(
      size: AdSize.banner,
      // adUnitId: adId,
      //Banner
      adUnitId: Platform.isAndroid?
      "ca-app-pub-3940256099942544/6300978111"
          : "ca-app-pub-3940256099942544/2934735716",
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad){
          dev.log("$adType ad loaded!");
          isBannerLoaded = true;
        },
        onAdClosed: (ad) {
          dev.log("$adType ad disposed!");
          ad.dispose();
          isBannerLoaded = false;
        },
        onAdFailedToLoad: (ad, err){
          dev.log("$adType ad err!");
          dev.log(err.toString());
          isBannerLoaded = false;
        },
      ),
    );

    await bannerAd.load();
    // notifyListeners();
  }

  late InterstitialAd interstitialAd;
  bool isInterstitialLoaded = false;
  void initializeInterstitial() async { //String adId
    String adType = 'interstitial';
    await InterstitialAd.load(
      // adUnitId: adId,
      //Interstitial
      adUnitId: Platform.isAndroid?
        "ca-app-pub-3940256099942544/1033173712"
          : "ca-app-pub-3940256099942544/4411468910",
      // //Interstitial Video
      // adUnitId: Platform.isAndroid?
      // "ca-app-pub-3940256099942544/8691691433"
      //     : "ca-app-pub-3940256099942544/5135589807",
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          dev.log("$adType ad loaded!");
          isInterstitialLoaded = true;
          interstitialAd = ad;
        },
        // onAdClosed: (ad) {
        //   log("$adType ad disposed!");
        //   ad.dispose();
        //   isInterstitialLoaded = false;
        // },
        onAdFailedToLoad: (err) {
          dev.log("$adType ad err!");
          dev.log(err.toString());
          isInterstitialLoaded = false;
        },
      ),
    );

    // await bannerAd.load();
    // notifyListeners();
  }

  late RewardedAd rewardedAd;
  bool isRewardedLoaded = false;
  void initializeRewarded() async { //String adId
    String adType = 'rewarded';
    await RewardedAd.load(
      // adUnitId: adId,
      //Rewarded
      adUnitId: Platform.isAndroid?
      "ca-app-pub-3940256099942544/5224354917"
          : "ca-app-pub-3940256099942544/1712485313",
      // //Rewarded Interstitial
      // adUnitId: Platform.isAndroid?
      // "ca-app-pub-3940256099942544/5354046379"
      //     : "ca-app-pub-3940256099942544/6978759866",
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          dev.log("$adType ad loaded!");
          isRewardedLoaded = true;
          rewardedAd = ad;
        },
        // onAdClosed: (ad) {
        //   log("$adType ad disposed!");
        //   ad.dispose();
        //   isInterstitialLoaded = false;
        // },
        onAdFailedToLoad: (err) {
          dev.log("$adType ad err!");
          dev.log(err.toString());
          isRewardedLoaded = false;
        },
      ),
    );

    // await rewardedAd.load();
    // notifyListeners();
  }


}

class Constants {
  static bool backSound = true;
  static bool musicSound = true;
  static bool notifySound = true;
}

class MAudio {

  late AudioPlayer audioPlayer;
  late PlayerState playerState;
  late AudioCache audioCache;
  //String path = "sounds/SoundsCrate-Chiptune_Freefall.mp3";
  late String path;

  Future initialize(String filepath, {double volume = 50}) async {

    path = filepath;

    audioPlayer = AudioPlayer();
    playerState = PlayerState.PAUSED;
    audioCache = AudioCache();

    // Volume
    // audioPlayer.setVolume(volume);

    // audioCache = AudioCache(fixedPlayer: audioPlayer);
    audioCache = AudioCache(fixedPlayer: audioPlayer..setReleaseMode(ReleaseMode.STOP));
    audioPlayer.onPlayerStateChanged.listen((state){

      // if(state == PlayerState.STOPPED){
      //   playMusic();
      // }

      //setState(() {
        playerState = state;
      //});

    });

  }

  dispose(){
    try{
      audioPlayer.release();
      audioPlayer.dispose();
      audioCache.clearAll();
    }catch(e){
      print("audio err $e");
    }
  }

  playMusic() async {
    return await audioCache.play(path);
  }

  playLoopMusic() async {
    return await audioCache.loop(path);
  }

  Future<int> pauseMusic() async {
    return await audioPlayer.pause();
  }

  setPlayerState(){
    playerState == PlayerState.PLAYING?
    pauseMusic() : playMusic();
  }


}

class Sound{
  // static const String Button1="soundscrate-graphics-game-blip-2";
  // static const String Button1 = "Most Prefered  soundscrate-click-fx-tonal-18.mp3";
  static const String Button1 = "Most Prefered  soundscrate-click-fx-tonal-18";
  // static const String BackGround = "SoundsCrate-Chiptune_Freefall.mp3";
  static const String BackGround = "Crate-Chiptune_Chip_Off_the_Block_Looping.mp3";
  // static const String GameLoose = "Most Prefered Game Over Sound Effects High Quality 00_00_11-00_00_14.mp3";
  static const String GameLoose = "Game_Over_Sound_Effects.mp3";
  static const String GameWin = "WinSound.mp3";
  // static const String HintClick = "Most Prefered 15 best button click sound effects-3.mp3";
  static const String HintClick = "hint_button_click_sound_effects.mp3";
  // static const String PointsCollect = "Most preferable Bonus Points Sound Effect - 4.mp3";
  static const String PointsCollect = "Bonus_Points_Sound_Effect.mp3";
  static const String PuzzleGame = "Click-Sound-Effect.mp3";
  static const String Reward = "soundscrate-coin-hand-grab-01.mp3";
}

class Sounds {

  static late AudioCache _btnPlayer;
  static late AudioCache _btnBackground;
  static late AudioCache _btnGameLoose;
  static late AudioCache _btnHintClick;
  static late AudioCache _btnPointsCollect;
  static late AudioCache _btnPuzzleGame;
  static late AudioCache _btnReward;

  static initialize() async {
    _btnPlayer = AudioCache();
    _btnBackground = AudioCache();
    _btnGameLoose = AudioCache();
    _btnHintClick = AudioCache();
    _btnPointsCollect = AudioCache();
    _btnPuzzleGame = AudioCache();
    _btnReward = AudioCache();
  }

  static _ButtonClick1() async {
    try{
      await _btnPlayer.play('sounds/${Sound.Button1}.mp3');
    }catch(e){
      print('sound err $e');
    }
  }

  static _ButtonClick() async {
    try{
      // _btnPlayer = AudioCache();
      // // if(_btnPlayer==null){
      // //   _btnPlayer = AudioCache();
      // // }
      // await _btnPlayer.play('sounds/${Sound.Button1}.mp3');
      await AudioCache().play('sounds/${Sound.Button1}.mp3');
    }catch(e){
      print('sound err $e');
    }
  }


  static _play(AudioCache player, String file) async {
    try{
      await _btnPlayer.play('sounds/${file}');
    }catch(e){
      print('sound err $e');
    }
  }

  static _playLoop(AudioCache player, String file) async {
    try{
      await _btnPlayer.play('sounds/${file}');
    }catch(e){
      print('sound err $e');
    }
  }

  static get buttonClick => _ButtonClick();

  static get background => () async {
    await _play(_btnBackground, Sound.BackGround);
  };
  static get gameLooseSound => () async {
    await _play(_btnGameLoose, Sound.GameLoose);
  };
  static get btnHintClick => () async {
    await _play(_btnHintClick, Sound.HintClick);
  };
  static get pointsCollect => () async {
    await _play(_btnPointsCollect, Sound.PointsCollect);
  };
  static get btnPuzzleGame => () async {
    await _play(_btnPuzzleGame, Sound.PuzzleGame);
  };
  static get rewardsCollect => () async {
    await _play(_btnReward, Sound.Reward);
  };

  static get gameLooseRepeatSound => () async {
    await _playLoop(_btnGameLoose, Sound.GameLoose);
  };
  static get pointsCollectRepeat => () async {
    await _playLoop(_btnPointsCollect, Sound.PointsCollect);
  };

  Future<AudioCache?> playSound({required String file, bool isLoop = false}) async {
    try{

      // final filePath = "assets/sounds/$file.mp3";
      final filePath = "sounds/$file.mp3";
      print('playing... $filePath');

      // final player = Player.asset(filePath,
      //     autoPlay: true, once: true);
      //
      // player.play();

      // player.callback((PlayerEvent event){
      //   event.
      // });

      // player.positionStream.listen((event) { });

      // return player;

      // AudioPlayer.logEnabled = true;
      // AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
      // final _data = await rootBundle.load(filePath);
      // Uint8List bytes = _data.buffer.asUint8List(_data.offsetInBytes, _data.lengthInBytes);
      // int result = await audioPlayer.playBytes(bytes);

      // final player = AudioPlayer();
      // var duration = await player.setAsset(filePath);


      final player = AudioCache();
      // player.play(filePath);

      // player.clear(Uri.parse(filePath))
      //     .then((value) {

      if(isLoop){
        player.loop(filePath);
      }else{
        player.play(filePath);
      }

      // });


      // player.fixedPlayer!.release();

      return player;


      // Soundpool soundpool = Soundpool(//.fromOptions(
      //   // options: SoundpoolOptions.kDefault,
      //   streamType: StreamType.notification
      // );
      // int soundId = await rootBundle.load(
      //     //"sounds/dices.m4a"
      //   filePath
      // )
      //     .then((ByteData soundData) {
      //   return soundpool.load(soundData);
      // });
      // int streamId = await soundpool.play(soundId);

    }catch(e){
      print('play sound err -> ${e}');

      return null;
    }
  }
}

class methods {

  static launch({required String link}) async {
    //www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw
    // if (Platform.isIOS) {
    //   if (await canLaunch('youtube://$link')) {
    //     await launchURL('youtube://$link');
    //   } else {
    //     if (await canLaunch('$link')) {
    //       await launch('$link');
    //     } else {
    //       throw 'Could not launch $link';
    //     }
    //   }
    // } else {
    //   const url = '$link';
    //   if (await canLaunch(url)) {
    //     await launch(url);
    //   } else {
    //     throw 'Could not launch $url';
    //   }
    // }

    // if (!await launchUrl(link)) throw 'Could not launch $link';
    // if (!await launchURL(link: link)) print('Could not launch $link');



  }

  static String prettyPrint(Map json) {
    JsonEncoder encoder = JsonEncoder.withIndent('  ');
    String pretty = encoder.convert(json);
    return pretty;
  }

  /*loadAnimation(){
    Lottie.asset(
        'assets/lottieJSON/animal_crossing.json',
        width: 200,
        height: 200,
        fit: BoxFit.cover
    );
  }*/

  // static Future<PlayerController?> playSound({required String file}) async {
  static Future<AudioCache?> playSound({required String file, bool isLoop = false}) async {
    try{

      // final filePath = "assets/sounds/$file.mp3";
      final filePath = "sounds/$file.mp3";
      print('playing... $filePath');

      // final player = Player.asset(filePath,
      //     autoPlay: true, once: true);
      //
      // player.play();

      // player.callback((PlayerEvent event){
      //   event.
      // });

      // player.positionStream.listen((event) { });

      // return player;

      // AudioPlayer.logEnabled = true;
      // AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
      // final _data = await rootBundle.load(filePath);
      // Uint8List bytes = _data.buffer.asUint8List(_data.offsetInBytes, _data.lengthInBytes);
      // int result = await audioPlayer.playBytes(bytes);

      // final player = AudioPlayer();
      // var duration = await player.setAsset(filePath);


      final player = AudioCache();
      // player.play(filePath);

      // player.clear(Uri.parse(filePath))
      //     .then((value) {

            if(isLoop){
              player.loop(filePath);
            }else{
              player.play(filePath);
            }

      // });


      // player.fixedPlayer!.release();

      return player;


      // Soundpool soundpool = Soundpool(//.fromOptions(
      //   // options: SoundpoolOptions.kDefault,
      //   streamType: StreamType.notification
      // );
      // int soundId = await rootBundle.load(
      //     //"sounds/dices.m4a"
      //   filePath
      // )
      //     .then((ByteData soundData) {
      //   return soundpool.load(soundData);
      // });
      // int streamId = await soundpool.play(soundId);

    }catch(e){
      print('play sound err -> ${e}');

      return null;
    }
  }


  static Future<Map<String, dynamic>?> loadPuzzle(name) async {
    Map<String, dynamic>? json;
    print('reading puzzle $name.....');
    try{
      String data = await rootBundle.loadString('assets/puzzles/${name}.txt');

      print('puzzle $data');

      json = jsonDecode(data);


    }catch(e){
      print('puzzle err $e');
      json = null;
    }
    return json;
  }

  static showToast(BuildContext context, {required String msg}){
    FlutterToastr.show(msg, context,
        duration: FlutterToastr.lengthShort,
        position:  FlutterToastr.bottom
    );
  }

  static showSnack({String text=""}){
    SnackBar(
      content: Text(text),
      behavior: SnackBarBehavior.floating,
      padding: EdgeInsets.all(20),
    );
  }

}

class Database {

  static CollectionReference pathData(String path) {
    final instance =  FirebaseFirestore.instance;
    CollectionReference ref = instance.collection("game_app").doc("codeword").collection(path);
    return ref;
  }

  static storeData(String path) {
    final instance =  FirebaseFirestore.instance;
    CollectionReference ref = instance.collection("game_app").doc("codeword").collection(path);
    return ref;
  }

  // static Future<DocumentSnapshot?> topPlayer () async {
  static DocumentSnapshot? topPlayer () {
    // QuerySnapshot qs = await Database.pathData("users").orderBy("history.total_points", descending: true).get();

    // if(qs.docs.isNotEmpty){
    //   return qs.docs.first;
    // }
    // return null;

    Database.pathData("users").orderBy("history.total_points", descending: true)
        .get().then((value) {
      QuerySnapshot qs = value;
      if(qs.docs.isNotEmpty){
        return qs.docs.first;
      }
    });
    return null;

  }

  static Stream topPlayerStream () {
    return Database.pathData("users").orderBy("history.total_points", descending: true).snapshots();
  }

  static Query topPlayers () {
    return Database.pathData("users").orderBy("history.total_points", descending: true);
  }

  static void setPuzzleToInitial (String uid,{String mode = "easy"}) {
    final ref = Database.pathData("users").doc(uid);
    // final ref = instance.collection("game_app").doc("admin");

    ref.update({"level.$mode": 1});
  }
  static void setPuzzleTo (String uid,{String mode = "easy", int puzzle=1}) {
    final ref = Database.pathData("users").doc(uid);
    ref.update({"level.$mode": puzzle});
  }

}

class App {

  static late ValueNotifier<DocumentSnapshot?> userdata = ValueNotifier(null);

  Future<Map<String, dynamic>?> getDeviceInfo() async {

    Map<String, dynamic>? device;

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if(kIsWeb){
      WebBrowserInfo info = await deviceInfo.webBrowserInfo;
      if(info!=null){
        device = {
          'display': info.appName,
          'device': "Web Browser",
          'name': info.browserName,
          'model': info.product,
          'serial': "Na",
          'os': info.platform,
        };
        print('device >>> ${device}');
      }
      else{
        print('device >>> web {}');
      }
    }else{
      if(Platform.isAndroid){
        AndroidDeviceInfo info = await deviceInfo.androidInfo;
        if(info!=null){
          device = {
            'display': info.display,
            'device': "Android",
            'name': '${info.manufacturer}',// ${info.brand}
            'model': info.model,//info.product
            'serial': info.androidId,
            //'os': info.version.baseOS,
            'os': info.version.release,
          };
          print('device >>> ${device}');
        }
        else{
          print('device >>> android {}');
        }

      }
      else if(Platform.isIOS){
        IosDeviceInfo info = await deviceInfo.iosInfo;
        if(info!=null){
          device = {
            'display': info.name,
            'device': "Ios",
            'name': info.utsname.sysname,
            'model': info.model,
            'serial': info.utsname.machine,
            'os': info.utsname.version,
          };
          print('device >>> ${device}');
        }
        else{
          print('device >>> ios {}');
        }

      }
      else if(Platform.isWindows){
        WindowsDeviceInfo info = await deviceInfo.windowsInfo;
        if(info!=null){
          device = {
            'display': "Na",
            'device': "Windows",
            'name': info.computerName,
            'model': "Na",
            'serial': "Na",
            'os': "Na",
          };
          print('device >>> ${device}');
        }
        else{
          print('device >>> windows {}');
        }

      }
    }

    //
    // Add this plugin to your pubspec device_info
    //
    // Human-readable way is
    //
    // if (Platform.isAndroid) {
    // var androidInfo = await DeviceInfoPlugin().androidInfo;
    // var release = androidInfo.version.release;
    // var sdkInt = androidInfo.version.sdkInt;
    // var manufacturer = androidInfo.manufacturer;
    // var model = androidInfo.model;
    // print('Android $release (SDK $sdkInt), $manufacturer $model');
    // // Android 9 (SDK 28), Xiaomi Redmi Note 7
    // }
    //
    // if (Platform.isIOS) {
    // var iosInfo = await DeviceInfoPlugin().iosInfo;
    // var systemName = iosInfo.systemName;
    // var version = iosInfo.systemVersion;
    // var name = iosInfo.name;
    // var model = iosInfo.model;
    // print('$systemName $version, $name $model');
    // // iOS 13.1, iPhone 11 Pro Max iPhone
    // }


    // print('Running on ${androidInfo.model}');

    // IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    // print('Running on ${iosInfo.utsname.machine}');
    //
    // WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
    // print('Running on ${webBrowserInfo.userAgent}');

    // final map = androidInfo.toMap();



    // return androidInfo;
    return device!;
  }

}

class Login {

  static mapUserData(String uid, Map<String, dynamic> credentials,
      {bool email=false, bool google=false, bool facebook=false, bool twitter=false, bool guest=false,}){
    return {
      'daily_challange': 0,
      'email': credentials["email"],
      'history': {
        'total_points': 0,
        'total_hint': 0,
        'total_play': 0,
        'total_time': '00:00:00',
        'hint_time': '00:00',
        'updated': DateTime.now(),
      },
      'id': uid,
      'level': {
        'easy': 1,
        'medium': 1,
        'hard': 1,
        'impossible': 1,
      },
      // 'login_mode': credentials["mode"],
      'login_mode': email?"Email"
          : facebook?"Facebook"
          : twitter?"Twitter"
          : google?"Google"
          : guest?"Guest" : "",
      // 'name': credentials["name"],
      'name': credentials["name"] ?? credentials["email"].toString().split('@')[0],
      'searchBy': credentials["name"]!=null? credentials["name"].toString().substring(0,1).toLowerCase(): credentials["email"].toString().split('@')[0].substring(0,1).toLowerCase(),
      // 'password': credentials["password"],
      'password': null,
      'pic': credentials["pic"],
      'playerId': uid,
      'serial': credentials["serial"],
      // 'points': 0,
      'points': {
        'easy': 0,
        'medium': 0,
        'hard': 0,
        'impossible': 0,
      },
      'rank': 0,
      'status': "offline",
      'username': null,
      'sound': true,
      'music': true,
      'notification': true,
      'timer': true,
      'ts': DateTime.now(),
    };
  }

  static updateWinData() async {
    try{
      final instance = FirebaseFirestore.instance;
      //DocumentSnapshot ref = await instance.collection("game_app").doc("admin").get();
      // return ref;

      final ref = instance.collection("game_app").doc("admin");

      DocumentSnapshot ds = await ref.get();
      int winings = ds["wins"] + 1;

      ref.update({"wins": winings});
    }catch(e){
      print("err -> $e");
    }
  }

  static Future<DocumentSnapshot> getUser(String uid) async {
    // // try{
    //   return await Database.pathData("users").doc(uid).get();
    // // }catch(e){
    // //   print("err -> $e");
    // // }

     DocumentSnapshot<Object?> user = await Database.pathData("users").doc(uid).get();

      try{
        final service = FlutterBackgroundService();
        bool serviceRunning = await service.isRunning();
        // print('serviceRunning auth $serviceRunning');
        if(service!=null && serviceRunning){
          Map<String, dynamic> data = {
            // 'user': user,
            'user': user.id,
          };
          appAuth.updateWith(service, data);
        }
      }catch(e){
        print('service updating problem...');
      }

      return user;

  }
  // static Stream getUserStream(String uid) {
  //   Database.pathData("users").doc(uid).snapshots().listen((event) {
  //     return event;
  //   });
  // }

  static Future<DocumentSnapshot?> signInWithEmail(BuildContext context, Map<String, dynamic> credentials) async {//String email, String password //Future<String>
    try{

      // final cred = {
      //    'email': "",
      //    'name': "",
      //  };

      UserCredential result =
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: credentials["email"], password: credentials["password"]
      );
      // .then((value) async {//
      //
      //   // print('response ${value.user!.uid}');
      //
      //   // User fireUser = result.user!;
      //   User fireUser = value.user!;
      //
      //   // print('emailVerified ${fireUser.emailVerified}');
      //
      //   // Map<String, dynamic> udata = mapUserData(fireUser.uid, credentials);
      //   // await Database.pathData("users").doc(fireUser.uid).set(udata);
      //
      //   // if(fireUser.emailVerified){
      //   //   // return _userFromFirebase(firebaseUser);
      //   // }else{
      //   //   print(">>>  Email not verified");
      //   //   // return null;
      //   // }
      //
      //   print('response ${fireUser.uid}');
      //
      //   //return fireUser.uid;
      //
      //   final uid = fireUser.uid;
      //   // return uid;
      //
      //   DocumentSnapshot user = await Login.getUser(uid);
      //   print('response ${user["name"]}');
      //   return user!;
      //
      // });

      User fireUser = result.user!;
      // print('response ${fireUser.uid}');
      // final uid = fireUser.uid;
      // DocumentSnapshot user = await Login.getUser(uid);
      // print('response ${uid}');
      // print('response ${user["name"]}');
      // return user;

      // Future.delayed(const Duration(seconds: 1),() async {
        final uid = fireUser.uid;
        DocumentSnapshot user = await Login.getUser(uid);
        print('response ${uid}');
        print('response ${user["name"]}');
        return user;

      // });

      // DocumentSnapshot user = await Login.getUser(fireUser.uid);
      // print('response ${user["name"]}');
      // return user;

      //}catch(e){
      //print(e.toString());
    } on FirebaseAuthException catch (e) {
      // print('autenticate err ${e.toString()}');
      print('email signin err... $e');
      print('message ${e.message}');
      print('message ${e.code}');

      // switch(e.code){
      //   case "user-not-found":
      //     print("User not Found!");
      //     break;
      //   case "wrong-password":
      //     print("Enter Correct Password!");
      //     break;
      // }

      late String errMsg ="";
      switch(e.code){
        case "user-not-found":
          print("User not Found!");
          errMsg = "User not Found!";
          break;
        case "email-already-in-use":
          print("Email already used!");
          errMsg = "Email already used!";
          break;
        case "wrong-password":
          print("Enter Correct Password!");
          errMsg = "Enter Correct Password!";
          break;
        case "network-request-failed":
          print("Please connect to internet!");
          errMsg = "Please connect to internet!";
          break;
        case "weak-password":
          print("Enter Strong Password with minimum 6 characters!");
          errMsg = "Enter Strong Password with minimum 6 characters!";
          break;
      }

      Dialogs.dialogAlert(context, errMsg, "Sign In Error!");


      return null;
      // return "err";
    }
  }
  static Future<DocumentSnapshot?> signUpWithEmail(BuildContext context, Map<String, dynamic> credentials) async {
    //String email, String password // Future<String?>
    try{

      QuerySnapshot qs = await Database.pathData("users").where("serial", isEqualTo: credentials["serial"]).get();
      // if(qs.docs.isNotEmpty && (qs!.docs.first)["login_mode"]!="Guest"){
      if(qs.docs.isNotEmpty && (qs.docs.first)["login_mode"]!="Guest"){
        // print('Account Exists\nPlease login with ${(qs!.docs.first)["login_mode"]} Account!\nAccount - ${(qs!.docs.first)["email"]}');
        print('Account Exists\nPlease login with ${(qs.docs.first)["login_mode"]} Account!\nAccount - ${(qs.docs.first)["email"]}');
        Dialogs.dialogAlert(context
            // , "Please login with ${(qs!.docs.first)["login_mode"]} Account!\nAccount - ${(qs!.docs.first)["email"]}"
            , "Please login with ${(qs.docs.first)["login_mode"]} Account!\nAccount - ${(qs.docs.first)["email"]}"
            , "Account  Already Exists");
        return null;
      }

     // final cred = {
     //    'email': "",
     //    'name': "",
     //    'password': "",
     //  };

      // UserCredential result =
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: credentials["email"], password: credentials["password"]
      )
      .then((value) async {
        // User fireUser = result.user!;
        User fireUser = value.user!;

        // print('emailVerified ${fireUser.emailVerified}');

        // Map<String, dynamic> udata = mapUserData(fireUser.uid, credentials, email: true);
        // await Database.pathData("users").doc(fireUser.uid).set(udata);

        String status="exists";
        DocumentSnapshot usr = await Database.pathData("users").doc(fireUser.uid).get();
        if(!usr.exists){
          print('user creating...');
          final data = {
            'pic': fireUser.photoURL,
            'email': fireUser.email,
            'name': fireUser.displayName,
            'serial': credentials["serial"],
          };

          Map<String, dynamic> udata = mapUserData(fireUser.uid, data, email: true);
          await Database.pathData("users").doc(fireUser.uid).set(udata);

          status="created";
        }

        // if(!usr.exists){
        //   if(usr["serial"]==credentials["serial"]){
        //     print('Account Exists\nPlease login with ${usr["login_mode"]} Account!');
        //   }
        //   return null;
        // }


        // if(fireUser.emailVerified){
        //   // return _userFromFirebase(firebaseUser);
        // }else{
        //   print(">>>  Email not verified");
        //   // return null;
        // }

        //return fireUser.uid;

        DocumentSnapshot user = await Login.getUser(fireUser.uid);
        print('response ${user["name"]}');
        return user;
        //String status="exists";
        // return {
        //   'status': status,
        //   'data': user,
        // };

      });

      // User fireUser = result.user!;
      // // print('response ${fireUser.uid}');
      // final uid = fireUser.uid;
      // DocumentSnapshot user = await Login.getUser(uid);
      // print('response ${user["name"]}');
      // return user;


    //}catch(e){
    } on FirebaseAuthException catch (e) {
      // print('autenticate err ${e.toString()}');
      // methods.showToast(context, msg: msg)
      print('email signup err... $e');
      print('message ${e.message}');
      print('message ${e.code}');

      late String errMsg ="";
      switch(e.code){
        case "user-not-found":
          print("User not Found!");
          errMsg = "User not Found!";
          break;
        case "email-already-in-use":
          print("Email already used!");
          errMsg = "Email already used!";
          break;
        case "network-request-failed":
          print("Please connect to internet!");
          errMsg = "Please connect to internet!";
          break;
        case "weak-password":
          print("Enter Strong Password with minimum 6 characters!");
          errMsg = "Enter Strong Password with minimum 6 characters!";
          break;
      }

      Dialogs.dialogAlert(context, errMsg, "Sign Up Error!");

      return null;
    }
  }
  static Future signOutEmail() async {
    final user = FirebaseAuth.instance.currentUser;
    if(user!=null){
      await FirebaseAuth.instance.signOut();
    }
  }

  static Future forgetPassword(BuildContext context, String email) async {
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(
          email: email
      ).onError((error, stackTrace) {
        print('password reset err $error');
      });
      // .then((value){
      //   // print('value... $value');
      //   print('email sent');
      //   Dialogs.dialogAlert(context, "Reset password sent to $email", "Password Reset");
      // });
      print('email sent');
      Dialogs.dialogAlert(context, "Reset password sent to $email", "Password Reset");

    }on FirebaseAuthException catch(e){
      print('password reset err... $e');
      print('message ${e.message}');
      print('message ${e.code}');

      late String errMsg ="";
      switch(e.code){
        case "user-not-found":
          print("User not Found!");
          errMsg = "User not Found!";
          break;
        case "network-request-failed":
          print("Please connect to internet!");
          errMsg = "Please connect to internet!";
          break;
      }

      Dialogs.dialogAlert(context, errMsg, "Sign Up Error!");
      // return null;
    }
  }


  static setPlayData(String uid, {required Map<String, dynamic> data}) async {
    try {
      final user = await Database.pathData("users").doc(uid);

      DocumentSnapshot usr = await user.get();

      // final datas = {
      //   'points': 0,
      //   'rank': 0,
      //
      //   'hints': 0,
      //   'played': 0,
      //   'time': 0,
      //
      //   'easy': 2,
      //   'medium': null,
      //   'hard': null,
      //   'impossible': null,
      // };

      List utime = (usr['history']['total_time'] as String).split(":");
      List ctime = (data['time'] as String).split(":");
      // int tSec = int.parse(utime[utime.length-1])+int.parse(utime[ctime.length-1]);
      // int tMin = int.parse(utime[utime.length-2])+int.parse(utime[ctime.length-2]);
      // int tHr = int.parse(utime[utime.length-3])+int.parse(utime[ctime.length-3]);

      int tSec = 0;
      int tMin = 0;
      int tHr = 0;

      if (ctime.length == 3) {
        tSec = int.parse(utime[utime.length - 1]) +
            int.parse(ctime[ctime.length - 1]);
        tMin = int.parse(utime[utime.length - 2]) +
            int.parse(ctime[ctime.length - 2]);
        tHr = int.parse(utime[utime.length - 3]) +
            int.parse(ctime[ctime.length - 3]);
      }
      if (ctime.length == 2) {
        tSec = int.parse(utime[utime.length - 1]) +
            int.parse(ctime[ctime.length - 1]);
        tMin = int.parse(utime[utime.length - 2]) +
            int.parse(ctime[ctime.length - 2]);
        // int.parse(utime[utime.length-3])+int.parse(utime[ctime.length-3]);
      } else {
        print('invalid time string');
      }


      if (tSec >= 60) {
        tSec = tSec - 60;
        tMin += 1;
      }
      if (tMin >= 60) {
        tMin = tMin - 60;
        tHr += 1;
      }

      String tTime = '${tHr
          .toString()
          .length == 1 ? '0${tHr}' : tHr}:${tMin
          .toString()
          .length == 1 ? '0${tMin}' : tMin}:${tSec
          .toString()
          .length == 1 ? '0${tSec}' : tSec}';

      print('tTime $tTime');
      print('tSec $tSec tMin $tMin tHr $tHr');
      print('ctime.length ${ctime.length}');
      print('cTime $ctime');
      print('uTime $utime');

      final hintAr1 = (usr['history']['hint_time'] as String).split(":");
      final hintAr2 = data['hint-time'].toString().split(":");
      int h1 = int.parse(hintAr1[0]) + int.parse(hintAr2[0]);
      int h2 = int.parse(hintAr1[1]) + int.parse(hintAr2[1]);
      String hTime = '${h1
          .toString()
          .length == 1 ? '0$h1' : h1}:${h2
          .toString()
          .length == 1 ? '0$h2' : h2}';

      print('hTime $hTime');

      final udata = {
        // 'points': data["points"]==null?(usr['points'] as int):(usr['points'] as int) + data['points'],
        // 'points.easy': data['points.easy']!=null ? (usr['points.easy'] as int) + data['points.easy'] : (usr['points.easy'] as int),
        // 'points.medium': data['points.medium']!=null ? (usr['points.medium'] as int) + data['points.medium'] : (usr['points.medium'] as int),
        // 'points.hard': data['points.hard']!=null ? (usr['points.hard'] as int) + data['points.hard'] : (usr['points.hard'] as int),
        // 'points.impossible': data['points.impossible']!=null ? (usr['points.impossible'] as int) + data['points.impossible'] : (usr['points.impossible'] as int),

        'points.easy': data['points']['easy'] != null
            ? (usr['points.easy'] as int) + data['points']['easy']
            : (usr['points.easy'] as int),
        'points.medium': data['points']['medium'] != null
            ? (usr['points.medium'] as int) + data['points']['medium']
            : (usr['points.medium'] as int),
        'points.hard': data['points']['hard'] != null
            ? (usr['points.hard'] as int) + data['points']['hard']
            : (usr['points.hard'] as int),
        'points.impossible': data['points']['impossible'] != null
            ? (usr['points.impossible'] as int) + data['points']['impossible']
            : (usr['points.impossible'] as int),

        // 'easy': widget.mode=="Easy"? ((data["point"] as int) + (widget.user['points.easy'] as int)) : widget.user['points.easy'],
        // 'medium': widget.mode=="Medium"? ((data["point"] as int) + (widget.user['points.medium'] as int)) : widget.user['points.medium'],
        // 'hard': widget.mode=="Hard"? ((data["point"] as int) + (widget.user['points.hard'] as int)) : widget.user['points.hard'],
        // 'impossible': widget.mode=="Impossible"? ((data["point"] as int) + (widget.user['points.impossible'] as int)) : widget.user['points.impossible'],

        'rank': data["rank"],

        'history.hint_time': data['hint-time'] == null
            ? (usr['history']['hint_time'] as String)
            : hTime,
        'history.total_hint': data['hints'] == null
            ? (usr['history']['total_hint'] as int)
            : (usr['history']['total_hint'] as int) + data['hints'],
        'history.total_play': data['played'] == null
            ? (usr['history']['total_play'] as int)
            : (usr['history']['total_play'] as int) + data['played'],
        // 'history.total_time': data['time']==null?(usr['history']['total_time'] as int):(usr['history']['total_time'] as int) + data['time'],


        'history.total_time': data['time'] == null
            ? (usr['history']['total_time'] as String)
            : tTime,

        // 'level.easy': data['easy']==null?(usr['easy'] as int):(usr['easy'] as int) + data['easy'],
        // 'level.medium': data['medium']==null?(usr['medium'] as int):(usr['medium'] as int) + data['medium'],
        // 'level.hard': data['hard']==null?(usr['hard'] as int):(usr['hard'] as int) + data['hard'],
        // 'level.impossible': data['impossible']==null?(usr['impossible'] as int):(usr['impossible'] as int) + data['impossible'],

        // 'level.easy': data['easy']==null?(usr['easy'] as int):data['easy'],
        // 'level.medium': data['medium']==null?(usr['medium'] as int):data['medium'],
        // 'level.hard': data['hard']==null?(usr['hard'] as int):data['hard'],
        // 'level.impossible': data['impossible']==null?(usr['impossible'] as int):data['impossible'],

        'level.easy': data['easy'] ?? (usr['level']['easy'] as int),
        'level.medium': data['medium'] ?? (usr['level']['medium'] as int),
        'level.hard': data['hard'] ?? (usr['level']['hard'] as int),
        'level.impossible': data['impossible'] ??
            (usr['level']['impossible'] as int),

      };

      user.update(udata);

    }catch(e){
      print("err -> $e");
    }
  }

  // user stream ??
  
  static getUsers(String uid, {String mode="Easy"}) async {

    List data = [];

    try {
      QuerySnapshot qs = await Database.pathData("users")
          .orderBy("points", descending: true)
      //.where("")
          .get();

      if (qs.docs.length > 0) {
        qs.docs //.map((e) {
            .forEach((element) {
          //DocumentSnapshot ds = e;
          DocumentSnapshot ds = element;
          // print('ds ${ds.id}');
          if (data.length < 11) { //10
            Map<String, dynamic> value = {
              // 'pic': ds["pic"],
              'img': ds["pic"],
              'name': ds["name"],
              'points': ds["points"],
              //'user': false, // true
              'user': uid == ds.id ? true : false,
              'medal': "", // Gold, Silver, Bronze
            };
            data.add(value);
          }
        });

        // return data;
      }
      else {
        // return data;
      }

      // print('qs.docs.length ${qs.docs.length}');
      // print('data ${data}');

    }catch(e){
      print("err -> $e");
    }

    return data;

  }

  static getUsersWithFilter(String uid, {String mode="Easy"}) async {

    List data = [];
    bool userAdded = false;

    try {
      QuerySnapshot qs = await Database.pathData("users")
          // .orderBy("points", descending: true)
          // .orderBy("points.medium", descending: true)
          .orderBy("points.${mode.toLowerCase()}", descending: true)
          // .where("points.medium", i)
          .get();

      if(qs.docs.length>0){

        //qs.docs//.map((e) {
        //    .forEach((element) {
        for(var element in qs.docs) {
          // for(int i=0; i<qs.docs.length; i++) {
          //DocumentSnapshot ds = e;
          // DocumentSnapshot element = qs.docs[i];
          DocumentSnapshot ds = element;
          // DocumentSnapshot ds = qs.docs[i];
          // print('ds ${ds.id}');
          if (data.length < 10) { //10 //11
            Map<String, dynamic> value = {
              // 'pic': ds["pic"],
              'img': ds["pic"],
              'name': ds["name"],
              'email': ds["email"],
              'points': ds["points"],
              //'user': false, // true
              'user': uid == ds.id ? true : false,
              'medal': "", // Gold, Silver, Bronze
            };
            data.add(value);
            uid == ds.id ? userAdded = true : userAdded = false;
          }
          else {
            // return;
            // break;
            if(!userAdded && uid == ds.id){
              Map<String, dynamic> value = {
                // 'pic': ds["pic"],
                'img': ds["pic"],
                'name': ds["name"],
                'email': ds["email"],
                'points': ds["points"],
                //'user': false, // true
                'user': uid == ds.id ? true : false,
                'medal': "", // Gold, Silver, Bronze
              };
              data.add(value);
              uid == ds.id ? userAdded = true : userAdded = false;
              break;
            }

          }
        }
        //});


        // return data;
      } else {
        // return data;
      }

      // print('qs.docs.length ${qs.docs.length}');
      // print('data ${data}');

      // return data;


    }catch(e){
      print('leaderboard err $e');
    }

    return data;

  }

  static Future<List<Map<String, dynamic>>> getUsersRank(String uid) async {

    List<Map<String, dynamic>> data = [];
    bool userAdded = false;

    try {
      QuerySnapshot qs = await Database.pathData("users")
          // .orderBy("points.${mode.toLowerCase()}", descending: true)
          .orderBy("history.total_points", descending: true)
          .get();

      if(qs.docs.length>0){
        for(var element in qs.docs) {
          DocumentSnapshot ds = element;
          if (data.length < 10) {
            Map<String, dynamic> value = {
              'img': ds["pic"],
              'name': ds["name"],
              'email': ds["email"],
              'points': ds["points"],
              'history': ds["history"],
              'user': uid == ds.id ? true : false,
              'medal': "", // Gold, Silver, Bronze
            };
            data.add(value);
            uid == ds.id ? userAdded = true : userAdded = false;
          }
          else {
            if(!userAdded && uid == ds.id){
              Map<String, dynamic> value = {
                // 'pic': ds["pic"],
                'img': ds["pic"],
                'name': ds["name"],
                'email': ds["email"],
                'points': ds["points"],
                'history': ds["history"],
                'user': uid == ds.id ? true : false,
                'medal': "", // Gold, Silver, Bronze
              };
              data.add(value);
              uid == ds.id ? userAdded = true : userAdded = false;
              break;
            }

          }
        }

      } else {
        // return data;
      }

    }catch(e){
      print('leaderboard err $e');
    }

    return data;

  }


  // static signInWithFacebook() async {
  //   final FacebookLogin fb_login = FacebookLogin();
  //
  //   //login dialog based on webView
  //   fb_login.loginBehavior = FacebookLoginBehavior.webViewOnly;
  //
  //   final result = await fb_login.logIn(['email']);
  //
  //   switch(result.status){
  //     case FacebookLoginStatus.loggedIn:
  //       print('fb login successful!');
  //       print('result.accessToken ${result.accessToken}');
  //       break;
  //     case FacebookLoginStatus.cancelledByUser:
  //       print('fb login cancelled!');
  //       break;
  //     case FacebookLoginStatus.error:
  //       print('fb login err!');
  //       break;
  //   }
  //
  //   /*
  //   //name, first_name, last_name, email, access_token
  //   //{
  //   //  "name": "Iiro Krankka",
  //   //  "first_name": "Iiro",
  //   //  "last_name": "Krankka",
  //   //  "email": "iiro.krankka\u0040gmail.com",
  //   //  "id": "<user id here>"
  //   //}
  //
  //   final token = result.accessToken.token;
  //   final graphResponse = await http.get(
  //           'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${token}');
  //   final profile = JSON.decode(graphResponse.body);
  //   */
  //
  // }

  static signInWithFacebook2()async{
    try{

      final LoginResult result
        = await FacebookAuth.i.login(
          permissions: [
            'email',
            'public_profile'
          ]
        );

      print('result $result');
      print('fb status ${result.status}');
      print('fb message ${result.message}');

      if(result.status == LoginStatus.success){
        print('fb login successful!');

        // final uid = result.accessToken!.userId;
        final token = result.accessToken!.token;
        // print('Token is 1 ' + token);

        // final profile = await FacebookAuth.i.getUserData(
        //     //fields: "email, name, picture"
        // );
        // print('profile $profile');

        // var graphResponse = await http.get(Uri.parse('https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture.height(200)&access_token=${token}'));
        var graphResponse = await http.get(Uri.parse(
            'https://graph.facebook.com/v13.0/me?fields=name,first_name,last_name,email,picture.height(200)&access_token=${token}'));
        var profile = json.decode(graphResponse.body);
        print('profile $profile');

        try{

          // print('result.accessToken!.isExpired ${result.accessToken!.isExpired}');
          //
          // final AuthCredential authCredential
          //   = FacebookAuthProvider.credential(token);
          //
          // final user = await FirebaseAuth.instance
          //     .signInWithCredential(authCredential);
          //
          // print('user $user');

          final fbToken = token;
          // final fbToken = result.accessToken!.token;
          //final fbToken = result.accessToken!.token.toString();
          // final fbToken = FacebookAuthProvider.getCredential(
          //   accessToken: result.accessToken!.token,
          // );

          // FacebookAuth.instance.accessToken
          // final fbToken = (await FacebookAuth.i.accessToken)!.token;
          // final fbToken = graphResponse;
          print('Token is 2 ' + fbToken);

          final FirebaseAuth _auth = FirebaseAuth.instance;
          // final OAuthCredential credential =  FacebookAuthProvider.credential(fbToken);
          //final AuthCredential credential =  FacebookAuthProvider.credential(fbToken);

          // final AuthCredential credential =  FacebookAuthProvider.credential(fbToken);
          final FacebookAuthCredential credential =  FacebookAuthProvider.credential(fbToken) as FacebookAuthCredential;
          // final AuthCredential credential =  FacebookAuthProvider()..credential(fbToken);

          // late FacebookAuthProvider provider = FacebookAuthProvider();
          // provider.addScope('email');
          // provider.addScope('public_profile');
          // provider.addScope('user_birthday');
          // final AuthCredential credential = provider.setCustomParameters({
          //   '':,
          // });

          // const AuthCredential credential = AuthCredential(
          //   providerId: 'facebook.com',
          //   signInMethod: 'facebook.com',
          // );
          // final AuthCredential credential = AuthCredential(
          //     providerId: FacebookAuthProvider.PROVIDER_ID,
          //     signInMethod: FacebookAuthProvider.FACEBOOK_SIGN_IN_METHOD,
          //     // token: 104626858923887,
          // );

          // FacebookAuthCredential facebookAuthCredential = FacebookAuthCredential();
          // final OAuthCredential credential =  ;

          print('fb credential $credential');

          final User user = (await _auth.signInWithCredential(credential)).user!;
          assert(!user.isAnonymous);
          assert(await user.getIdToken() != null);
          final _token = await user.getIdToken();
          final _userId = user.uid;
          print('Profile is ' + profile.toString());

        } on FirebaseAuthException catch (e){

          // methods.showSnack(text: e.toString());

          // switch(e.code){
          //   case "account-exists-with-different-credential":
          //     break;
          // }

          print('fire fb login err msg ${e.message}');
          print('fire fb login err ${e.toString()}');

          methods.showSnack(text: e.code);
          methods.showSnack(text: e.toString());
        }

      }else{
        print('fb login failed!');
      }

    }catch(e){
      methods.showSnack(text: e.toString());
    }
  }
  static signInWithFacebook1()async{
    try{
      final LoginResult result = await FacebookAuth.instance
          .login(permissions: [
            'public_profile',
             'email'])
          // .timeout(const Duration(seconds: 30))
      ;

      print('result $result');

      print('fb status ${result.status}');
      print('fb message ${result.message}');

      if(result.status == LoginStatus.success){
        print('fb login successful!');

        final uid = result.accessToken!.userId;
        final token = result.accessToken!.token;

        // print('uid $uid');
        // print('token -> ${result.accessToken!.token}');

        // result.accessToken.grantedPermissions;

        // final uri = 'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${token}';
        // final graphResponse = await http.get(Uri.parse(uri));
        //
        // final profile = jsonDecode(graphResponse.body);

        final profile = await FacebookAuth.i.getUserData(
          fields: "email, name, picture"
        );

        print('profile $profile');

        try{

          print('result.accessToken!.isExpired ${result.accessToken!.isExpired}');
          // final OAuthCredential authCredential =
          // final AuthCredential authCredential =
            // FacebookAuthProvider.credential(result.accessToken!.token);
          final AuthCredential authCredential =
            FacebookAuthProvider.credential(token);

          // FacebookAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(accessToken)

          // final user = await FirebaseAuth.instance.signInWithCredential(authCredential);
          final user = await FirebaseAuth.instance..signInWithCredential(authCredential);

          /*
          // final AuthCredential authCredential = FacebookAuthProvider.credential(token);
          // final AuthCredential authCredential = FacebookAuthProvider.credential(result.accessToken!.token);
          // final user = await FirebaseAuth.instance.signInWithCredential(authCredential);

          // await FacebookAuth.i.accessToken
          await FacebookAuth.instance.login()
              //.accessToken.timeout(Duration(seconds: 30))
              .then((value) async {
            if(value!=null) {
              //token = value.token;
              // final AuthCredential authCredential = FacebookAuthProvider.credential(token);
              // final AuthCredential authCredential = FacebookAuthProvider.credential(value.token);
              final AuthCredential authCredential = FacebookAuthProvider.credential(value.accessToken!.token);
              final user = await FirebaseAuth.instance.signInWithCredential(authCredential);

              print('fire fb user $user');

              final fireUser = FirebaseAuth.instance.currentUser;
              if(fireUser!=null){
                String uid = fireUser.uid;

                final credentials = {
                  'email': fireUser.email,
                  'name': fireUser.displayName,
                };

                Map<String, dynamic> udata = mapUserData(fireUser.uid, credentials, facebook: true);
                await Database.pathData("users").doc(fireUser.uid).set(udata);

                DocumentSnapshot user = await Login.getUser(fireUser.uid);
                print('response ${user["name"]}');
                return user;

              }else{
                print('fire user null');
                return null;
              }


            }
            else{
              print("fb access token null!");
            }
          });
          */

        }
        // catch(e){
        on FirebaseAuthException catch (e){

          // methods.showSnack(text: e.toString());

          // switch(e.code){
          //   case "account-exists-with-different-credential":
          //     break;
          // }

          print('fire fb login err msg ${e.message}');
          print('fire fb login err ${e.toString()}');

          methods.showSnack(text: e.code);
          methods.showSnack(text: e.toString());
        }
      }else{
        print('fb login failed!');
      }

    }catch(e){
      methods.showSnack(text: e.toString());
    }
  }
  static signInWithFacebook3(BuildContext context, Map<String, dynamic> data)async {
    try{

      QuerySnapshot qs = await Database.pathData("users").where("serial", isEqualTo: data["serial"]).get();
      // if(qs.docs.isNotEmpty && (qs!.docs.first)["login_mode"]!="Guest"){
      if(qs.docs.isNotEmpty && (qs.docs.first)["login_mode"]!="Guest"){
        // print('Account Exists\nPlease login with ${(qs!.docs.first)["login_mode"]} Account!');
        print('Account Exists\nPlease login with ${(qs.docs.first)["login_mode"]} Account!');
        Dialogs.dialogAlert(context
            // , "Please login with ${(qs!.docs.first)["login_mode"]} Account!\nAccount - ${(qs!.docs.first)["email"]}"
            , "Please login with ${(qs.docs.first)["login_mode"]} Account!\nAccount - ${(qs.docs.first)["email"]}"
            , "Account  Already Exists");
        return null;
      }

      final LoginResult result = await FacebookAuth.instance.login();
      if(result.status == LoginStatus.success){
        // Create a credential from the access token
        final OAuthCredential credential = FacebookAuthProvider.credential(result.accessToken!.token);
        print('fb credential \n$credential');
        // Once signed in, return the UserCredential
        //return await FirebaseAuth.instance.signInWithCredential(credential);
        // final user =
        await FirebaseAuth.instance.signInWithCredential(credential);

        final fireUser = FirebaseAuth.instance.currentUser;
        if(fireUser!=null){
          String uid = fireUser.uid;

          // final credentials = {
          //   'email': fireUser.email,
          //   'name': fireUser.displayName,
          //
          //   'serial': data["serial"],
          // };
          //
          // Map<String, dynamic> udata = mapUserData(fireUser.uid, credentials, google: true);
          // await Database.pathData("users").doc(fireUser.uid).set(udata);

          String status="exists";
          DocumentSnapshot usr = await Database.pathData("users").doc(fireUser.uid).get();
          if(!usr.exists){
            print('user creating...');
            final credentials = {
              'pic': fireUser.photoURL,
              'email': fireUser.email,
              'name': fireUser.displayName,
              'serial': data["serial"],
            };

            Map<String, dynamic> udata = mapUserData(fireUser.uid, credentials, google: true);
            await Database.pathData("users").doc(fireUser.uid).set(udata);

            status="created";
          }

          // if(!usr.exists){
          //   if(usr["serial"]==data["serial"]){
          //     print('Account Exists\nPlease login with ${usr["login_mode"]} Account!');
          //   }
          //   return null;
          // }

          DocumentSnapshot user = await Login.getUser(fireUser.uid);
          print('response ${user["name"]}');
          return user;
          //String status="exists";
          // return {
          //   'status': status,
          //   'data': user,
          // };
        }
        else{
          print('fb fire user null');
          return null;
        }

      }
    } on FirebaseAuthException catch(e){
      print('fb auth err \n${e.credential} \n${e.message}');
    }
    return null;
  }
  static signInWithFacebook(BuildContext context, Map<String, dynamic> data)async {
    try{

      // QuerySnapshot qs = await Database.pathData("users").where("serial", isEqualTo: data["serial"]).get();
      // if(qs.docs.isNotEmpty && (qs!.docs.first)["login_mode"]!="Guest"){
      //   print('Account Exists\nPlease login with ${(qs!.docs.first)["login_mode"]} Account!');
      //   Dialogs.dialogAlert(context
      //       , "Please login with ${(qs!.docs.first)["login_mode"]} Account!\nAccount - ${(qs!.docs.first)["email"]}"
      //       , "Account  Already Exists");
      //   return null;
      // }

      //final LoginResult result = await FacebookAuth.instance.login();
      final LoginResult result = await FacebookAuth.instance
          .login(permissions: ['public_profile', 'email']);
      //.login(permissions: ['email', 'public_profile', 'user_birthday']);

      if(result.status == LoginStatus.success){

        // final uri = 'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${token}';
        // final graphResponse = await http.get(Uri.parse(uri));
        //
        // final profile = jsonDecode(graphResponse.body);

        final profile = await FacebookAuth.i.getUserData(
            fields: "email, name, picture"
        );

        print('fb-profile $profile');
        // print('fb-image ${profile["picture"]["data"]["url"]}');

        // Create a credential from the access token
        final OAuthCredential credential = FacebookAuthProvider.credential(result.accessToken!.token);
        print('fb credential \n$credential');
        // Once signed in, return the UserCredential
        //return await FirebaseAuth.instance.signInWithCredential(credential);
        // final user =
        await FirebaseAuth.instance.signInWithCredential(credential);

        final fireUser = FirebaseAuth.instance.currentUser;

        print("fireUser $fireUser");

        if(fireUser!=null){
          String uid = fireUser.uid;

          // final credentials = {
          //   'email': fireUser.email,
          //   'name': fireUser.displayName,
          //
          //   'serial': data["serial"],
          // };
          //
          // Map<String, dynamic> udata = mapUserData(fireUser.uid, credentials, google: true);
          // await Database.pathData("users").doc(fireUser.uid).set(udata);

          String status="exists";
          DocumentSnapshot usr = await Database.pathData("users").doc(fireUser.uid).get();
          if(!usr.exists){
            print('user creating...');
            final credentials = {
              // 'pic': fireUser.photoURL,
              // 'email': fireUser.email,
              // 'name': fireUser.displayName,
              'pic': profile["picture"]["data"]["url"],
              'email': profile["email"],
              'name': profile["name"],
              'serial': data["serial"],
            };

            Map<String, dynamic> udata = mapUserData(fireUser.uid, credentials, facebook: true);
            await Database.pathData("users").doc(fireUser.uid).set(udata);

            status="created";
          }

          // if(!usr.exists){
          //   if(usr["serial"]==data["serial"]){
          //     print('Account Exists\nPlease login with ${usr["login_mode"]} Account!');
          //   }
          //   return null;
          // }

          DocumentSnapshot user = await Login.getUser(fireUser.uid);
          print('response ${user["name"]}');
          return user;
          //String status="exists";
          // return {
          //   'status': status,
          //   'data': user,
          // };
        }
        else{
          print('fb fire user null');
          return null;
        }


        /*
        if(fireUser!=null){
          String uid = fireUser.uid;

          String status="exists";
          DocumentSnapshot usr = await Database.pathData("users").doc(fireUser.uid).get();
          if(!usr.exists){
            print('user creating...');
            final credentials = {
              'pic': fireUser.photoURL,
              'email': fireUser.email,
              'name': fireUser.displayName,
              'serial': data["serial"],
            };

            Map<String, dynamic> udata = mapUserData(fireUser.uid, credentials, google: true);
            await Database.pathData("users").doc(fireUser.uid).set(udata);

            status="created";
          }

          // if(!usr.exists){
          //   if(usr["serial"]==data["serial"]){
          //     print('Account Exists\nPlease login with ${usr["login_mode"]} Account!');
          //   }
          //   return null;
          // }

          DocumentSnapshot user = await Database.getUser(fireUser.uid);
          print('response ${user["name"]}');
          return user;
          //String status="exists";
          // return {
          //   'status': status,
          //   'data': user,
          // };
        }
        else{
          print('fb fire user null');
          return null;
        }
        */

      }
    } on FirebaseAuthException catch(e){
      print('fb auth err \n${e.credential} \n${e.message}');
    }
    return null;
  }
  static Future signOutFacebook() async {
    try{
      final fbUser = await FacebookAuth.instance.getUserData();
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FacebookAuth.instance.logOut();
        await FirebaseAuth.instance.signOut();
      }
    }catch(e){
      print("err -> $e");
    }
  }

  static Future signInWithGoogle(BuildContext context, Map<String, dynamic> data)async{
    try{
      // QuerySnapshot qs = await Database.pathData("users").where("serial", isEqualTo: data["serial"]).get();
      // if(qs.docs.isNotEmpty && (qs!.docs.first)["login_mode"]!="Guest"){
      //   print('Account Exists\nPlease login with ${(qs!.docs.first)["login_mode"]} Account!');
      //   Dialogs.dialogAlert(context
      //       , "Please login with ${(qs!.docs.first)["login_mode"]} Account!\nAccount - ${(qs!.docs.first)["email"]}"
      //       , "Account  Already Exists");
      //   return null;
      // }
      //DocumentSnapshot usr1 = qs.first;
      // if(!usr1.exists){
      //   if(usr1["serial"]==data["serial"]){
      //     print('Account Exists\nPlease login with ${usr1["login_mode"]} Account!');
      //     return null;
      //   }
      // }

      GoogleSignIn signIn = GoogleSignIn(scopes: ['email']);
      GoogleSignInAccount? user = signIn.currentUser;
      if (user == null) {
        user = await signIn.signIn();
        final auth = await user!.authentication;
        final credential = GoogleAuthProvider.credential(
            accessToken: auth.accessToken, idToken: auth.idToken);
        await FirebaseAuth.instance.signInWithCredential(credential);

        final fireUser = FirebaseAuth.instance.currentUser;
        if (fireUser != null) {
          print('google user $fireUser');
          String uid = fireUser.uid;

          String status = "exists";
          DocumentSnapshot usr =
              await Database.pathData("users").doc(fireUser.uid).get();
          if (!usr.exists) {
            print('user creating...');
            final credentials = {
              'pic': fireUser.photoURL,
              'email': fireUser.email,
              'name': fireUser.displayName,
              'serial': data["serial"],
            };

            Map<String, dynamic> udata =
                mapUserData(fireUser.uid, credentials, google: true);
            await Database.pathData("users").doc(fireUser.uid).set(udata);

            status = "created";
          }

          // if(!usr.exists){
          //   if(usr["serial"]==data["serial"]){
          //     print('Account Exists\nPlease login with ${usr["login_mode"]} Account!');
          //   }
          //   return null;
          // }

          DocumentSnapshot user = await Login.getUser(fireUser.uid);
          print('response ${user["name"]}');
          return user;
          //String status="exists";
          // return {
          //   'status': status,
          //   'data': user,
          // };

        } else {
          print('fire user null');
          return null;
        }
      } else {
        final fireUser = FirebaseAuth.instance.currentUser;
        if (fireUser != null) {
          DocumentSnapshot user = await Login.getUser(fireUser.uid);
          // DocumentSnapshot user = await Login.getUser(user.id);
          print('response ${user["name"]}');
          return user;
        } else {
          return null;
        }
      }
    }catch(e){
      print("err -> $e");
    }
  }
  static Future signOutGoogle()async{
    try{
      GoogleSignIn signIn = GoogleSignIn(scopes: ['email']);
      // GoogleSignIn signIn = GoogleSignIn();
      GoogleSignInAccount? user = signIn.currentUser;
      if (user != null) {
        await signIn.signOut();
        await FirebaseAuth.instance.signOut();
      } else { //running
        signIn.disconnect();
        await FirebaseAuth.instance.signOut();
      }
      // else{
      //   // print('google user null');
      //   // final usr = await signIn.signInSilently();
      //   // if(user!=null){
      //   //   // usr.signOut();
      //   //   await FirebaseAuth.instance.signOut();
      //   // }
      // }
      // await FirebaseAuth.instance.signOut();
    }catch(e){
      print("err -> $e");
    }
  }

  static Future<GoogleSignInAccount?> getAuthUser()async{
    try{
      GoogleSignIn signIn = GoogleSignIn(scopes: ['email']);
      GoogleSignInAccount? user = signIn.currentUser;
      if (user != null) {
        return user;
      }
    }catch(e){
     print("err -> $e");
    }
    return null;
  }

  static Future<DocumentSnapshot?> signUpWithGuest(Map<String, dynamic> credentials) async {
    try {

      QuerySnapshot qs = await Database.pathData("users").where("serial", isEqualTo: credentials["serial"]).get();
      // if(qs.docs.isNotEmpty && (qs!.docs.first)["login_mode"]!="Guest"){
      if(qs.docs.isNotEmpty && (qs.docs.first)["login_mode"]!="Guest"){
        // print('Account Exists\nPlease login with ${(qs!.docs.first)["login_mode"]} Account!');
        print('Account Exists\nPlease login with ${(qs.docs.first)["login_mode"]} Account!');
        // Dialogs.dialogAlert(context
        //     , "Please login with ${(qs!.docs.first)["login_mode"]} Account!\nAccount - ${(qs!.docs.first)["email"]}"
        //     , "Account  Already Exists");
        // return null;
        // return (qs!.docs.first);
        return (qs.docs.first);
      }

      print('guest creating...');

      DocumentSnapshot usr = await Database.pathData("users").doc('gu_${credentials["serial"]}').get();
      if(!usr.exists){
        final data = {
          'pic': null,
          'email': null,
          'name': 'gu_${credentials["serial"]}',
          'serial': credentials["serial"],
        };

        Map<String, dynamic> udata = mapUserData(data["name"], data, guest: true);
        await Database.pathData("users").doc(data["name"]).set(udata);
      }

      DocumentSnapshot user = await Login.getUser('gu_${credentials["serial"]}');
      print('response ${user["name"]}');
      return user;

    } on FirebaseAuthException catch (e) {
      print('autenticate err ${e.toString()}');
      // methods.showToast(context, msg: msg)
      return null;
    }
  }
  static Future<DocumentSnapshot?> getGuest(Map<String, dynamic> credentials) async {
    try{
      print('guest getting...');
      // final data = {
      //   'pic': null,
      //   'email': null,
      //   'name': 'gu_${credentials["serial"]}',
      //   'serial': credentials["serial"],
      // };
      //
      // Map<String, dynamic> udata = mapUserData(data["name"], data, guest: true);
      // await Database.pathData("users").doc(data["name"]).set(udata);

      // DocumentSnapshot user = await Login.getUser(data["name"]);
      DocumentSnapshot user = await Login.getUser('gu_${credentials["serial"]}');
      print('response ${user["name"]}');
      return user;

    } on FirebaseAuthException catch (e) {
      print('autenticate err ${e.toString()}');
      // methods.showToast(context, msg: msg)
      return null;
    }
  }


  static Future<DocumentSnapshot?> updateMusic(String uid, bool yes, {bool isMusic=false, bool isSound=false, bool isNotification=false, bool isTimer=false,}) async {
    try{
      final usr = await Database.pathData("users").doc(uid);
      late Map<String, dynamic> data;

      if (isMusic) {
        data = {
          'music': yes,
        };
        usr.update(data);
      } else if (isSound) {
        data = {
          'sound': yes,
        };
        usr.update(data);
      } else if (isNotification) {
        data = {
          'notification': yes,
        };
        usr.update(data);
      } else if (isTimer) {
        data = {
          'timer': yes,
        };
        usr.update(data);
      }

      return await getUser(uid);

    }catch(e){
      print("err -> $e");
    }

    return null;
    // usr.update(data);
  }
  static Future updateReward(String uid, int points, String mode) async {
    final usr = await Database.pathData("users").doc(uid);

    DocumentSnapshot user = await usr.get();

    late Map<String, dynamic> data;
    switch(mode){
      case "easy":
        int pnt = (user["points.easy"] as int);
        data = {
          'points.easy': pnt + points,
        };
        usr.update(data);
        break;
      case "medium":
        int pnt = (user["points.medium"] as int);
        data = {
          'points.medium': pnt + points,
        };
        usr.update(data);
        break;
      case "hard":
        int pnt = (user["points.hard"] as int);
        data = {
          'points.hard': pnt + points,
        };
        usr.update(data);
        break;
      case "impossible":
        int pnt = (user["points.impossible"] as int);
        data = {
          'points.impossible': pnt + points,
        };
        usr.update(data);
        break;
    }

    // return null;
    // usr.update(data);
  }

  static Future updateTotalPoints(String uid, int points) async {
    try{
      final usr = await Database.pathData("users").doc(uid);

      DocumentSnapshot user = await usr.get();

      int pnt = (user["history.total_points"] as int);
      final data = {
        'history.total_points': pnt + points,
        'history.updated': DateTime.now(),
      };
      usr.update(data);
    }catch(e){
      print("err -> $e");
    }
  }

  static Future updateDailyChallenge(String uid) async {
    try{
      final usr = Database.pathData("users").doc(uid);

      DocumentSnapshot user = await usr.get();

      int pnt = (user["daily_challange"] as int);

      // if (pnt < 3) {
      if (pnt < 2) {
        final data = {
          'daily_challange': pnt + 1,
        };
        usr.update(data);
      }
    }catch(e){
      print("err -> $e");
    }
  }

  static Future resetDailyChallenge(String uid) async {
    try{
      final usr = Database.pathData("users").doc(uid);

      // DocumentSnapshot user = await usr.get();

      // int pnt = (user["daily_challange"] as int);

      // if(pnt<3){
      final data = {
        'daily_challange': 0,
      };
      usr.update(data);
      // }
    }catch(e){
      print("err -> $e");
    }

  }

}



class NotificationService {

  static runService() async {
    try{
      final service = FlutterBackgroundService();
      if(await service.isRunning()){
        print("ending old service...");
        service.invoke("stop");
        print("initializing service...");
        await Service().initializeService();
      }else{
        print("initializing service...");
        await Service().initializeService();
      }
    }catch(e){
      print("err while service initializing\n\n${e}");
    }
  }
  static endService() async {
    try{
      final service = FlutterBackgroundService();
      if(await service.isRunning()){
        print("ending old service...");
        service.invoke("stop");
        // print("initializing service...");
        // await Service().initializeService();
      }else{
        print("service already ended...");
        // print("initializing service...");
        // await Service().initializeService();
      }
    }catch(e){
      print("err while service initializing\n\n${e}");
    }
  }

}



class Service {
  Service();

  Future<void> initializeService() async {
    //DocumentSnapshot user
    final service = FlutterBackgroundService();
    await service.configure(
      androidConfiguration: AndroidConfiguration(
        // onStart: (instance) async => onStart(instance, user),
        onStart: onStart,
        autoStart: true,
        isForegroundMode: true,
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

      //on update
      service.on('update').listen((event) {
        print(event!);
        if(service is AndroidServiceInstance) {
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
        DocumentSnapshot? user;
        Map<String, dynamic>? device;

        App().getDeviceInfo().then(
                (value) {
                  device = value;
            }
        );

        final credential = {
          'serial': device==null?null:device!["serial"]!,
        };
        print('user serial key ${credential["serial"]}');

        user ??= await Login.getUser('gu_${credential["serial"]}');

        FirebaseAuth.instance.authStateChanges().listen((event) async {
          if(event!=null){
            // event.uid;
            // user = await Login.getUser('gu_${credentials["serial"]}');
            user = await Login.getUser(event.uid);
          }
        });

        // Timer.periodic(const Duration(hours: 1), (timer) {
        Timer.periodic(const Duration(seconds: 5), (timer) {
           final cTime = DateTime.now();

           String msg = "";
           String title = "";
           String payload = "";

           title = "We’re blasting off 🚀";
           msg = "Complete your daily challenge and get 2x points for next 2 hour.";

           NotificationApi.showNotification_11(
             // id: id,
             id: 0,
             title: title,
             body: msg,
             payload: payload,
           );

        });

        //**********************

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
      dev.log(e.toString());
    }

  }

  updateWith(FlutterBackgroundService instance, Map<String, dynamic> data){
    instance.invoke(
        'update',
        data
    );

    print('updating service');
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
}

class NotificationApi {
  static final _notifications = FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String>();
  static const int idNotify = 0;

  static late DocumentSnapshot user;

  static Future init(BuildContext context,{bool initSchedule = false}) async {
    //final android = AndroidInitializationSettings('@mipmap/ic_launcher');
    var android = const AndroidInitializationSettings(
        '@mipmap/ic_launcher'
    );
    const ios = IOSInitializationSettings(
      //requestSoundPermission: false,
      //requestBadgePermission: false,
      //requestAlertPermission: false,
      //onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );
    final settings = InitializationSettings(
        android: android,
        iOS: ios
    );

    /// when app is closed
    final details = await _notifications.getNotificationAppLaunchDetails();
    if(details!=null && details.didNotificationLaunchApp){
      onNotifications.add(details.payload!);
    }

    await _notifications.initialize(
      settings,
      onSelectNotification: (payload) async {
        onNotifications.add(payload!);
        onClickNotification(context,payload: payload);
      },
      //onSelectNotification: onDidReceiveLocalNotification();
    );

    // if(initSchedule){
    //   tz.initializeTimeZones();
    //   // final locationName = await FlutterNativeTimezone.getLocalTimezone();
    //   // tz.setLocalLocation(tz.getLocation(locationName));
    // }


    // final String currentTimeZone = await FlutterNativeTimezone.getLocalTimezone();
    //tz.initializeTimeZones();
    // tz.setLocalLocation(tz.getLocation(timeZoneName));
    // tz.setLocalLocation(tz.getLocation(currentTimeZone));


    listNotifications(context);

  }

  static listNotifications(BuildContext context) =>
      // BuildContext context,{String payload}
  onNotifications.stream.listen(
    onClickNotification(context),
    //onClickNotification(context, payload: payload)
  );

  static onClickNotification(BuildContext context,{String? payload}) {
    if(payload != null){
      // DocumentSnapshot user = {} as DocumentSnapshot;

      if( payload == "daily_challenge"){

        //random puzzle
        Random random = Random(3);
        // const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
        const _chars = '1234567890';
        final String res = List.generate(3, (index) => _chars[random.nextInt(_chars.length)]).join();

        final String level = res;//""
        const String mode = "Hard";//Easy, Medium, Hard

        Navigator.of(context).push(
            MaterialPageRoute(
              // builder: (context)=> SecondPage(payload: payload ?? "",),
              // builder: (context)=> Screen4(level: level, mode: mode, user: user, isDailyChallenge: true, mAudio: null,),
              builder: (context)=> Screen4(level: level, mode: mode, user: user, isDailyChallenge: true),
            )
        );

      }else if (payload == "1st-rank"){
        Navigator.of(context).push(
            MaterialPageRoute(
              // builder: (context)=> AuthScreen(),
              builder: (context)=> const Screen1(),
            )
        );
      }

    }

  }

  //----------------------------------
  static Future showNotification_11({
    String? title,
    String? body,
    String? payload,
    int id = 0,
  }) async =>
      _notifications.show(
        id,
        title,
        body,
        await _notificationDetails_21(
            id_notify: id
        ),
        payload: payload,
      );

  static Future _notificationDetails_21({int id_notify = 0}) async {

    const appName = "CodeWord Challenge";
    const channel = 'codeword_notification';
    return NotificationDetails(
      android: AndroidNotificationDetails(
        '${id_notify}', appName,
        channelDescription: channel,
        playSound: true,
        // sound: const RawResourceAndroidNotificationSound(
        //     'message_with_intro'
        // ),
        enableVibration: true,
        importance: Importance.max,
        styleInformation: const DefaultStyleInformation(true,true),
        // styleInformation: const BigTextStyleInformation(
        //     //bigText,
        //     '',
        //     htmlFormatBigText: true,
        //     htmlFormatContentTitle: true,
        // ),
      ),
      iOS: const IOSNotificationDetails(
        presentSound: false,
        //sound: sound,
      ),
    );
  }


}
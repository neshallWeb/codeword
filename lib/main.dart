// import 'package:f2f_puzzlegame/view/codeword_one.dart';
// import 'package:f2f_puzzlegame/view/screen_1.dart';
// import 'package:f2f_puzzlegame/view/screen_2.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import '../view/codeword_one.dart';
import '../view/screen_1.dart';
import '../view/screen_2.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'model/constants.dart';
// import 'package:kplayer/kplayer.dart';
// import 'package:kplayer/kplayer.dart';

//flutter build apk --target-platform android-arm,android-arm64
//build\app\outputs\flutter-apk\app-release.apk

//flutter build ios

//https://lottiefiles.com/104397-illusions-in-motion-design


//fb login
//https://www.youtube.com/watch?v=byno-DpeQKw
//https://www.youtube.com/watch?v=PweQbVgR9iI
//https://www.youtube.com/watch?v=o7ZziyFRsSo
//https://www.youtube.com/watch?v=_MWveopf4jw
//https://pub.dev/packages/flutter_facebook_login
//https://www.youtube.com/watch?v=_MWveopf4jw

//https://firebase.google.com/docs/auth/admin/errors


//google signin
//https://pub.dev/packages/google_sign_in
//https://firebase.google.com/docs/ios/setup

//admob
//https://www.youtube.com/watch?v=QTrWKWjUA30

//https://developers.google.com/admob/android/test-ads#sample_ad_units
//https://developers.google.com/admob/ios/test-ads#demo_ad_units

//https://developers.google.com/admob/flutter/quick-start?hl=en
//https://developers.google.com/admob/flutter/rewarded


//responsive ui
//https://www.youtube.com/watch?v=0mp-Ok00WZE


//SHA-1
//android/gradlew => open with terminal
//gradlew signingreport


/*
Variant: debug
Config: debug
Store: C:\Users\Suvarna Innovations\.android\debug.keystore
Alias: AndroidDebugKey
MD5: 2F:83:7B:12:3D:B2:86:5E:7F:79:F5:84:FD:D6:8A:3F
SHA1: 7E:97:53:27:26:27:C3:A7:BA:39:83:D6:C6:8A:31:B9:C1:33:FD:9E
SHA-256: 42:BE:5A:BC:69:8F:3D:D0:89:88:16:DA:EA:92:8D:17:BE:80:71:B6:2E:7B:31:6E:14:7A:F
7:83:3D:69:1A:0C
Valid until: Thursday, 4 January, 2052

----------
Variant: release
Config: debug
Store: C:\Users\Suvarna Innovations\.android\debug.keystore
Alias: AndroidDebugKey
MD5: 2F:83:7B:12:3D:B2:86:5E:7F:79:F5:84:FD:D6:8A:3F
SHA1: 7E:97:53:27:26:27:C3:A7:BA:39:83:D6:C6:8A:31:B9:C1:33:FD:9E
SHA-256: 42:BE:5A:BC:69:8F:3D:D0:89:88:16:DA:EA:92:8D:17:BE:80:71:B6:2E:7B:31:6E:14:7A:F
7:83:3D:69:1A:0C
Valid until: Thursday, 4 January, 2052
----------


Alias: AndroidDebugKey
MD5: 2F:83:7B:12:3D:B2:86:5E:7F:79:F5:84:FD:D6:8A:3F
SHA1: 7E:97:53:27:26:27:C3:A7:BA:39:83:D6:C6:8A:31:B9:C1:33:FD:9E
SHA-256: 42:BE:5A:BC:69:8F:3D:D0:89:88:16:DA:EA:92:8D:17:BE:80:71:B6:2E:7B:31:6E:14:7A:F
7:83:3D:69:1A:0C
Valid until: Thursday, 4 January, 2052
*/
//https://tomeko.net/online_tools/hex_to_base64.php
//Output (base64):
//fpdTJyYnw6e6OYPWxooxucEz/Z4=

/*
https://unicode-table.com/en/1F947/
https://unicode-table.com/en/1F680/

https://emojipedia.org/rocket/
https://emojipedia.org/clapping-hands-medium-skin-tone/

https://appicon.co/
*/

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  // Firebase.initializeApp();

  await MobileAds.instance.initialize();

  //status bar & navigation bar transparent
  SystemChrome.setEnabledSystemUIOverlays([]);

  Sounds.initialize();

  // SystemChrome.setEnabledSystemUIOverlays([
  //   // SystemUiOverlay.bottom
  //
  // ]);

  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //     // statusBarColor: Colors.white,
  //     // systemNavigationBarColor: Colors.white,
  //
  //     // statusBarColor: Color(0xffDAD9E4),
  //     // systemNavigationBarColor: Color(0xffDAD9E4),
  //
  //     statusBarIconBrightness: Brightness.dark,
  //     systemNavigationBarIconBrightness: Brightness.dark,
  //
  //     statusBarBrightness: Brightness.dark,
  //     systemStatusBarContrastEnforced: false,
  //     systemNavigationBarDividerColor: Colors.transparent,
  //     systemNavigationBarContrastEnforced: true,
  //
  //     statusBarColor: Colors.transparent,
  //     systemNavigationBarColor: Colors.transparent,
  //   ),
  // );

  // SystemChrome.setSystemUIOverlayStyle(
  //     SystemUiOverlayStyle(
  //       // systemNavigationBarColor: Color(0xFF000000),
  //       systemNavigationBarColor: Colors.transparent,
  //       systemNavigationBarIconBrightness: Brightness.light,
  //       statusBarIconBrightness: Brightness.dark,
  //       statusBarBrightness: Brightness.light,
  //     )
  // );

  // Player.boot();

  // runApp(const MyApp());
  runApp(const RunCode());

  // //crashlytics check
  // // throw const FormatException("error");
  // FirebaseCrashlytics.instance.crash();
  // //SystemNavigator.pop();
  // // exit(0);
  // // throw(Exception('Hello Crashlytics'));
  // // return;

}

class RunCode extends StatelessWidget {
  const RunCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return const MaterialApp(
      title: 'CodeWord Challenge',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      debugShowCheckedModeBanner: false,

      home: Screen1(),
      // home: Screen2(),

      // home: CodeWordOne(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

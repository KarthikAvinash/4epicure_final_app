// import 'package:flutter/material.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';

// void main() {
//   WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
//   FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       debugShowCheckedModeBanner: false,
//       home: const MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {

//   @override
//   void initState() {
//     super.initState();

//     /// whenever your initialization is completed, remove the splash screen:
//     Future.delayed(Duration(seconds: 5)).then((value) => {
//       FlutterNativeSplash.remove()
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Splash Screen"),
//         backgroundColor: Colors.red,
//       ),
//       body: const Center(
//         child: Text("Created by Devesh on April 13, '23", style: TextStyle(fontSize: 24,),),
//       ),
//     );
//   }
// }

import 'screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:chatgpt_course/auth_screens/signIn.dart';
import 'package:chatgpt_course/auth_screens/signUp.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // add a delay to simulate a longer loading time
    Future.delayed(const Duration(seconds: 2), () {
      // navigate to ShakeToNavigate() after the splash screen has finished
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => SignupScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // remove the system overlay for the status bar
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/splash_screen_background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: const Center(
        child: Image(
          image: AssetImage("assets/images/splash_screen_logo.png"),
        ),
      ),
    );
  }
}

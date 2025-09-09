import 'package:flutter/material.dart';
import 'package:mind/account/Login.dart';
import 'package:mind/detailpage/detailepageabc.dart';
import 'package:mind/detailpage/ordernow.dart';
import 'package:mind/intro.dart';
import 'package:mind/pages/home.dart';
import 'package:mind/pages/homescreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mind/splash/splashscreen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp()); 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:
      SplashScreen()
       //HomePag()
      //Login(), 
    );
  }
}

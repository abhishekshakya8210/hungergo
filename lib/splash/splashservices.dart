import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mind/account/Login.dart';
import 'package:mind/pages/home.dart';

class Splashservices {
  final auth = FirebaseAuth.instance;

  void isLogin(BuildContext context) {
    final user = auth.currentUser;

    if (user != null) {
     
      Timer(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePag(), 
          ),
        );
      });
    } else {
   
      Timer(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Login(), )
        );
      });
    }
  }
}

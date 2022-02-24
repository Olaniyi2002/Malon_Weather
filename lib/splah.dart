
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:reallife/Home/home.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return Home();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        body: Center(
            child: Container(
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.deepPurpleAccent)]),
                padding: EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("lib/images/logo.png",scale: 2.2,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Flutter Weather",style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 30
                      ),),
                    )
                  ],
                ))));
  }
}
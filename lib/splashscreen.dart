import 'dart:async';

import 'package:flutter/material.dart';
import 'package:herbal_application/pages/homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

hexColor(String colorhercode) {
  // ignore: prefer_interpolation_to_compose_strings
  String colornew = '0xff' + colorhercode;
  colornew = colornew.replaceAll('#', '');
  int colorint = int.parse(colornew);
  return colorint;
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3,), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //         begin: Alignment.topRight,
        //         end: Alignment.bottomRight,
        //         colors: [
        //       Color(hexColor('#A5f0c5')),
        //       Color(hexColor('#00917c')),
        //     ])
        //     ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Column(
            children: [
              Container(
                  height: 250,
                  width: 250,
                  // decoration: BoxDecoration(
                  //     color: Color.fromARGB(255, 255, 255, 255),
                  //     borderRadius: BorderRadius.circular(40)),
                  child: Image.asset(
                    'assets/UI/logo.png',
                    // color: Color.fromARGB(255, 242, 248, 246),
                    height: 300,
                    width: 300,
                  )),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const[
                    Text(
                      'Herbal ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 35,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Segoe UI'),
                    ),
                     Text(
                      'App',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Segoe UI'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const CircularProgressIndicator(color: Colors.green,)
        ]),
      ),
    );
  }
}

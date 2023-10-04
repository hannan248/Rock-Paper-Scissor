import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rock_paper_scissor/Screens/home_page.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (ctx) =>const HomePage()),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {


    return  const Scaffold(
     body: Center(
       child: Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Text('Rock',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 30),),
           SizedBox(width: 8,),
           Text('Paper',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 30),),
           SizedBox(width: 8,),
           Text('Scissor',style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 30),),

         ],
       ),
     ),
   );
  }
}
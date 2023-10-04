import 'package:flutter/material.dart';
import 'package:rock_paper_scissor/Screens/splash_screen.dart';
void main() {
  runApp(const RPS());
}
class RPS extends StatelessWidget{
  const RPS({super.key});

  @override
  Widget build(BuildContext context) {
    return(   MaterialApp(

      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),),
      home:const SplashScreen(),
    ));
  }

}
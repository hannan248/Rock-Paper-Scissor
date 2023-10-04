import 'dart:math';
import 'package:flutter/material.dart';
import 'package:rock_paper_scissor/widgets/image_add.dart';
import 'package:rock_paper_scissor/widgets/show_choose.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> list = ['rock', 'paper', 'scissor'];

//to generate random pic from list
  String random() {
    var random = Random().nextInt(list.length);
    String randomChoice = list[random];
    String cpuChoice = 'images/$randomChoice.png';
    return cpuChoice;
  }

  final String rock = 'images/rock.png';
  final String paper = 'images/paper.png';
  final String scissor = 'images/scissor.png';
  String yourChoice = 'images/all.png';
  int yourScore = 0;
  int cpuScore = 0;
  Widget? youWon;
  Widget? cpuWon;
  Widget? draw;

  @override
  Widget build(BuildContext context) {
    //condition for who won the round
    String cpu = random();
    Widget whoWon() {
      if (yourChoice == rock && cpu == paper ||
          yourChoice == paper && cpu == scissor ||
          yourChoice == scissor && cpu == rock) {
        return cpuWon = const Text(
          'cpu won',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red),
          textAlign: TextAlign.center,
        );
      } else if (cpu == rock && yourChoice == paper ||
          cpu == paper && yourChoice == scissor ||
          cpu == scissor && yourChoice == rock) {
        return youWon = const Text(
          'you won',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.green),
          textAlign: TextAlign.center,
        );
      } else {
        return draw = const Text(
          'Draw',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          textAlign: TextAlign.center,
        );
      }
    }

//to increase score
    if (whoWon() == youWon) {
      yourScore++;
    }
    if (whoWon() == cpuWon) {
      cpuScore++;
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Rock Paper Scissor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            //widget to show which choose which one
            Choose(
              yourChoose: yourChoice,
              cpuChoose: cpu,
            ),
            const SizedBox(
              height: 30,
            ),
            //widget to show who won
            whoWon(),
            const SizedBox(
              height: 60,
            ),
            //Row to show option and adding inkwell for tapping and setting new value and activate random function
            Row(
              children: [
                InkWell(
                  child: ImageAdd(
                    image: AssetImage(rock),
                  ),
                  onTap: () {
                    setState(() {
                      yourChoice = rock;
                      random();
                      whoWon();
                    });
                  },
                ),
                const Spacer(),
                InkWell(
                  child: ImageAdd(
                    image: AssetImage(paper),
                  ),
                  onTap: () {
                    setState(() {
                      yourChoice = paper;
                      random();
                      whoWon();
                    });
                  },
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    setState(() {
                      yourChoice = scissor;
                      random();
                      whoWon();
                    });
                  },
                  child: ImageAdd(
                    image: AssetImage(scissor),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'CHOOSE YOUR OPTION',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 60,
            ),
            Row(
              children: [
                Text(
                  'YOUR SCORE:$yourScore',
                  style: const TextStyle(
                      backgroundColor: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  'CPU SCORE: $cpuScore',
                  style: const TextStyle(
                      backgroundColor: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 13),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    yourScore = 0;
                    cpuScore = 0;
                    yourChoice = 'images/all.png';
                  });
                },
                child: const Text('Reset Score'))
          ],
        ),
      ),
    );
  }
}

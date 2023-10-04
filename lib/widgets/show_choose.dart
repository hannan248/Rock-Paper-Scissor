import 'package:flutter/material.dart';
import 'package:rock_paper_scissor/widgets/image_add.dart';

class Choose extends StatelessWidget{
  const Choose({super.key,required this.yourChoose,required this.cpuChoose});
  final String yourChoose;
  final String cpuChoose;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      alignment: Alignment.center,
      color: Colors.orange,
      child:   Row(
        children: [
          //column widget to show a text and  ImageAdd(for user)widget which we made
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('YOU CHOOSE'),
              const SizedBox(
                height: 6,
              ),
              ImageAdd(
                image: AssetImage(yourChoose),
              ),
            ],
          ),
         const Spacer(),
          //column widget to show a text and  ImageAdd(for CPU)widget which we made
          Column( mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('CPU CHOOSE'),
              const SizedBox(
                height: 6,
              ),
              ImageAdd(
                image: AssetImage(cpuChoose),
              ),
            ],
          ),
        ],
      ),
    );
  }

}
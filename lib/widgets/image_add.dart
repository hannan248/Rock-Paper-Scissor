import 'package:flutter/material.dart';

class ImageAdd extends StatelessWidget {
  const ImageAdd({super.key, required this.image});

  final ImageProvider image;

  @override
  Widget build(BuildContext context) {
    return
      Container(
        color: Colors.orange,
        width: 100,
        height: 100,
        child: Image(
          image: image,
        ),
      );


  }
}

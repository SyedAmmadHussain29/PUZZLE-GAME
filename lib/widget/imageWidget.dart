import 'package:flutter/material.dart';

class imageDisplay extends StatelessWidget {
  imageDisplay(this.imagePath, {super.key});
  String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 400,
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(imagePath), fit: BoxFit.fill)),
    );
  }
}

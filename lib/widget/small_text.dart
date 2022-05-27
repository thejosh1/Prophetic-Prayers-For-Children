import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String text;
  double size;
  final Color color;
  SmallText({Key? key, required this.text, this.color = Colors.black, this.size = 16}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontSize: size
      ),
    );
  }
}

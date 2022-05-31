import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String label;
  final Color color;
  //final Function ontap;
  const MyButton({Key? key, required this.label, this.color=Colors.deepOrangeAccent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white
          ),
        ),
      ),
    );
  }
}

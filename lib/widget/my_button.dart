import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String label;
  //final Function ontap;
  const MyButton({Key? key, required this.label,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.deepOrangeAccent,
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
    );
  }
}

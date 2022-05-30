import 'package:flutter/material.dart';
import 'package:prophetic_prayers_for_children/utils/ui.dart';
import 'package:prophetic_prayers_for_children/widget/big_text.dart';

class InputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  const InputField({Key? key, required this.title, required this.hint,this.controller, this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(text: title, color: Colors.deepOrangeAccent,),
          SizedBox(height: 10,),
          Container(
            height: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.deepOrangeAccent, width: 1.0)
            ),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: TextFormField(
                        readOnly: widget==null?false:true,
                        autofocus: false,
                        cursorColor: Colors.grey[700],
                        controller: controller,
                        style: SubHeadingStyle,
                        decoration: InputDecoration(
                          hintText: hint,
                          hintStyle: SubHeadingStyle,
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 0
                            )
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 0
                            )
                          )
                        ),
                      )
                  ),
                  widget==null?Container():Container(child: widget,)
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:prophetic_prayers_for_children/utils/ui.dart';
import 'package:prophetic_prayers_for_children/widget/input_field.dart';

class SetReminders extends StatefulWidget {
  const SetReminders({Key? key}) : super(key: key);

  @override
  State<SetReminders> createState() => _SetRemindersState();
}

class _SetRemindersState extends State<SetReminders> {
  final DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 100),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Add Task", style: HeadingStyle, ),
              Column(
                children: [
                  SizedBox(height: 20,),
                  InputField(title: "Title", hint: "Enter Your Title"),
                ],
              ),
              Column(
                children: [
                  SizedBox(height: 20,),
                  InputField(title: "Note", hint: "Enter Your Note"),
                ],
              ),
              Column(
                children: [
                  SizedBox(height: 20,),
                  InputField(title: "Date", hint: DateFormat.Hm().format(DateTime.now()), widget: IconButton(onPressed: (){}, icon: Icon(Icons.calendar_today_outlined, size: 14, color: Colors.grey[600],)),),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
      ),
      actions: [

      ],
    );
  }
}



